//
//  UIColor+Saturation.swift
//  Hue
//
//  Created by Adam Graham on 4/3/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to increase or decrease the saturation value of a color.
public extension UIColor {

    /**
     Returns a new color by increasing the color's saturation value by a given amount.

     - parameter percent: The amount to saturate the color, in the range 0.0 to 1.0.
     - returns: The saturated color.
     */
    func saturated(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.saturation = clamp(hsl.saturation + percent, 0.0, 1.0)
        return UIColor(hsl: hsl, alpha: self.alphaComponent)
    }

    /**
     Returns a new color by decreasing the color's saturation value by a given amount.

     - parameter percent: The amount to desaturate the color, in the range 0.0 to 1.0.
     - returns: The desaturated color.
     */
    func desaturated(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.saturation = clamp(hsl.saturation - percent, 0.0, 1.0)
        return UIColor(hsl: hsl, alpha: self.alphaComponent)
    }

    /**
     Returns a new color by fully desaturating the color.

     - returns: The grayscaled color.
     */
    func grayscaled() -> UIColor {
        return desaturated(percent: 1.0)
    }

}
