//
//  UIColor+HSB.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from HSB (hue, saturation, brightness) colors.
public extension UIColor {

    /// The HSB components of a color - hue, saturation, and brightness.
    struct HSB: Equatable {

        /// The hue component of the color, in the range [0, 360°].
        public var hue: CGFloat
        /// The saturation component of the color, as a % in the normalized range [0, 1].
        public var saturation: CGFloat
        /// The brightness component of the color, as a % in the normalized range [0, 1].
        public var brightness: CGFloat

    }

    /// The HSB components of the color.
    var hsb: HSB {
        let hsb = self.hsbComponents
        return HSB(hue: hsb.h * 360.0,
                   saturation: hsb.s,
                   brightness: hsb.b)
    }

    /// Initializes a color from HSB components.
    /// - parameter hsb: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(hsb: HSB, alpha: CGFloat = 1.0) {
        self.init(hue: hsb.hue / 360.0,
                  saturation: hsb.saturation,
                  brightness: hsb.brightness,
                  alpha: alpha)
    }

}
