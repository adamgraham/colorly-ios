//
//  UIColor+LAB.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIE-LAB colors.
public extension UIColor {

    /// A set of constant values used to convert to and from CIE-LAB colors.
    private struct Constant {

        static let ⅓: CGFloat = 1.0 / 3.0
        static let ⁴୵₂₉: CGFloat = 4.0 / 29.0
        static let δ: CGFloat = 6.0 / 29.0
        static let δ² = δ * δ
        static let δ³ = δ * δ * δ
        static let δ²3 = δ * δ * 3.0

    }

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
            if t > Constant.δ³ { return pow(t, Constant.⅓) }
            return (t / Constant.δ²3) + Constant.⁴୵₂₉
        }

        let r = UIColor.Illuminant.d65.twoDegrees
        let xyz = self.xyz

        let fx = fn(xyz.x / 100.0 / r.x)
        let fy = fn(xyz.y / 100.0 / r.y)
        let fz = fn(xyz.z / 100.0 / r.z)

        let L = (116.0 * fy) - 16.0
        let a = 500.0 * (fx - fy)
        let b = 200.0 * (fy - fz)

        return LAB(L: L, a: a, b: b)
    }

    /// Initializes a color from the components of a CIE-LAB color model.
    convenience init(lab: LAB, alpha: CGFloat = 1.0) {
        let fn = { (t: CGFloat) -> CGFloat in
            if t > Constant.δ { return pow(t, 3.0) }
            return Constant.δ²3 * (t - Constant.⁴୵₂₉)
        }

        let r = UIColor.Illuminant.d65.twoDegrees
        let L = (lab.L + 16.0) / 116.0
        let a = L + (lab.a / 500.0)
        let b = L - (lab.b / 200.0)

        let x = r.x * fn(a) * 100.0
        let y = r.y * fn(L) * 100.0
        let z = r.z * fn(b) * 100.0

        self.init(xyz: XYZ(x: x, y: y, z: z), alpha: alpha)
    }

}
