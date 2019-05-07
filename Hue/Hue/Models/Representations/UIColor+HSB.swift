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

    /// The components of a color in the HSB color model.
    public struct HSB: Equatable {

        /// The hue component of the color, in the range 0 to 360°.
        public var hue: CGFloat
        /// The saturation component of the color, in the range 0 to 1.
        public var saturation: CGFloat
        /// The brightness component of the color, in the range 0 to 1.
        public var brightness: CGFloat

    }

    /// The components of the color in the HSB color model.
    var hsb: HSB {
        var (h, s, b) = (CGFloat(), CGFloat(), CGFloat())
        getHue(&h, saturation: &s, brightness: &b, alpha: nil)

        return HSB(hue: h * 360.0,
                   saturation: s,
                   brightness: b)
    }

    /// Initializes a color from the components of a HSB color model.
    convenience init(hsb: HSB, alpha: CGFloat = 1.0) {
        self.init(hue: hsb.hue / 360.0,
                  saturation: hsb.saturation,
                  brightness: hsb.brightness,
                  alpha: alpha)
    }

}
