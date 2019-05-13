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

    /// The Hunter Lab components of a color.
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
    func hunterLab(illuminant: UIColor.Illuminant,
                   observer: UIColor.StandardObserver) -> HunterLab {

        let reference = illuminant.referenceValues(for: observer, scale: 100.0)

        let XYZ = self.XYZ
        let X = XYZ.X / reference.X
        let Y = XYZ.Y / reference.Y
        let Z = XYZ.Z / reference.Z

        let kL = sqrt(Y)
        let kA = (175.0 / 198.04) * (reference.Y + reference.X)
        let kB = (70.0 / 218.11) * (reference.Y + reference.Z)

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
                     illuminant: UIColor.Illuminant = .d65,
                     observer: UIColor.StandardObserver = .two,
                     alpha: CGFloat = 1.0) {

        let reference = illuminant.referenceValues(for: observer, scale: 100.0)

        let kA = (175.0 / 198.04) * (reference.Y + reference.X)
        let kB = (70.0 / 218.11) * (reference.Y + reference.Z)

        let Y = pow(hunterLab.L / reference.Y, 2.0) * 100.0
        let kL = Y / reference.Y
        let kLs = sqrt(kL)

        let X =  (hunterLab.a / kA * kLs + kL) * reference.X
        let Z = -(hunterLab.b / kB * kLs - kL) * reference.Z

        self.init(XYZ: CIE_XYZ(X: X, Y: Y, Z: Z), alpha: alpha)
    }

}
