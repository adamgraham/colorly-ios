//
//  UIColor+CIEUCS.swift
//  Hue
//
//  Created by Adam Graham on 5/29/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIEUCS colors.
public extension UIColor {

    /// The CIEUCS components of a color.
    struct CIEUCS: Hashable {

        /// The u-axis chromaticity coordinate of the color, in the range [0, 1].
        public var u: CGFloat
        /// The v-axis chromaticity coordinate of the color, in the range [0, 1].
        public var v: CGFloat

    }

    /// The CIEUCS components of the color.
    var ucs: CIEUCS {
        let XYZ = self.XYZ

        let U = (2.0 / 3.0) * XYZ.X
        let V = XYZ.Y
        let W = 0.5 * (-XYZ.X + (3.0 * XYZ.Y) + XYZ.Z)

        var u = U / (U + V + W)
        var v = V / (U + V + W)

        if u.isNaN { u = 0.0 }
        if v.isNaN { v = 0.0 }

        return CIEUCS(u: u, v: v)
    }

    /// Initializes a color from CIEUCS components.
    /// - parameter ucs: The components used to initialize the color.
    /// - parameter luminance: The luminance value of the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ ucs: CIEUCS, luminance: CGFloat = 1.0, alpha: CGFloat = 1.0) {
        let V = luminance
        var U = V * ucs.u / ucs.v
        var W = -V * (ucs.u + ucs.v - 1.0) / ucs.v

        if U.isNaN { U = 0.0 }
        if W.isNaN { W = 0.0 }

        let X = ((3.0 / 2.0) * U) * 100.0
        let Y = V * 100.0
        let Z = (((3.0 / 2.0) * U) - (3.0 * V) + (2.0 * W)) * 100.0

        self.init(CIEXYZ(X: X, Y: Y, Z: Z), alpha: alpha)
    }

}
