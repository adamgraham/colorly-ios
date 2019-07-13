//
//  UIColor+CIELUV.swift
//  Colorly
//
//  Created by Adam Graham on 5/13/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIELUV colors.
public extension UIColor {

    // MARK: CIELUV

    /// The CIELUV components of a color - lightness (L) and chromaticity (u,v).
    struct CIELUV: Hashable {

        /// The lightness component of the color, in the range [0, 100] (darkest to brightest).
        public var L: CGFloat
        /// The green-red chromaticity component of the color, typically in the range [-100, 100].
        public var u: CGFloat
        /// The blue-yellow chromaticity component of the color, typically in the range [-100, 100].
        public var v: CGFloat

        /// Initializes the CIELUV components of a color - lightness (L) and chromaticity (u,v).
        /// - parameter L: The lightness component of the color, in the range [0, 100] (darkest to brightest).
        /// - parameter u: The green-red chromaticity component of the color, typically in the range [-100, 100].
        /// - parameter v: blue-yellow chromaticity component of the color, typically in the range [-100, 100].
        public init(L: CGFloat, u: CGFloat, v: CGFloat) {
            self.L = L
            self.u = u
            self.v = v
        }

    }

    /// Constant values used to convert to and from CIELUV colors.
    private struct Constant {

        static let ⅓: CGFloat = 1.0 / 3.0
        static let ϵ: CGFloat = 216.0 / 24389.0
        static let κ: CGFloat = 24389.0 / 27.0

        static func fu(_ XYZ: Tristimulus) -> CGFloat {
            return (4.0 * XYZ.X) / (XYZ.X + (15.0 * XYZ.Y) + (3.0 * XYZ.Z))
        }

        static func fv(_ XYZ: Tristimulus) -> CGFloat {
            return (9.0 * XYZ.Y) / (XYZ.X + (15.0 * XYZ.Y) + (3.0 * XYZ.Z))
        }

    }

    /// The CIELUV components of the color using a d65 illuminant and 2° standard observer.
    var Luv: CIELUV {
        return Luv(illuminant: .d65, observer: .two)
    }

    /**
     The CIELUV components of the color using a given illuminant and standard observer.

     - parameter illuminant: The illuminant used to calculate tristimulus values.
     - parameter observer: The standard observer used to calculate tristimulus values.

     - returns: The CIELUV components of the color.
     */
    func Luv(illuminant: Illuminant, observer: StandardObserver) -> CIELUV {
        func fL(_ t: CGFloat) -> CGFloat {
            if t <= Constant.ϵ { return t * Constant.κ }
            return 116.0 * pow(t, Constant.⅓) - 16.0
        }

        let XYZ = self.XYZ
        let ref = illuminant.whitePoint(for: observer)

        var L = fL(XYZ.Y / ref.Y)
        var u = 13.0 * L * (Constant.fu(XYZ) - Constant.fu(ref))
        var v = 13.0 * L * (Constant.fv(XYZ) - Constant.fv(ref))

        if L.isNaN { L = 0.0 }
        if u.isNaN { u = 0.0 }
        if v.isNaN { v = 0.0 }

        return CIELUV(L: L, u: u, v: v)
    }

    /**
     Initializes a color from CIELUV components.

     - parameter Luv: The components used to initialize the color.
     - parameter illuminant: The illuminant used to calculate tristimulus values.
     - parameter observer: The standard observer used calculate tristimulus values.
     - parameter alpha: The alpha value of the color.
     */
    convenience init(_ Luv: CIELUV,
                     illuminant: Illuminant = .d65,
                     observer: StandardObserver = .two,
                     alpha: CGFloat = 1.0) {

        func fL(_ t: CGFloat) -> CGFloat {
            if t <= Constant.κ * Constant.ϵ { return t / Constant.κ }
            return pow((t + 16.0) / 116.0, 3.0)
        }

        let ref = illuminant.whitePoint(for: observer)

        let u = Luv.u / (13.0 * Luv.L) + Constant.fu(ref)
        let v = Luv.v / (13.0 * Luv.L) + Constant.fv(ref)

        var Y = fL(Luv.L) * 100.0
        var X = (-9.0 * Y * u) / ((u - 4.0) * v - (u * v))
        var Z = (9.0 * Y - (15.0 * v * Y) - (v * X)) / (3.0 * v)

        if X.isNaN { X = 0.0 }
        if Y.isNaN { Y = 0.0 }
        if Z.isNaN { Z = 0.0 }

        self.init(CIEXYZ(X: X, Y: Y, Z: Z), alpha: alpha)
    }

}
