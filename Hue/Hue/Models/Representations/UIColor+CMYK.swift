//
//  UIColor+CMYK.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CMYK (cyan, magenta, yellow, black) colors.
public extension UIColor {

    /// The CMYK components of a color - cyan, magenta, yellow, and black.
    struct CMYK: Equatable {

        /// The cyan component of the color, in the range [0, 100%].
        public var cyan: CGFloat
        /// The magenta component of the color, in the range [0, 100%].
        public var magenta: CGFloat
        /// The yellow component of the color, in the range [0, 100%].
        public var yellow: CGFloat
        /// The black component of the color, in the range [0, 100%].
        public var black: CGFloat

    }

    /// The CMYK components of the color.
    var cmyk: CMYK {
        let rgb = self.rgbComponents

        let k = 1.0 - max(rgb.r, rgb.g, rgb.b)
        var c = (1.0 - rgb.r - k) / (1.0 - k)
        var m = (1.0 - rgb.g - k) / (1.0 - k)
        var y = (1.0 - rgb.b - k) / (1.0 - k)

        if c.isNaN { c = 0.0 }
        if m.isNaN { m = 0.0 }
        if y.isNaN { y = 0.0 }

        return CMYK(cyan: c * 100.0,
                    magenta: m * 100.0,
                    yellow: y * 100.0,
                    black: k * 100.0)
    }

    /// Initializes a color from CMYK components.
    /// - parameter cmyk: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(cmyk: CMYK, alpha: CGFloat = 1.0) {
        let c = cmyk.cyan / 100.0
        let m = cmyk.magenta / 100.0
        let y = cmyk.yellow / 100.0
        let k = cmyk.black / 100.0

        let r = (1.0 - c) * (1.0 - k)
        let g = (1.0 - m) * (1.0 - k)
        let b = (1.0 - y) * (1.0 - k)

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
