//
//  UIColor+CIELAB.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIELAB colors.
public extension UIColor {

    /// The CIELAB components of a color - lightness (L) and chromaticity (a,b).
    struct CIELAB: Hashable {

        /// The lightness component of the color, in the range [0, 100] (darkest to brightest).
        public var L: CGFloat
        /// The red-green chromaticity component of the color, in the range [-128, 128].
        public var a: CGFloat
        /// The blue-yellow chromaticity component of the color, in the range [-128, 128].
        public var b: CGFloat

    }

    /// Constant values used to convert to and from CIELAB colors.
    private struct Constant {

        static let ⅓: CGFloat = 1.0 / 3.0
        static let ⁴୵₂₉: CGFloat = 4.0 / 29.0
        static let δ: CGFloat = 6.0 / 29.0
        static let δ³ = δ * δ * δ
        static let δ²3 = δ * δ * 3.0

    }

    /// The CIELAB components of the color using a d65 illuminant and standard 2° observer.
    var Lab: CIELAB {
        return self.Lab(illuminant: .d65, observer: .two)
    }

    /**
     The CIELAB components of the color using a given illuminant and standard observer.

     - parameter illuminant: The illuminant used to calculate tristimulus values.
     - parameter observer: The standard observer used to calculate tristimulus values.

     - returns: The CIELAB components of the color.
     */
    func Lab(illuminant: Illuminant, observer: StandardObserver) -> CIELAB {
        func fn(_ t: CGFloat) -> CGFloat {
            if t > Constant.δ³ { return pow(t, Constant.⅓) }
            return (t / Constant.δ²3) + Constant.⁴୵₂₉
        }

        let XYZ = self.XYZ
        let ref = illuminant.whitePoint(for: observer)

        let X = fn(XYZ.X / ref.X)
        let Y = fn(XYZ.Y / ref.Y)
        let Z = fn(XYZ.Z / ref.Z)

        let L = (116.0 * Y) - 16.0
        let a = 500.0 * (X - Y)
        let b = 200.0 * (Y - Z)

        return CIELAB(L: L, a: a, b: b)
    }

    /**
     Initializes a color from CIELAB components.

     - parameter Lab: The components used to initialize the color.
     - parameter illuminant: The illuminant used to calculate tristimulus values.
     - parameter observer: The standard observer used calculate tristimulus values.
     - parameter alpha: The alpha value of the color.
     */
    convenience init(_ Lab: CIELAB,
                     illuminant: Illuminant = .d65,
                     observer: StandardObserver = .two,
                     alpha: CGFloat = 1.0) {

        func fn(_ t: CGFloat) -> CGFloat {
            if t > Constant.δ { return pow(t, 3.0) }
            return Constant.δ²3 * (t - Constant.⁴୵₂₉)
        }

        let ref = illuminant.whitePoint(for: observer)

        let L = (Lab.L + 16.0) / 116.0
        let a = L + (Lab.a / 500.0)
        let b = L - (Lab.b / 200.0)

        let X = fn(a) * ref.X
        let Y = fn(L) * ref.Y
        let Z = fn(b) * ref.Z

        self.init(CIEXYZ(X: X, Y: Y, Z: Z), alpha: alpha)
    }

}
