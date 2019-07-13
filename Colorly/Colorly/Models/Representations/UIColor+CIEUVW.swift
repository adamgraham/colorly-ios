//
//  UIColor+CIEUVW.swift
//  Colorly
//
//  Created by Adam Graham on 5/29/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIE 1964 UVW colors.
public extension UIColor {

    // MARK: CIE 1964 UVW

    /// The CIE 1964 UVW components of a color - chromaticity (U,V) and lightness (W).
    struct CIEUVW: Hashable {

        /// The U chromaticity component of the color, typically in the range [-100, 100].
        public var U: CGFloat
        /// The V chromaticity component of the color, typically in the range [-100, 100].
        public var V: CGFloat
        /// The lightness component of the color, in the range [0, 100] (darkest to brightest).
        public var W: CGFloat

        /// Initializes the CIE 1964 UVW components of a color - chromaticity (U,V) and lightness (W).
        /// - parameter U: The U chromaticity component of the color, typically in the range [-100, 100].
        /// - parameter V: The V chromaticity component of the color, typically in the range [-100, 100].
        /// - parameter W: The lightness component of the color, in the range [0, 100] (darkest to brightest).
        public init(U: CGFloat, V: CGFloat, W: CGFloat) {
            self.U = U
            self.V = V
            self.W = W
        }

    }

    /// Constant values used to convert to and from CIE 1964 UVW colors.
    private struct Constant {

        static let ⅓: CGFloat = 1.0 / 3.0

        static func fu(_ XYZ: Tristimulus) -> CGFloat {
            return (4.0 * XYZ.X) / (XYZ.X + (15.0 * XYZ.Y) + (3.0 * XYZ.Z))
        }

        static func fv(_ XYZ: Tristimulus) -> CGFloat {
            return (6.0 * XYZ.Y) / (XYZ.X + (15.0 * XYZ.Y) + (3.0 * XYZ.Z))
        }

    }

    /// The CIE 1964 UVW components of the color using a d65 illuminant and 2° standard observer.
    var uvw: CIEUVW {
        return uvw(illuminant: .d65, observer: .two)
    }

    /**
     The CIE 1964 UVW components of the color using a given illuminant and standard observer.

     - parameter illuminant: The illuminant used to calculate tristimulus values.
     - parameter observer: The standard observer used to calculate tristimulus values.

     - returns: The CIE 1964 UVW components of the color.
     */
    func uvw(illuminant: Illuminant, observer: StandardObserver) -> CIEUVW {
        let XYZ = self.XYZ
        let ref = illuminant.whitePoint(for: observer)

        var W = 25.0 * pow(XYZ.Y, Constant.⅓) - 17.0
        var U = 13.0 * W * (Constant.fu(XYZ) - Constant.fu(ref))
        var V = 13.0 * W * (Constant.fv(XYZ) - Constant.fv(ref))

        if W.isNaN { W = 0.0 }
        if U.isNaN { U = 0.0 }
        if V.isNaN { V = 0.0 }

        return CIEUVW(U: U, V: V, W: W)
    }

    /// Initializes a color from CIE 1964 UVW components.
    /// - parameter uvw: The components used to initialize the color.
    /// - parameter illuminant: The illuminant used to calculate tristimulus values.
    /// - parameter observer: The standard observer used calculate tristimulus values.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ uvw: CIEUVW,
                     illuminant: Illuminant = .d65,
                     observer: StandardObserver = .two,
                     alpha: CGFloat = 1.0) {

        let ref = illuminant.whitePoint(for: observer)

        let Y = pow((uvw.W + 17.0) / 25.0, 3.0) / 100.0
        let u = uvw.U / (13.0 * uvw.W) + Constant.fu(ref)
        let v = uvw.V / (13.0 * uvw.W) + Constant.fv(ref)

        self.init(CIEUCS(u: u, v: v), luminance: Y, alpha: alpha)
    }

}
