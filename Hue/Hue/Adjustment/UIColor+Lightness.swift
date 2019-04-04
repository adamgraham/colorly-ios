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
     Returns a new color after increasing the lightness value by a given percent.

     - parameter percent: The amount to lighten the color.
     - returns: The new lighter color after increasing the lightness value.
     */
    func lighter(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.lightness = clamp(hsl.lightness + percent, 0.0, 1.0)
        return UIColor(hsl: hsl, alpha: self.alphaComponent)
    }

    /**
     Returns a new color after decreasing the lightness value by a given percent.

     - parameter percent: The amount to darken the color.
     - returns: The new darker color after decreasing the lightness value.
     */
    func darker(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.lightness = clamp(hsl.lightness - percent, 0.0, 1.0)
        return UIColor(hsl: hsl, alpha: self.alphaComponent)
    }
    
}
