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

    /// The ARGB components of a color - alpha, red, green, and blue.
    struct ARGB: Equatable {

        /// The alpha component of the color, in the range [0, 255].
        public var alpha: CGFloat
        /// The red component of the color, in the range [0, 255].
        public var red: CGFloat
        /// The green component of the color, in the range [0, 255].
        public var green: CGFloat
        /// The blue component of the color, in the range [0, 255].
        public var blue: CGFloat

    }

    /// The ARGB components of the color.
    var argb: ARGB {
        let argb = self.argbComponents
        return ARGB(alpha: argb.a * 255.0,
                    red: argb.r * 255.0,
                    green: argb.g * 255.0,
                    blue: argb.b * 255.0)
    }

    /// Initializes a color from ARGB components.
    /// - parameter argb: The components used to initialize the color.
    convenience init(_ argb: ARGB) {
        self.init(red: argb.red / 255.0,
                  green: argb.green / 255.0,
                  blue: argb.blue / 255.0,
                  alpha: argb.alpha / 255.0)
    }

}
