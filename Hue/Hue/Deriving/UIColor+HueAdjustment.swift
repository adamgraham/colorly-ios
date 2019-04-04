//
//  UIColor+HueAdjustment.swift
//  Hue
//
//  Created by Adam Graham on 4/3/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to adjust the hue value of a color.
public extension UIColor {

    /**
     Returns a new color by adjusting the color's hue by a given amount.

     - parameter degrees: The amount to adjust the hue, in the range -360° to 360°.
     - returns: The hue adjusted color.
     */
    func adjustingHue(by degrees: CGFloat) -> UIColor {
        var hsl = self.hsl
        hsl.hue = (hsl.hue + degrees).truncatingRemainder(dividingBy: 360.0)
        return UIColor(hsl: hsl)
    }

    /// The color opposite on the color wheel, equivalant to adjusting the hue by 180°.
    var complement: UIColor {
        return adjustingHue(by: 180.0)
    }

}
