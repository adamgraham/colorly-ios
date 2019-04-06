//
//  UIColor+ARGB.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from ARGB (alpha, red, green, blue) colors.
public extension UIColor {

    /// The components of a color in the RGB color model using the ARGB format.
    typealias ARGB = (
        alpha: CGFloat, // 0 to 1
        red: CGFloat,   // 0 to 255
        green: CGFloat, // 0 to 255
        blue: CGFloat   // 0 to 255
    )

    /// The components of the color in the RGB color model using the ARGB format.
    var argb: ARGB {
        var (a, r, g, b) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: &a)

        return ARGB(alpha: a,
                    red: r * 255.0,
                    green: g * 255.0,
                    blue: b * 255.0)
    }

    /// Initializes a color from the components of a RGB color model using the ARGB format.
    convenience init(argb: ARGB) {
        self.init(red: argb.red / 255.0,
                  green: argb.green / 255.0,
                  blue: argb.blue / 255.0,
                  alpha: argb.alpha)
    }

}
