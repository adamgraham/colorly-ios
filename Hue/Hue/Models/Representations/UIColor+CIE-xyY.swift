//
//  UIColor+CIE-xyY.swift
//  Hue
//
//  Created by Adam Graham on 5/6/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIE-xyY colors.
public extension UIColor {

    /// The components of a color in the CIE-xyY color space.
    struct CIE_xyY: Equatable {

        /// The x-chromaticity component of the color, in the range [0, 1].
        public var x: CGFloat
        /// The y-chromaticity component of the color, in the range [0, 1].
        public var y: CGFloat
        /// The luminance component of the color, in the range [0, 100].
        public var Y: CGFloat

    }

    /// The components of the color in the CIE-xyY color space.
    var xyY: CIE_xyY {
        let XYZ = self.XYZ
        let sum = XYZ.X + XYZ.Y + XYZ.Z
        let x = XYZ.X / sum
        let y = XYZ.Y / sum

        return CIE_xyY(x: x.isNaN ? 0.0 : x,
                       y: y.isNaN ? 0.0 : y,
                       Y: XYZ.Y)
    }

    /// Initializes a color from the components of a color in the CIE-xyY color space.
    convenience init(xyY: CIE_xyY, alpha: CGFloat = 1.0) {
        if xyY.y == 0.0 {
            self.init(XYZ: CIE_XYZ(X: 0.0, Y: 0.0, Z: 0.0), alpha: alpha)
        } else {
            /// xyY to XYZ conversion
            let X = (xyY.x * xyY.Y) / xyY.y
            let Y = xyY.Y
            let Z = ((1.0 - xyY.x - xyY.y) * xyY.Y) / xyY.y
            self.init(XYZ: CIE_XYZ(X: X, Y: Y, Z: Z), alpha: alpha)
        }
    }

}
