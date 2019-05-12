//
//  UIColor+RGB.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from RGB (red, green, blue) colors.
public extension UIColor {

    /// The RGB components of a color - red, green, and blue.
    struct RGB: Equatable {

        /// The red component of the color, in the range [0, 255].
        public var red: CGFloat
        /// The green component of the color, in the range [0, 255].
        public var green: CGFloat
        /// The blue component of the color, in the range [0, 255].
        public var blue: CGFloat

    }

    /// The RGB components of the color.
    var rgb: RGB {
        var (r, g, b) = (CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: nil)

        return RGB(red: r * 255.0,
                   green: g * 255.0,
                   blue: b * 255.0)
    }

    /// Initializes a color from RGB components.
    /// - parameter rgb: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(rgb: RGB, alpha: CGFloat = 1.0) {
        self.init(red: rgb.red / 255.0,
                  green: rgb.green / 255.0,
                  blue: rgb.blue / 255.0,
                  alpha: alpha)
    }

}
