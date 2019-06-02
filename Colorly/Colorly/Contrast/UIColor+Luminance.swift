//
//  UIColor+Luminance.swift
//  Colorly
//
//  Created by Adam Graham on 4/5/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to retieve relative luminance and perceived brightness values of a color.
public extension UIColor {

    /// The relative luminance of the color, measured according to the HSL color model.
    var relativeLuminance: CGFloat {
        let rgb = self.linearRGB
        let k = UIColor.SignalEncoding.rec709.coefficients

        return k.r * rgb.r +
               k.g * rgb.g +
               k.b * rgb.b
    }

    /// The perceived brightness of the color, measured according to the HSP color model -
    /// http://alienryderflex.com/hsp.html
    var perceivedBrightness: CGFloat {
        let rgb = self.linearRGB
        let k = UIColor.SignalEncoding.rec601.coefficients

        let r = k.r * pow(rgb.r, 2.0)
        let g = k.g * pow(rgb.g, 2.0)
        let b = k.b * pow(rgb.b, 2.0)

        return sqrt(r + g + b)
    }

    /// Returns `true` if the color is considered light according to its perceived brightness.
    var isLight: Bool {
        return self.perceivedBrightness >= 0.5
    }

    /// Returns `true` if the color is considered dark according to its perceived brightness.
    var isDark: Bool {
        return self.perceivedBrightness <= 0.5
    }

}
