//
//  UIColor+CIE-XYZ.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIE-XYZ colors.
public extension UIColor {

    /// The components of a color in the CIE-XYZ color space.
    struct CIE_XYZ: Equatable {

        /// A mix of cone response curves chosen to be orthogonal to luminance and
        /// non-negative, in the range [0, 100].
        public var X: CGFloat
        /// The luminance component of the color, in the range [0, 100].
        public var Y: CGFloat
        /// Somewhat equal to blue stimulation, or the "S" cone response, in the range [0, 100].
        public var Z: CGFloat

    }

    /// The components of the color in the CIE-XYZ color space.
    var XYZ: CIE_XYZ {
        var (r, g, b) = (CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: nil)

        // sRGB (D65) gamma correction - inverse companding to get linear values
        r = (r > 0.04045) ? pow((r + 0.055) / 1.055, 2.4) : (r / 12.92)
        g = (g > 0.04045) ? pow((g + 0.055) / 1.055, 2.4) : (g / 12.92)
        b = (b > 0.04045) ? pow((b + 0.055) / 1.055, 2.4) : (b / 12.92)

        // sRGB (D65) matrix transformation
        // http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
        let X = (0.4124564 * r) + (0.3575761 * g) + (0.1804375 * b)
        let Y = (0.2126729 * r) + (0.7151522 * g) + (0.0721750 * b)
        let Z = (0.0193339 * r) + (0.1191920 * g) + (0.9503041 * b)

        return CIE_XYZ(X: X * 100.0,
                       Y: Y * 100.0,
                       Z: Z * 100.0)
    }

    /// Initializes a color from the components of a color in the CIE-XYZ color space.
    convenience init(XYZ: CIE_XYZ, alpha: CGFloat = 1.0) {
        let X = XYZ.X / 100.0
        let Y = XYZ.Y / 100.0
        let Z = XYZ.Z / 100.0

        // sRGB (D65) matrix transformation
        // http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
        var r =  (3.2404542 * X) - (1.5371385 * Y) - (0.4985314 * Z)
        var g = (-0.9692660 * X) + (1.8760108 * Y) + (0.0415560 * Z)
        var b =  (0.0556434 * X) - (0.2040259 * Y) + (1.0572252 * Z)

        // sRGB (D65) gamma correction - companding to get non-linear values
        let k: CGFloat = 1.0 / 2.4
        r = (r <= 0.0031308) ? (12.92 * r) : (1.055 * pow(r, k) - 0.055)
        g = (g <= 0.0031308) ? (12.92 * g) : (1.055 * pow(g, k) - 0.055)
        b = (b <= 0.0031308) ? (12.92 * b) : (1.055 * pow(b, k) - 0.055)

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
