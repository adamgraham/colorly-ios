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

    /// The components of a color in the HSV color model.
    struct HSV: Equatable {

        /// The hue component of the color, in the range 0 to 360°.
        public var hue: CGFloat
        /// The saturation component of the color, in the range 0 to 1.
        public var saturation: CGFloat
        /// The value component of the color, in the range 0 to 1.
        public var value: CGFloat

    }

    /// The components of the color in the HSV color model.
    var hsv: HSV {
        var (h, s, v) = (CGFloat(), CGFloat(), CGFloat())
        getHue(&h, saturation: &s, brightness: &v, alpha: nil)

        return HSV(hue: h * 360.0,
                   saturation: s,
                   value: v)
    }

    /// Initializes a color from the components of a HSV color model.
    convenience init(hsv: HSV, alpha: CGFloat = 1.0) {
        self.init(hue: hsv.hue / 360.0,
                  saturation: hsv.saturation,
                  brightness: hsv.value,
                  alpha: alpha)
    }

}
