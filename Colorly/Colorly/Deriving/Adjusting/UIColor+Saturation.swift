//
//  UIColor+Saturation.swift
//  Colorly
//
//  Created by Adam Graham on 4/3/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to increase and decrease the saturation of a color.
public extension UIColor {

    /// Returns a new instance of the color with increased saturation.
    /// - parameter percent: The amount to saturate the color, in the range [0, 1].
    /// - returns: The saturated color.
    func saturated(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.saturation = clamp(hsl.saturation + (percent * 100.0), 0.0, 100.0)
        return UIColor(hsl, alpha: self.alphaComponent)
    }

    /// Returns a new instance of the color with decreased saturation.
    /// - parameter percent: The amount to desaturate the color, in the range [0, 1].
    /// - returns: The desaturated color.
    func desaturated(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.saturation = clamp(hsl.saturation - (percent * 100.0), 0.0, 100.0)
        return UIColor(hsl, alpha: self.alphaComponent)
    }

    /// Returns a new instance of the color with 0% saturation.
    /// - returns: The grayscaled color.
    func grayscaled() -> UIColor {
        return desaturated(percent: 1.0)
    }

}
