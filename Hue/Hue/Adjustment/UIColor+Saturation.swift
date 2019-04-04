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
     Returns a new color after increasing the saturation value by a given percent.

     - parameter percent: The amount to saturate the color.
     - returns: The new color after increasing the saturation value.
     */
    func saturated(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.saturation = clamp(hsl.saturation + percent, 0.0, 1.0)
        return UIColor(hsl: hsl, alpha: self.alphaComponent)
    }

    /**
     Returns a new color after decreasing the saturation value by a given percent.

     - parameter percent: The amount to desaturate the color.
     - returns: The new color after decreasing the saturation value.
     */
    func desaturated(percent: CGFloat = 0.1) -> UIColor {
        var hsl = self.hsl
        hsl.saturation = clamp(hsl.saturation - percent, 0.0, 1.0)
        return UIColor(hsl: hsl, alpha: self.alphaComponent)
    }

    /**
     Returns a new color after being fully desaturated.

     - returns: The new color after being fully desaturated.
     */
    func grayscaled() -> UIColor {
        return desaturated(percent: 1.0)
    }

}
