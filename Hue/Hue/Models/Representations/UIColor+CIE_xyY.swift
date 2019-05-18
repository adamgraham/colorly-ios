//
//  UIColor+CIE_xyY.swift
//  Hue
//
//  Created by Adam Graham on 5/6/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIE xyY colors.
public extension UIColor {

    /// The CIE xyY components of a color - chromaticity (x,y) and luminance (Y).
    struct CIE_xyY: Equatable {

        /// The x-chromaticity component of the color, in the range [0, 1].
        public var x: CGFloat
        /// The y-chromaticity component of the color, in the range [0, 1].
        public var y: CGFloat
        /// The luminance component of the color, in the range [0, 100].
        public var Y: CGFloat

    }

    /// The CIE xyY components of the color.
    var xyY: CIE_xyY {
        let XYZ = self.XYZ
        let sum = XYZ.X + XYZ.Y + XYZ.Z

        guard sum != 0.0 else {
            return CIE_xyY(x: 0.0, y: 0.0, Y: XYZ.Y)
        }

        let x = XYZ.X / sum
        let y = XYZ.Y / sum

        return CIE_xyY(x: x, y: y, Y: XYZ.Y)
    }

    /// Initializes a color from CIE xyY components.
    /// - parameter xyY: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(xyY: CIE_xyY, alpha: CGFloat = 1.0) {
        guard xyY.y != 0.0 else {
            self.init(XYZ: CIE_XYZ(X: 0.0, Y: xyY.Y, Z: 0.0), alpha: alpha)
            return
        }

        let X = (xyY.x * xyY.Y) / xyY.y
        let Y = xyY.Y
        let Z = ((1.0 - xyY.x - xyY.y) * xyY.Y) / xyY.y

        self.init(XYZ: CIE_XYZ(X: X, Y: Y, Z: Z), alpha: alpha)
    }

}
