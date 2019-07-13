//
//  UIColor+RGBA.swift
//  Colorly
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from RGBA (red, green, blue, alpha) colors.
public extension UIColor {

    // MARK: RGBA

    /// The RGBA (red, green, blue, alpha) components of a color, in the range [0, 255].
    struct RGBA: Hashable {

        /// The red component of the color, in the range [0, 255].
        public var red: Int
        /// The green component of the color, in the range [0, 255].
        public var green: Int
        /// The blue component of the color, in the range [0, 255].
        public var blue: Int
        /// The alpha component of the color, in the range [0, 255].
        public var alpha: Int

        /// Initializes the RGBA (red, green, blue, alpha) components of a color.
        /// - parameter red: The red component of the color, in the range [0, 255].
        /// - parameter green: The green component of the color, in the range [0, 255].
        /// - parameter blue: The blue component of the color, in the range [0, 255].
        /// - parameter alpha: The alpha component of the color, in the range [0, 255].
        public init(red: Int, green: Int, blue: Int, alpha: Int) {
            self.red = red
            self.green = green
            self.blue = blue
            self.alpha = alpha
        }

    }

    /// The RGBA (red, green, blue, alpha) components of a color, in the range [0, 255].
    var rgba: RGBA {
        let rgba = self.rgbaComponents
        return RGBA(red: Int(round(rgba.r * 255.0)),
                    green: Int(round(rgba.g * 255.0)),
                    blue: Int(round(rgba.b * 255.0)),
                    alpha: Int(round(rgba.a * 255.0)))
    }

    /// Initializes a color from RGBA (red, green, blue, alpha) components.
    /// - parameter rgba: The components used to initialize the color.
    convenience init(_ rgba: RGBA) {
        self.init(red: CGFloat(rgba.red) / 255.0,
                  green: CGFloat(rgba.green) / 255.0,
                  blue: CGFloat(rgba.blue) / 255.0,
                  alpha: CGFloat(rgba.alpha) / 255.0)
    }

}
