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

    /// The RGBA components of a color - red, green, blue, and alpha.
    struct RGBA: Hashable {

        /// The red component of the color, in the range [0, 255].
        public var red: Int
        /// The green component of the color, in the range [0, 255].
        public var green: Int
        /// The blue component of the color, in the range [0, 255].
        public var blue: Int
        /// The alpha component of the color, in the range [0, 255].
        public var alpha: Int

    }

    /// The RGBA components of the color.
    var rgba: RGBA {
        let rgba = self.rgbaComponents
        return RGBA(red: Int(round(rgba.r * 255.0)),
                    green: Int(round(rgba.g * 255.0)),
                    blue: Int(round(rgba.b * 255.0)),
                    alpha: Int(round(rgba.a * 255.0)))
    }

    /// Initializes a color from RGBA components.
    /// - parameter rgba: The components used to initialize the color.
    convenience init(_ rgba: RGBA) {
        self.init(red: CGFloat(rgba.red) / 255.0,
                  green: CGFloat(rgba.green) / 255.0,
                  blue: CGFloat(rgba.blue) / 255.0,
                  alpha: CGFloat(rgba.alpha) / 255.0)
    }

}
