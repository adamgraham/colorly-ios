//
//  UIColor+RGBA.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from RGBA (red, green, blue, alpha) colors.
public extension UIColor {

    /// The components of a color in the RGBA color model.
    struct RGBA: Equatable {

        /// The red component of the color, in the range [0, 255].
        public var red: CGFloat
        /// The green component of the color, in the range [0, 255].
        public var green: CGFloat
        /// The blue component of the color, in the range [0, 255].
        public var blue: CGFloat
        /// The alpha component of the color, in the range [0, 255].
        public var alpha: CGFloat

    }

    /// The components of the color in the RGBA color model.
    var rgba: RGBA {
        var (r, g, b, a) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: &a)

        return RGBA(red: r * 255.0,
                    green: g * 255.0,
                    blue: b * 255.0,
                    alpha: a * 255.0)
    }

    /// Initializes a color from the components of a RGBA color model.
    convenience init(rgba: RGBA) {
        self.init(red: rgba.red / 255.0,
                  green: rgba.green / 255.0,
                  blue: rgba.blue / 255.0,
                  alpha: rgba.alpha / 255.0)
    }

}
