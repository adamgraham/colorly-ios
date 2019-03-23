//
//  UIColor+LAB.swift
//  ColorPalette
//
//  Created by Adam Graham on 12/18/18.
//  Copyright © 2018 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIE-LAB colors.
public extension UIColor {

    /// Standard daylight illuminate, sRGB, Adobe-RGB
    private static let d65: (x: CGFloat, y: CGFloat, z: CGFloat) = (0.9504, 1.0000, 1.0888)

    /// The components of a color in the CIE-LAB color model.
    ///
    /// - **L** – lightness
    /// - **a** – color channel for green-red
    /// - **b** – color channel for blue-yellow
    typealias LAB = (
        L: CGFloat, // 0 to 100 (darkest to brightest)
        a: CGFloat, // -128 to 128 (green to red)
        b: CGFloat  // -128 to 128 (blue to yellow)
    )

    /// The components of the color in the CIE-LAB color model.
    var lab: LAB {
        let fn = { (t: CGFloat) -> CGFloat in
            if t > 0.008856 {
                return pow(t, 1.0 / 3.0)
            } else {
                return (7.787 * t) + (16.0 / 116.0)
            }
        }

        let r = UIColor.d65
        let xyz = self.xyz

        let rx = fn(xyz.x / r.x)
        let ry = fn(xyz.y / r.y)
        let rz = fn(xyz.z / r.z)

        let L = (116.0 * ry) - 16.0
        let a = 500.0 * (rx - ry)
        let b = 200.0 * (ry - rz)

        return LAB(L: L, a: a, b: b)
    }

    /// Initializes a color from the components of a CIE-LAB color model.
    convenience init(lab: LAB, alpha: CGFloat = 1.0) {
        let fn = { (t: CGFloat) -> CGFloat in
            let t³ = pow(t, 3.0)
            if t³ > 0.008856 {
                return t³
            } else {
                return (t - (16.0 / 116.0)) / 7.787
            }
        }

        let r = UIColor.d65

        var y = (lab.L + 16.0) / 116.0
        var x = (lab.a / 500.0) + y
        var z = y - (lab.b / 200.0)

        x = fn(x) * r.x
        y = fn(y) * r.y
        z = fn(z) * r.z

        self.init(xyz: XYZ(x: x, y: y, z: z), alpha: alpha)
    }

}
