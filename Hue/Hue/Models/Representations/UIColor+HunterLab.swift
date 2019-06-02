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
    struct HunterLab: Hashable {

        /// The lightness component of the color, in the range [0, 100] (darkest to brightest).
        public var L: CGFloat
        /// The red-green chromaticity component of the color.
        public var a: CGFloat
        /// The blue-yellow chromaticity component of the color.
        public var b: CGFloat

    }

    /// The Hunter Lab components of the color using a d65 illuminant and 2° standard observer.
    var hunterLab: HunterLab {
        return self.hunterLab(illuminant: .d65, observer: .two)
    }

    /**
     The Hunter Lab components of the color using a given illuminant and standard observer.

     - parameter illuminant: The illuminant used to calculate tristimulus values.
     - parameter observer: The standard observer used to calculate tristimulus values.

     - returns: The Hunter Lab components of the color.
     */
    func hunterLab(illuminant: Illuminant, observer: StandardObserver) -> HunterLab {
        let XYZ = self.XYZ
        let ref = illuminant.whitePoint(for: observer)

        let X = XYZ.X / ref.X
        let Y = XYZ.Y / ref.Y
        let Z = XYZ.Z / ref.Z

        let kL = sqrt(Y)
        let kA = (175.0 / 198.04) * (ref.Y + ref.X)
        let kB = (70.0 / 218.11) * (ref.Y + ref.Z)

        var L = 100.0 * kL
        var a = kA * ((X - Y) / kL)
        var b = kB * ((Y - Z) / kL)

        if L.isNaN { L = 0.0 }
        if a.isNaN { a = 0.0 }
        if b.isNaN { b = 0.0 }

        return HunterLab(L: L, a: a, b: b)
    }

    /**
     Initializes a color from Hunter Lab components.

     - parameter hunterLab: The components used to initialize the color.
     - parameter illuminant: The illuminant used to calculate tristimulus values.
     - parameter observer: The standard observer used calculate tristimulus values.
     - parameter alpha: The alpha value of the color.
     */
    convenience init(_ hunterLab: HunterLab,
                     illuminant: Illuminant = .d65,
                     observer: StandardObserver = .two,
                     alpha: CGFloat = 1.0) {

        let ref = illuminant.whitePoint(for: observer)

        let kA = (175.0 / 198.04) * (ref.Y + ref.X)
        let kB = (70.0 / 218.11) * (ref.Y + ref.Z)

        var Y = pow(hunterLab.L / ref.Y, 2.0) * 100.0
        let kL = Y / ref.Y
        let kLs = sqrt(kL)

        var X =  (hunterLab.a / kA * kLs + kL) * ref.X
        var Z = -(hunterLab.b / kB * kLs - kL) * ref.Z

        if X.isNaN { X = 0.0 }
        if Y.isNaN { Y = 0.0 }
        if Z.isNaN { Z = 0.0 }

        self.init(CIEXYZ(X: X, Y: Y, Z: Z), alpha: alpha)
    }

}
