//
//  UIColor+CIE-LAB.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIE-LAB colors.
public extension UIColor {

    /// The components of a color in the CIE-LAB color model.
    struct CIE_LAB: Equatable {

        /// The L (lightness) component of the color, in the range [0, 100] (darkest to brightest).
        public var L: CGFloat
        /// The a component of the color, the color channel for green-red, in the range [-128, 128].
        public var a: CGFloat
        /// The b component of the color, the color channel for blue-yellow, in the range [-128, 128].
        public var b: CGFloat

    }

    /// A set of constant values used to convert to and from CIE-LAB colors.
    private struct Constant {

        static let ⅓: CGFloat = 1.0 / 3.0
        static let ⁴୵₂₉: CGFloat = 4.0 / 29.0
        static let δ: CGFloat = 6.0 / 29.0
        static let δ² = δ * δ
        static let δ³ = δ * δ * δ
        static let δ²3 = δ * δ * 3.0

    }

    /// The components of the color in the CIE-LAB color model using a d65 illuminant and
    /// standard 2° observer.
    var lab: CIE_LAB {
        return self.lab(illuminant: .d65, observer: .two)
    }

    /// The components of the color in the CIE-LAB color model for a given illuminant and
    /// standard observer.
    func lab(illuminant: UIColor.Illuminant, observer: UIColor.StandardObserver) -> CIE_LAB {
        let fn = { (t: CGFloat) -> CGFloat in
            if t > Constant.δ³ { return pow(t, Constant.⅓) }
            return (t / Constant.δ²3) + Constant.⁴୵₂₉
        }

        let XYZ = self.XYZ
        let r = illuminant.referenceValues(for: observer)
        let fx = fn(XYZ.X / 100.0 / r.X)
        let fy = fn(XYZ.Y / 100.0 / r.Y)
        let fz = fn(XYZ.Z / 100.0 / r.Z)

        let L = (116.0 * fy) - 16.0
        let a = 500.0 * (fx - fy)
        let b = 200.0 * (fy - fz)

        return CIE_LAB(L: L, a: a, b: b)
    }

    /// Initializes a color from the components of a CIE-LAB color model.
    convenience init(lab: CIE_LAB,
                     illuminant: UIColor.Illuminant = .d65,
                     observer: UIColor.StandardObserver = .two,
                     alpha: CGFloat = 1.0) {

        let fn = { (t: CGFloat) -> CGFloat in
            if t > Constant.δ { return pow(t, 3.0) }
            return Constant.δ²3 * (t - Constant.⁴୵₂₉)
        }

        let L = (lab.L + 16.0) / 116.0
        let a = L + (lab.a / 500.0)
        let b = L - (lab.b / 200.0)

        let r = illuminant.referenceValues(for: observer)
        let X = r.X * fn(a) * 100.0
        let Y = r.Y * fn(L) * 100.0
        let Z = r.Z * fn(b) * 100.0

        self.init(XYZ: CIE_XYZ(X: X, Y: Y, Z: Z), alpha: alpha)
    }

}
