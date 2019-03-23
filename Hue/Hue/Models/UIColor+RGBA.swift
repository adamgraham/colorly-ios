//
//  UIColor+RGBA.swift
//  ColorPalette
//
//  Created by Adam Graham on 1/14/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to instantiate and represent colors as RGBA (red, green, blue, alpha).
public extension UIColor {

    /// The components of a color in the RGB color model using the RGBA format.
    typealias RGBA = (
        red: CGFloat,   // 0 to 1 (% of 255)
        green: CGFloat, // 0 to 1 (% of 255)
        blue: CGFloat,  // 0 to 1 (% of 255)
        alpha: CGFloat  // 0 to 1 (%)
    )

    /// The components of the color in the RGB color model using the RGBA format.
    var rgba: RGBA {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0

        getRed(&r, green: &g, blue: &b, alpha: &a)
        return RGBA(red: r, green: g, blue: b, alpha: a)
    }

    /// Initializes a color from the components of a RGB color model using the RGBA format.
    convenience init(rgba: RGBA) {
        self.init(red: rgba.red, green: rgba.green, blue: rgba.blue, alpha: rgba.alpha)
    }

}
