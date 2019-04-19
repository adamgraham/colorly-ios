//
//  UIColor+Luminance.swift
//  Hue
//
//  Created by Adam Graham on 4/5/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to retieve relative luminance and perceived brightness values of a color.
public extension UIColor {

    /// The relative luminance of the color, measured according to the HSL color model.
    var luminance: CGFloat {
        var (r, g, b) = (CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: nil)

        // converts an RGB component to Linear RGB
        func linear(_ component: CGFloat) -> CGFloat {
            return (component > 0.03928) ? pow((component + 0.055) / 1.055, 2.4) : (component / 12.92)
        }

        return 0.2126 * r +
               0.7152 * g +
               0.0722 * b
    }

    /// The perceived brightness of the color, measured according to the HSP color model -
    /// http://alienryderflex.com/hsp.html.
    var perceivedBrightness: CGFloat {
        var (r, g, b) = (CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: nil)

        // converts an RGB component to Linear RGB
        func linear(_ component: CGFloat) -> CGFloat {
            return (component > 0.03928) ? pow((component + 0.055) / 1.055, 2.4) : (component / 12.92)
        }

        r = 0.299 * pow(linear(r), 2.0)
        g = 0.587 * pow(linear(g), 2.0)
        b = 0.114 * pow(linear(b), 2.0)

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
