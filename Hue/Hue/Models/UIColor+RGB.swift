//
//  UIColor+RGB.swift
//  ColorPalette
//
//  Created by Adam Graham on 12/18/18.
//  Copyright © 2018 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to instantiate and represent colors as RGB (red, green, blue).
public extension UIColor {

    /// The components of a color in the RGB color model.
    typealias RGB = (
        red: CGFloat,   // 0 to 1 (% of 255)
        green: CGFloat, // 0 to 1 (% of 255)
        blue: CGFloat   // 0 to 1 (% of 255)
    )

    /// The components of the color in the RGB color model.
    var rgb: RGB {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0

        getRed(&r, green: &g, blue: &b, alpha: nil)
        return RGB(red: r, green: g, blue: b)
    }

    /// Initializes a color from the components of a RGB color model.
    convenience init(rgb: RGB, alpha: CGFloat = 1.0) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue, alpha: alpha)
    }

}
