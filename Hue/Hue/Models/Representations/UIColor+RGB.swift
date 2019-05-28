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

    /// The RGB (red, green, blue) components of a color, in the range [0, 255].
    struct RGB: Hashable {

        /// The red component of the color, in the range [0, 255].
        public var red: Int
        /// The green component of the color, in the range [0, 255].
        public var green: Int
        /// The blue component of the color, in the range [0, 255].
        public var blue: Int

    }

    /// The RGB (red, green, blue) components of the color, in the range [0, 255].
    var rgb: RGB {
        let rgb = self.rgbComponents
        return RGB(red: Int(round(rgb.r * 255.0)),
                   green: Int(round(rgb.g * 255.0)),
                   blue: Int(round(rgb.b * 255.0)))
    }

    /// Initializes a color from RGB (red, green, blue) components.
    /// - parameter rgb: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ rgb: RGB, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(rgb.red) / 255.0,
                  green: CGFloat(rgb.green) / 255.0,
                  blue: CGFloat(rgb.blue) / 255.0,
                  alpha: alpha)
    }

}
