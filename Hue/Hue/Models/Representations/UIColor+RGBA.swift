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

    /// The RGBA components of the color.
    var rgba: RGBA {
        let rgba = self.rgbaComponents
        return RGBA(red: rgba.r * 255.0,
                    green: rgba.g * 255.0,
                    blue: rgba.b * 255.0,
                    alpha: rgba.a * 255.0)
    }

    /// Initializes a color from RGBA components.
    /// - parameter rgba: The components used to initialize the color.
    convenience init(_ rgba: RGBA) {
        self.init(red: rgba.red / 255.0,
                  green: rgba.green / 255.0,
                  blue: rgba.blue / 255.0,
                  alpha: rgba.alpha / 255.0)
    }

}
