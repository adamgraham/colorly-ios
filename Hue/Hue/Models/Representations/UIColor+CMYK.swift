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

        /// The cyan component of the color, as a % in the normalized range [0, 1].
        public var cyan: CGFloat
        /// The magenta component of the color, as a % in the normalized range [0, 1].
        public var magenta: CGFloat
        /// The yellow component of the color, as a % in the normalized range [0, 1].
        public var yellow: CGFloat
        /// The black component of the color, as a % in the normalized range [0, 1].
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

        return CMYK(cyan: c, magenta: m, yellow: y, black: k)
    }

    /// Initializes a color from CMYK components.
    /// - parameter cmyk: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(cmyk: CMYK, alpha: CGFloat = 1.0) {
        let r = (1.0 - cmyk.cyan) * (1.0 - cmyk.black)
        let g = (1.0 - cmyk.magenta) * (1.0 - cmyk.black)
        let b = (1.0 - cmyk.yellow) * (1.0 - cmyk.black)

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
