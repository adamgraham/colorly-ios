//
//  UIColor+CMYK.swift
//  ColorPalette
//
//  Created by Adam Graham on 12/18/18.
//  Copyright © 2018 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CMYK (cyan, magenta, yellow, black) colors.
public extension UIColor {

    /// The components of a color in the CMYK color model.
    typealias CMYK = (
        cyan: CGFloat,    // 0 to 1 (% of 100)
        magenta: CGFloat, // 0 to 1 (% of 100)
        yellow: CGFloat,  // 0 to 1 (% of 100)
        black: CGFloat    // 0 to 1 (% of 100)
    )

    /// The components of the color in the CMYK color model.
    var cmyk: CMYK {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0

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
