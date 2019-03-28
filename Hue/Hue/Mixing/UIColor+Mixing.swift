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
        let c1 = self.rgba
        let c2 = color.rgba

        let red   = c1.red   + ((c2.red   - c1.red)   * weight)
        let green = c1.green + ((c2.green - c1.green) * weight)
        let blue  = c1.blue  + ((c2.blue  - c1.blue)  * weight)
        let alpha = c1.alpha + ((c2.alpha - c1.alpha) * weight)

        return UIColor(red: clamp(red, 0.0, 1.0),
                       green: clamp(green, 0.0, 1.0),
                       blue: clamp(blue, 0.0, 1.0),
                       alpha: clamp(alpha, 0.0, 1.0))
    }

}
