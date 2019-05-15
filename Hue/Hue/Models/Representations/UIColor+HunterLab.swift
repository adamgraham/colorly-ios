//
//  UIColor+HunterLab.swift
//  Hue
//
//  Created by Adam Graham on 5/12/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from Hunter Lab colors.
public extension UIColor {

    /// The Hunter Lab components of a color - lightness (L) and chromaticity (a,b).
    struct HunterLab: Equatable {

        /// The lightness component of the color, in the range [0, 100] (darkest to brightest).
        public var L: CGFloat
        /// The a-chromaticity component of the color, the color channel for green-red.
        public var a: CGFloat
        /// The b-chromaticity component of the color, the color channel for blue-yellow.
        public var b: CGFloat

    }

    /// The Hunter Lab components of the color using a d65 illuminant and standard 2° observer.
    var hunterLab: HunterLab {
        return self.hunterLab(illuminant: .d65, observer: .two)
    }

    /// The Hunter Lab components of the color using a given illuminant and standard observer.
    /// - parameter illuminant: The illuminant used to calculate tristimulus values.
    /// - parameter observer: The standard observer used to calculate tristimulus values.
    func hunterLab(illuminant: Illuminant, observer: StandardObserver) -> HunterLab {
        let XYZ = self.XYZ
        let ref = illuminant.whitePoint(for: observer)

        let X = XYZ.X / ref.X
        let Y = XYZ.Y / ref.Y
        let Z = XYZ.Z / ref.Z

        let kL = sqrt(Y)
        let kA = (175.0 / 198.04) * (ref.Y + ref.X)
        let kB = (70.0 / 218.11) * (ref.Y + ref.Z)

        let L = 100.0 * kL
        let a = kA * ((X - Y) / kL)
        let b = kB * ((Y - Z) / kL)

        return HunterLab(L: L,
                         a: a.isNaN ? 0.0 : a,
                         b: b.isNaN ? 0.0 : b)
    }

    /// Initializes a color from Hunter Lab components.
    /// - parameter hunterLab: The components used to initialize the color.
    /// - parameter illuminant: The illuminant used to calculate tristimulus values.
    /// - parameter observer: The standard observer used calculate tristimulus values.
    /// - parameter alpha: The alpha value of the color.
    convenience init(hunterLab: HunterLab,
                     illuminant: Illuminant = .d65,
                     observer: StandardObserver = .two,
                     alpha: CGFloat = 1.0) {

        let ref = illuminant.whitePoint(for: observer)

        let kA = (175.0 / 198.04) * (ref.Y + ref.X)
        let kB = (70.0 / 218.11) * (ref.Y + ref.Z)

        let Y = pow(hunterLab.L / ref.Y, 2.0) * 100.0
        let kL = Y / ref.Y
        let kLs = sqrt(kL)

        let X =  (hunterLab.a / kA * kLs + kL) * ref.X
        let Z = -(hunterLab.b / kB * kLs - kL) * ref.Z

        self.init(XYZ: CIE_XYZ(X: X, Y: Y, Z: Z), alpha: alpha)
    }

}
