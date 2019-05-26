//
//  UIColor+Lightness.swift
//  Hue
//
//  Created by Adam Graham on 4/3/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to increase and decrease the lightness of a color.
public extension UIColor {

    /// Returns a new instance of the color with increased lightness.
    /// - parameter percent: The amount to lighten the color, in the range [0, 1].
    /// - returns: The lighter color.
    func lighter(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.lightness = clamp(hsl.lightness + (percent * 100.0), 0.0, 100.0)
        return UIColor(hsl, alpha: self.alphaComponent)
    }

    /// Returns a new instance of the color with decreased lightness.
    /// - parameter percent: The amount to darken the color, in the range [0, 1].
    /// - returns: The darker color.
    func darker(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.lightness = clamp(hsl.lightness - (percent * 100.0), 0.0, 100.0)
        return UIColor(hsl, alpha: self.alphaComponent)
    }
    
}
