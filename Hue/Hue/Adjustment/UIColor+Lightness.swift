//
//  UIColor+Lightness.swift
//  Hue
//
//  Created by Adam Graham on 4/3/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to increase or decrease the lightness value of a color.
public extension UIColor {

    /**
     Returns a new color by increasing the color's lightness value by a given amount.

     - parameter percent: The amount to lighten the color, in the range 0.0 to 1.0.
     - returns: The lighter color.
     */
    func lighter(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.lightness = clamp(hsl.lightness + percent, 0.0, 1.0)
        return UIColor(hsl: hsl, alpha: self.alphaComponent)
    }

    /**
     Returns a new color by decreasing the color's lightness value by a given amount.

     - parameter percent: The amount to darken the color, in the range 0.0 to 1.0.
     - returns: The darker color.
     */
    func darker(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.lightness = clamp(hsl.lightness - percent, 0.0, 1.0)
        return UIColor(hsl: hsl, alpha: self.alphaComponent)
    }
    
}
