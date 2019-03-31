//
//  UIColor+RGBA.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to instantiate and represent colors as RGBA (red, green, blue, alpha).
public extension UIColor {

    /// The components of a color in the RGB color model using the RGBA format.
    typealias RGBA = (
        red: CGFloat,   // 0 to 255
        green: CGFloat, // 0 to 255
        blue: CGFloat,  // 0 to 255
        alpha: CGFloat  // 0 to 1
    )

    /// The components of the color in the RGB color model using the RGBA format.
    var rgba: RGBA {
        var (r, g, b, a) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: &a)

        return RGBA(red: r * 255.0,
                    green: g * 255.0,
                    blue: b * 255.0,
                    alpha: a)
    }

    /// Initializes a color from the components of a RGB color model using the RGBA format.
    convenience init(rgba: RGBA) {
        self.init(red: rgba.red / 255.0,
                  green: rgba.green / 255.0,
                  blue: rgba.blue / 255.0,
                  alpha: rgba.alpha)
    }

}
