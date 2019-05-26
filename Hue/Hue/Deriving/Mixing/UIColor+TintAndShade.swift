//
//  UIColor+TintAndShade.swift
//  Hue
//
//  Created by Adam Graham on 3/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to mix colors with black (shade), white (tint), and gray (tone).
public extension UIColor {

    /**
     Returns a mixture of the color with black, decreasing lightness.

     - parameter percent: The amount of black mixed with the color, in the range [0, 1].
     - returns: The shaded color after mixing with black.
     */
    func shade(percent: CGFloat = 0.1) -> UIColor {
        return mixed(with: .black, weight: percent)
    }

    /**
     Returns a mixture of the color with white, increasing lightness.

     - parameter percent: The amount of white mixed with the color, in the range [0, 1].
     - returns: The tinted color after mixing with white.
     */
    func tint(percent: CGFloat = 0.1) -> UIColor {
        return mixed(with: .white, weight: percent)
    }

    /**
     Returns a mixture of the color with gray, decreasing saturation.

     - parameter percent: The amount of gray mixed with the color, in the range [0, 1].
     - returns: The toned color after mixing with gray.
     */
    func tone(percent: CGFloat = 0.1) -> UIColor {
        return mixed(with: .gray, weight: percent)
    }

}
