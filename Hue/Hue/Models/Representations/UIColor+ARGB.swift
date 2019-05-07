//
//  UIColor+ARGB.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from ARGB (alpha, red, green, blue) colors.
public extension UIColor {

    /// The components of a color in the ARGB color model.
    public struct ARGB: Equatable {

        /// The alpha component of the color, in the range 0 to 255.
        public var alpha: CGFloat
        /// The red component of the color, in the range 0 to 255.
        public var red: CGFloat
        /// The green component of the color, in the range 0 to 255.
        public var green: CGFloat
        /// The blue component of the color, in the range 0 to 255.
        public var blue: CGFloat

    }

    /// The components of the color in the ARGB color model.
    var argb: ARGB {
        var (a, r, g, b) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: &a)

        return ARGB(alpha: a * 255.0,
                    red: r * 255.0,
                    green: g * 255.0,
                    blue: b * 255.0)
    }

    /// Initializes a color from the components of an ARGB color model.
    convenience init(argb: ARGB) {
        self.init(red: argb.red / 255.0,
                  green: argb.green / 255.0,
                  blue: argb.blue / 255.0,
                  alpha: argb.alpha / 255.0)
    }

}
