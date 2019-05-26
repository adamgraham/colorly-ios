//
//  UIColor+Mixing.swift
//  Hue
//
//  Created by Adam Graham on 3/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to mix colors together.
public extension UIColor {

    /**
     Returns a mixture of two colors with a given weight.

     - parameter first: The first color to be mixed with the second color.
     - parameter second: The second color to be mixed with the first color.
     - parameter weight: The ratio of the second color mixed with the first color. The default value
                         of 0.5 indicates 50% of each color is mixed together. A value of 0.25
                         indicates 25% of the second color is mixed with 75% of the first color.

     - returns: The mixed color.
     */
    static func mixing(_ first: UIColor, with second: UIColor, weight: CGFloat = 0.5) -> UIColor {
        let weight = clamp(weight, 0.0, 1.0)

        var (r1, g1, b1, a1) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        first.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)

        var (r2, g2, b2, a2) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        second.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

        let red   = r1 + ((r2 - r1) * weight)
        let green = g1 + ((g2 - g1) * weight)
        let blue  = b1 + ((b2 - b1) * weight)
        let alpha = a1 + ((a2 - a1) * weight)

        return UIColor(red: clamp(red, 0.0, 1.0),
                       green: clamp(green, 0.0, 1.0),
                       blue: clamp(blue, 0.0, 1.0),
                       alpha: clamp(alpha, 0.0, 1.0))
    }

    /**
     Returns a mixture of the source color with another color.

     - parameter color: The other color to be mixed with the source color.
     - parameter weight: The ratio of the second color (other) mixed with the first color (source).
                         The default value of 0.5 indicates 50% of each color is mixed together. A
                         value of 0.25 indicates 25% of the second color is mixed with 75% of the
                         first color.

     - returns: The mixed color.
     */
    func mixed(with color: UIColor, weight: CGFloat = 0.5) -> UIColor {
        return UIColor.mixing(self, with: color, weight: weight)
    }

}
