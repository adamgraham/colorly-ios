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

    /// The components of a color in the CIE-XYZ color model.
    struct CIE_XYZ: Equatable {

        /// The x component of the color, a mix (a linear combination) of cone response curves
        /// chosen to be non-negative, in the range 0 to 100.
        public var x: CGFloat
        /// The y component of the color – luminance (perceived brightness) – in the range 0 to 100.
        public var y: CGFloat
        /// The z component of the color, quasi-equal to blue stimulation, or the "S" cone
        /// response, in the range 0 to 100.
        public var z: CGFloat

    }

    /// The components of the color in the CIE-XYZ color model.
    var xyz: CIE_XYZ {
        var (r, g, b) = (CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: nil)

        // sRGB (D65) gamma correction - inverse companding to get linear values
        r = (r > 0.04045) ? pow((r + 0.055) / 1.055, 2.4) : (r / 12.92)
        g = (g > 0.04045) ? pow((g + 0.055) / 1.055, 2.4) : (g / 12.92)
        b = (b > 0.04045) ? pow((b + 0.055) / 1.055, 2.4) : (b / 12.92)

        // sRGB (D65) matrix transformation
        // http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
        let x = (0.4124564 * r) + (0.3575761 * g) + (0.1804375 * b)
        let y = (0.2126729 * r) + (0.7151522 * g) + (0.0721750 * b)
        let z = (0.0193339 * r) + (0.1191920 * g) + (0.9503041 * b)

        return CIE_XYZ(x: x * 100.0,
                       y: y * 100.0,
                       z: z * 100.0)
    }

    /// Initializes a color from the components of a CIE-XYZ color model.
    convenience init(xyz: CIE_XYZ, alpha: CGFloat = 1.0) {
        let x = xyz.x / 100.0
        let y = xyz.y / 100.0
        let z = xyz.z / 100.0

        // sRGB (D65) matrix transformation
        // http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
        var r =  (3.2404542 * x) - (1.5371385 * y) - (0.4985314 * z)
        var g = (-0.9692660 * x) + (1.8760108 * y) + (0.0415560 * z)
        var b =  (0.0556434 * x) - (0.2040259 * y) + (1.0572252 * z)

        // sRGB (D65) gamma correction - companding to get non-linear values
        let k: CGFloat = 1.0/2.4
        r = (r <= 0.0031308) ? (12.92 * r) : (1.055 * pow(r, k) - 0.055)
        g = (g <= 0.0031308) ? (12.92 * g) : (1.055 * pow(g, k) - 0.055)
        b = (b <= 0.0031308) ? (12.92 * b) : (1.055 * pow(b, k) - 0.055)

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
