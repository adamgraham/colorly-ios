//
//  UIColor+ARGB.swift
//  Colorly
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from ARGB (alpha, red, green, blue) colors.
public extension UIColor {

    // MARK: ARGB

    /// The ARGB (alpha, red, green, blue) components of a color, in the range [0, 255].
    struct ARGB: Hashable {

        /// The alpha component of the color, in the range [0, 255].
        public var alpha: Int
        /// The red component of the color, in the range [0, 255].
        public var red: Int
        /// The green component of the color, in the range [0, 255].
        public var green: Int
        /// The blue component of the color, in the range [0, 255].
        public var blue: Int

        /// Initializes the ARGB (alpha, red, green, blue) components of a color.
        /// - parameter alpha: The alpha component of the color, in the range [0, 255].
        /// - parameter red: The red component of the color, in the range [0, 255].
        /// - parameter green: The green component of the color, in the range [0, 255].
        /// - parameter blue: The blue component of the color, in the range [0, 255].
        public init(alpha: Int, red: Int, green: Int, blue: Int) {
            self.alpha = alpha
            self.red = red
            self.green = green
            self.blue = blue
        }

    }

    /// The ARGB (alpha, red, green, blue) components of the color, in the range [0, 255].
    var argb: ARGB {
        let argb = self.argbComponents
        return ARGB(alpha: Int(round(argb.a * 255.0)),
                    red: Int(round(argb.r * 255.0)),
                    green: Int(round(argb.g * 255.0)),
                    blue: Int(round(argb.b * 255.0)))
    }

    /// Initializes a color from ARGB (alpha, red, green, blue) components.
    /// - parameter argb: The components used to initialize the color.
    convenience init(_ argb: ARGB) {
        self.init(red: CGFloat(argb.red) / 255.0,
                  green: CGFloat(argb.green) / 255.0,
                  blue: CGFloat(argb.blue) / 255.0,
                  alpha: CGFloat(argb.alpha) / 255.0)
    }

}
