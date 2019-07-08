//
//  UIColor+HSB.swift
//  Colorly
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from HSB (hue, saturation, brightness) colors.
public extension UIColor {

    /// The HSB (hue, saturation, brightness) components of a color.
    struct HSB: Hashable {

        /// The hue component of the color, in the range [0, 360°].
        public var hue: CGFloat
        /// The saturation component of the color, in the range [0, 100%].
        public var saturation: CGFloat
        /// The brightness component of the color, in the range [0, 100%].
        public var brightness: CGFloat

        /// Initializes the HSB (hue, saturation, brightness) components of a color.
        /// - parameter hue: The hue component of the color, in the range [0, 360°].
        /// - parameter saturation: The saturation component of the color, in the range [0, 100%].
        /// - parameter brightness: The brightness component of the color, in the range [0, 100%].
        public init(hue: CGFloat, saturation: CGFloat, brightness: CGFloat) {
            self.hue = hue
            self.saturation = saturation
            self.brightness = brightness
        }

    }

    /// The HSB (hue, saturation, brightness) components of the color.
    var hsb: HSB {
        let hsb = self.hsbComponents
        return HSB(hue: hsb.h * 360.0,
                   saturation: hsb.s * 100.0,
                   brightness: hsb.b * 100.0)
    }

    /// Initializes a color from HSB (hue, saturation, brightness) components.
    /// - parameter hsb: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ hsb: HSB, alpha: CGFloat = 1.0) {
        self.init(hue: hsb.hue / 360.0,
                  saturation: hsb.saturation / 100.0,
                  brightness: hsb.brightness / 100.0,
                  alpha: alpha)
    }

}
