//
//  UIColor+HSL.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from HSL (hue, saturation, lightness) colors.
public extension UIColor {

    /// The HSL components of a color - hue, saturation, and lightness.
    struct HSL: Equatable {

        /// The hue component of the color, in the range [0, 360°].
        public var hue: CGFloat
        /// The saturation component of the color, as a % in the normalized range [0, 1].
        public var saturation: CGFloat
        /// The lightness component of the color, as a % in the normalized range [0, 1].
        public var lightness: CGFloat

    }

    /// The HSL components of the color.
    var hsl: HSL {
        var (h, s, b) = (CGFloat(), CGFloat(), CGFloat())
        getHue(&h, saturation: &s, brightness: &b, alpha: nil)

        let l = ((2.0 - s) * b) / 2.0

        switch l {
        case 0.0:
            break
        case 1.0:
            s = 0.0
        case 0.0..<0.5:
            s = (s * b) / (l * 2.0)
        default:
            s = (s * b) / (2.0 - l * 2.0)
        }

        return HSL(hue: h * 360.0,
                   saturation: s,
                   lightness: l)
    }

    /// Initializes a color from HSL components.
    /// - parameter hsl: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(hsl: HSL, alpha: CGFloat = 1.0) {
        let h = hsl.hue
        let t = hsl.saturation * ((hsl.lightness < 0.5) ? hsl.lightness : (1.0 - hsl.lightness))
        let b = hsl.lightness + t
        let s = (hsl.lightness > 0.0) ? (2.0 * t / b) : 0.0

        self.init(hue: h / 360.0,
                  saturation: s,
                  brightness: b,
                  alpha: alpha)
    }

}
