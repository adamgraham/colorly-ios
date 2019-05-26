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

    /// The HSV components of a color - hue, saturation, and value.
    struct HSV: Equatable {

        /// The hue component of the color, in the range [0, 360°].
        public var hue: CGFloat
        /// The saturation component of the color, as a % in the normalized range [0, 1].
        public var saturation: CGFloat
        /// The value component of the color, as a % in the normalized range [0, 1].
        public var value: CGFloat

    }

    /// The HSV components of the color.
    var hsv: HSV {
        let hsb = self.hsbComponents
        return HSV(hue: hsb.h * 360.0,
                   saturation: hsb.s,
                   value: hsb.b)
    }

    /// Initializes a color from HSV components.
    /// - parameter hsv: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(hsv: HSV, alpha: CGFloat = 1.0) {
        self.init(hue: hsv.hue / 360.0,
                  saturation: hsv.saturation,
                  brightness: hsv.value,
                  alpha: alpha)
    }

}
