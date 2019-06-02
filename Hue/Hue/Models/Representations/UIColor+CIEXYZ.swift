//
//  UIColor+CIEXYZ.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIE 1931 XYZ colors.
public extension UIColor {

    /// The CIE 1931 XYZ components of a color - luminance (Y) and chromaticity (X,Z).
    struct CIEXYZ: Hashable {

        /// A mix of cone response curves chosen to be orthogonal to luminance and
        /// non-negative, in the range [0, 95.047].
        public var X: CGFloat
        /// The luminance component of the color, in the range [0, 100].
        public var Y: CGFloat
        /// Somewhat equal to blue, or the "S" cone response, in the range [0, 108.883].
        public var Z: CGFloat

    }

    /// The CIE 1931 XYZ components of the color.
    var XYZ: CIEXYZ {
        let rgb = self.linearRGB

        // sRGB (D65) matrix transformation
        // http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
        let X = (0.4124564 * rgb.r) + (0.3575761 * rgb.g) + (0.1804375 * rgb.b)
        let Y = (0.2126729 * rgb.r) + (0.7151522 * rgb.g) + (0.0721750 * rgb.b)
        let Z = (0.0193339 * rgb.r) + (0.1191920 * rgb.g) + (0.9503041 * rgb.b)

        return CIEXYZ(X: X * 100.0,
                      Y: Y * 100.0,
                      Z: Z * 100.0)
    }

    /// Initializes a color from CIE 1931 XYZ components.
    /// - parameter XYZ: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ XYZ: CIEXYZ, alpha: CGFloat = 1.0) {
        let X = XYZ.X / 100.0
        let Y = XYZ.Y / 100.0
        let Z = XYZ.Z / 100.0

        // sRGB (D65) matrix transformation
        // http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
        let r =  (3.2404542 * X) - (1.5371385 * Y) - (0.4985314 * Z)
        let g = (-0.9692660 * X) + (1.8760108 * Y) + (0.0415560 * Z)
        let b =  (0.0556434 * X) - (0.2040259 * Y) + (1.0572252 * Z)

        self.init(linear: (r, g, b), alpha: alpha)
    }

}
