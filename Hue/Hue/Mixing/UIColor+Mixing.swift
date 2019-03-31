//
//  UIColor+Mixing.swift
//  Hue
//
//  Created by Adam Graham on 3/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

public extension UIColor {

    /**
     Returns a mixture of the source color with another color.

     - parameter color: The color to be mixed with the source color.
     - parameter weight: The ratio of the color mixed with the source color. The default value of 0.5
                         indicates half of each color is mixed together. A value of 0.25 indicates
                         one quarter of the color is mixed with three quarters of the source color.

     - returns: The newly mixed color.
     */
    func mixed(with color: UIColor, weight: CGFloat = 0.5) -> UIColor {
        let weight = clamp(weight, 0.0, 1.0)

        var (r1, g1, b1, a1) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)

        var (r2, g2, b2, a2) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

        let red   = r1 + ((r2 - r1) * weight)
        let green = g1 + ((g2 - g1) * weight)
        let blue  = b1 + ((b2 - b1) * weight)
        let alpha = a1 + ((a2 - a1) * weight)

        return UIColor(red: clamp(red, 0.0, 1.0),
                       green: clamp(green, 0.0, 1.0),
                       blue: clamp(blue, 0.0, 1.0),
                       alpha: clamp(alpha, 0.0, 1.0))
    }

}
