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

    /// The components of a color in the CMYK color model.
    struct CMYK: Equatable {

        /// The cyan component of the color, in the range 0 to 1.
        public var cyan: CGFloat
        /// The magenta component of the color, in the range 0 to 1.
        public var magenta: CGFloat
        /// The yellow component of the color, in the range 0 to 1.
        public var yellow: CGFloat
        /// The black component of the color, in the range 0 to 1.
        public var black: CGFloat

    }

    /// The components of the color in the CMYK color model.
    var cmyk: CMYK {
        var (r, g, b) = (CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: nil)

        let k = 1.0 - max(r, g, b)
        let c = (1.0 - r - k) / (1.0 - k)
        let m = (1.0 - g - k) / (1.0 - k)
        let y = (1.0 - b - k) / (1.0 - k)

        return CMYK(cyan: c.isNaN ? 0.0 : c,
                    magenta: m.isNaN ? 0.0 : m,
                    yellow: y.isNaN ? 0.0 : y,
                    black: k)
    }

    /// Initializes a color from the components of a CMYK color model.
    convenience init(cmyk: CMYK, alpha: CGFloat = 1.0) {
        let r = (1.0 - cmyk.cyan) * (1.0 - cmyk.black)
        let g = (1.0 - cmyk.magenta) * (1.0 - cmyk.black)
        let b = (1.0 - cmyk.yellow) * (1.0 - cmyk.black)

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
