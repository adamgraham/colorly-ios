//
//  UIColor+CIE_LUV.swift
//  Hue
//
//  Created by Adam Graham on 5/13/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIELUV colors.
public extension UIColor {

    /// The CIELUV components of a color - lightness (L) and chromaticity (u,v).
    struct CIE_LUV: Equatable {

        /// The lightness component of the color, in the range [0, 100] (darkest to brightest).
        public var L: CGFloat
        /// The u-chromaticity coordinate of the color, in the range [-100, 100].
        public var u: CGFloat
        /// The v-chromaticity coordinate of the color, in the range [-100, 100].
        public var v: CGFloat

    }

    /// A set of constant values used to convert to and from CIELUV colors.
    private struct Constant {

        static let ⅓: CGFloat = 1.0 / 3.0
        static let ϵ: CGFloat = 216.0 / 24389.0
        static let κ: CGFloat = 24389.0 / 27.0

        static let fu = { (XYZ: UIColor.Tristimulus) -> CGFloat in
            return (4.0 * XYZ.X) / (XYZ.X + (15.0 * XYZ.Y) + (3.0 * XYZ.Z))
        }

        static let fv = { (XYZ: UIColor.Tristimulus) -> CGFloat in
            return (9.0 * XYZ.Y) / (XYZ.X + (15.0 * XYZ.Y) + (3.0 * XYZ.Z))
        }

    }

    /// The CIELUV components of the color using a d65 illuminant and standard 2° observer.
    var Luv: CIE_LUV {
        return self.Luv(illuminant: .d65, observer: .two)
    }

    /// The CIELUV components of the color using a given illuminant and standard observer.
    /// - parameter illuminant: The illuminant used to calculate tristimulus values.
    /// - parameter observer: The standard observer used to calculate tristimulus values.
    func Luv(illuminant: Illuminant, observer: StandardObserver) -> CIE_LUV {
        let fu = Constant.fu
        let fv = Constant.fv
        let fL = { (t: CGFloat) -> CGFloat in
            if t <= Constant.ϵ { return t * Constant.κ }
            return 116.0 * pow(t, Constant.⅓) - 16.0
        }

        let XYZ = self.XYZ
        let ref = illuminant.whitePoint(for: observer)

        let L = fL(XYZ.Y / ref.Y)
        var u = 13.0 * L * (fu(XYZ) - fu(ref))
        var v = 13.0 * L * (fv(XYZ) - fv(ref))

        if u.isNaN { u = 0.0 }
        if v.isNaN { v = 0.0 }

        return CIE_LUV(L: L, u: u, v: v)
    }

    /// Initializes a color from CIELUV components.
    /// - parameter Luv: The components used to initialize the color.
    /// - parameter illuminant: The illuminant used to calculate tristimulus values.
    /// - parameter observer: The standard observer used calculate tristimulus values.
    /// - parameter alpha: The alpha value of the color.
    convenience init(Luv: CIE_LUV,
                     illuminant: Illuminant = .d65,
                     observer: StandardObserver = .two,
                     alpha: CGFloat = 1.0) {

        let fu = Constant.fu
        let fv = Constant.fv
        let fL = { (t: CGFloat) -> CGFloat in
            if t <= Constant.κ * Constant.ϵ { return t / Constant.κ }
            return pow((t + 16.0) / 116.0, 3.0)
        }

        let ref = illuminant.whitePoint(for: observer)

        let u = Luv.u / (13.0 * Luv.L) + fu(ref)
        let v = Luv.v / (13.0 * Luv.L) + fv(ref)

        let Y = fL(Luv.L) * 100.0
        var X = (-9.0 * Y * u) / ((u - 4.0) * v - (u * v))
        var Z = (9.0 * Y - (15.0 * v * Y) - (v * X)) / (3.0 * v)

        if X.isNaN { X = 0.0 }
        if Z.isNaN { Z = 0.0 }

        self.init(XYZ: CIE_XYZ(X: X, Y: Y, Z: Z), alpha: alpha)
    }

}
