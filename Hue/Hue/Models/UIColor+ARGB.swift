//
//  UIColor+ARGB.swift
//  ColorPalette
//
//  Created by Adam Graham on 1/14/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to instantiate and represent colors as ARGB (alpha, red, green, blue).
public extension UIColor {

    /// The components of a color in the RGB color model using the ARGB format.
    typealias ARGB = (
        alpha: CGFloat, // 0 to 1 (%)
        red: CGFloat,   // 0 to 1 (% of 255)
        green: CGFloat, // 0 to 1 (% of 255)
        blue: CGFloat   // 0 to 1 (% of 255)
    )

    /// The components of the color in the RGB color model using the ARGB format.
    var argb: ARGB {
        var a: CGFloat = 0.0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0

        getRed(&r, green: &g, blue: &b, alpha: &a)
        return ARGB(alpha: a, red: r, green: g, blue: b)
    }

    /// Initializes a color from the components of a RGB color model using the ARGB format.
    convenience init(argb: ARGB) {
        self.init(red: argb.red, green: argb.green, blue: argb.blue, alpha: argb.alpha)
    }

}
