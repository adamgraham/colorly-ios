//
//  UIColor+CIELCh.swift
//  Hue
//
//  Created by Adam Graham on 5/18/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIELCh° colors.
public extension UIColor {

    /// The CIELCh° components of a color - lightness (L), chroma (C), and hue (h).
    struct CIELCh: Hashable {

        /// The lightness component of the color, in the range [0, 100] (darkest to brightest).
        public var L: CGFloat
        /// The chroma component of the color.
        public var C: CGFloat
        /// The hue component of the color, in the range [0, 360°].
        public var h: CGFloat

    }

    /**
     Calculates the CIELCh° components from a lightness value and a pair of chromaticity
     coordinates.

     - parameter L: The lightness value of the color.
     - parameter x: The x-axis chromaticity coordinate of the color.
     - parameter y: The y-axis chromaticity coordinate of the color.

     - returns: The CIELCh° components of the color.
     */
    private func LCh(L: CGFloat, x: CGFloat, y: CGFloat) -> CIELCh {
        let C = sqrt((x * x) + (y * y))
        var h = atan2(y, x)

        if h.isNaN || C.isZero(accuracy: 0.0001) {
            h = 0.0
        } else if h >= 0.0 {
            h = rad2deg(h)
        } else {
            h = 360.0 - rad2deg(abs(h))
        }

        return CIELCh(L: L, C: C, h: h)
    }

    // MARK: CIELCh°(ab)

    /// The CIELCh°(ab) components of the color using a d65 illuminant and 2° standard observer.
    var LCh_ab: CIELCh {
        return self.LCh_ab(illuminant: .d65, observer: .two)
    }

    /**
     The CIELCh°(ab) components of the color using a given illuminant and standard observer.

     - parameter illuminant: The illuminant used to calculate tristimulus values.
     - parameter observer: The standard observer used to calculate tristimulus values.

     - returns: The CIELCh°(ab) components of the color.
     */
    func LCh_ab(illuminant: Illuminant, observer: StandardObserver) -> CIELCh {
        let Lab = self.Lab(illuminant: illuminant, observer: observer)
        return LCh(L: Lab.L, x: Lab.a, y: Lab.b)
    }

    /**
     Initializes a color from CIELCh°(ab) components.

     - parameter LCh: The components used to initialize the color.
     - parameter illuminant: The illuminant used to calculate tristimulus values.
     - parameter observer: The standard observer used calculate tristimulus values.
     - parameter alpha: The alpha value of the color.
     */
    convenience init(ab LCh: CIELCh,
                     illuminant: Illuminant = .d65,
                     observer: StandardObserver = .two,
                     alpha: CGFloat = 1.0) {

        let a = LCh.C * cos(deg2rad(LCh.h))
        let b = LCh.C * sin(deg2rad(LCh.h))

        self.init(CIELAB(L: LCh.L, a: a, b: b),
                  illuminant: illuminant,
                  observer: observer,
                  alpha: alpha)
    }

    // MARK: CIELCh°(uv)

    /// The CIELCh°(uv) components of the color using a d65 illuminant and 2° standard observer.
    var LCh_uv: CIELCh {
        return self.LCh_uv(illuminant: .d65, observer: .two)
    }

    /**
     The CIELCh°(uv) components of the color using a given illuminant and standard observer.

     - parameter illuminant: The illuminant used to calculate tristimulus values.
     - parameter observer: The standard observer used to calculate tristimulus values.

     - returns: The CIELCh°(uv) components of the color.
     */
    func LCh_uv(illuminant: Illuminant, observer: StandardObserver) -> CIELCh {
        let Luv = self.Luv(illuminant: illuminant, observer: observer)
        return LCh(L: Luv.L, x: Luv.u, y: Luv.v)
    }

    /**
     Initializes a color from CIELCh°(uv) components.

     - parameter LCh: The components used to initialize the color.
     - parameter illuminant: The illuminant used to calculate tristimulus values.
     - parameter observer: The standard observer used calculate tristimulus values.
     - parameter alpha: The alpha value of the color.
     */
    convenience init(uv LCh: CIELCh,
                     illuminant: Illuminant = .d65,
                     observer: StandardObserver = .two,
                     alpha: CGFloat = 1.0) {

        let u = LCh.C * cos(deg2rad(LCh.h))
        let v = LCh.C * sin(deg2rad(LCh.h))

        self.init(CIELUV(L: LCh.L, u: u, v: v),
                  illuminant: illuminant,
                  observer: observer,
                  alpha: alpha)
    }

}
