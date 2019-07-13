//
//  UIColor+HSL.swift
//  Colorly
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from HSL (hue, saturation, lightness) colors.
public extension UIColor {

    // MARK: HSL

    /// The HSL (hue, saturation, lightness) components of a color.
    struct HSL: Hashable {

        /// The hue component of the color, in the range [0, 360°].
        public var hue: CGFloat
        /// The saturation component of the color, in the range [0, 100%].
        public var saturation: CGFloat
        /// The lightness component of the color, in the range [0, 100%].
        public var lightness: CGFloat

        /// Initializes the HSL (hue, saturation, lightness) components of a color.
        /// - parameter hue: The hue component of the color, in the range [0, 360°].
        /// - parameter saturation: The saturation component of the color, in the range [0, 100%].
        /// - parameter lightness: The lightness component of the color, in the range [0, 100%].
        public init(hue: CGFloat, saturation: CGFloat, lightness: CGFloat) {
            self.hue = hue
            self.saturation = saturation
            self.lightness = lightness
        }

    }

    /// The HSL (hue, saturation, lightness) components of the color.
    var hsl: HSL {
        var hsb = self.hsbComponents
        let l = ((2.0 - hsb.s) * hsb.b) / 2.0

        switch l {
        case 0.0, 1.0:
            hsb.s = 0.0
        case 0.0..<0.5:
            hsb.s = (hsb.s * hsb.b) / (l * 2.0)
        default:
            hsb.s = (hsb.s * hsb.b) / (2.0 - l * 2.0)
        }

        return HSL(hue: hsb.h * 360.0,
                   saturation: hsb.s * 100.0,
                   lightness: l * 100.0)
    }

    /// Initializes a color from HSL (hue, saturation, lightness) components.
    /// - parameter hsl: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ hsl: HSL, alpha: CGFloat = 1.0) {
        let h = hsl.hue / 360.0
        var s = hsl.saturation / 100.0
        let l = hsl.lightness / 100.0

        let t = s * ((l < 0.5) ? l : (1.0 - l))
        let b = l + t
        s = (l > 0.0) ? (2.0 * t / b) : 0.0

        self.init(hue: h, saturation: s, brightness: b, alpha: alpha)
    }

}
