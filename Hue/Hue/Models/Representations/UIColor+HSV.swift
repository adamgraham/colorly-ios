//
//  UIColor+HSV.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from HSV (hue, saturation, value) colors.
public extension UIColor {

    /// The HSV (hue, saturation, value) components of a color.
    struct HSV: Hashable {

        /// The hue component of the color, in the range [0, 360°].
        public var hue: CGFloat
        /// The saturation component of the color, in the range [0, 100%].
        public var saturation: CGFloat
        /// The value component of the color, in the range [0, 100%].
        public var value: CGFloat

    }

    /// The HSV (hue, saturation, value) components of the color.
    var hsv: HSV {
        let hsb = self.hsbComponents
        return HSV(hue: hsb.h * 360.0,
                   saturation: hsb.s * 100.0,
                   value: hsb.b * 100.0)
    }

    /// Initializes a color from HSV (hue, saturation, value) components.
    /// - parameter hsv: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ hsv: HSV, alpha: CGFloat = 1.0) {
        self.init(hue: hsv.hue / 360.0,
                  saturation: hsv.saturation / 100.0,
                  brightness: hsv.value / 100.0,
                  alpha: alpha)
    }

}
