//
//  UIColor+HSB.swift
//  ColorPalette
//
//  Created by Adam Graham on 12/18/18.
//  Copyright © 2018 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from HSB (hue, saturation, brightness) colors.
public extension UIColor {

    /// The components of a color in the HSB color model.
    typealias HSB = (
        hue: CGFloat,        // 0 to 1 (% of 360°)
        saturation: CGFloat, // 0 to 1 (% of 100)
        brightness: CGFloat  // 0 to 1 (% of 100)
    )

    /// The components of the color in the HSB color model.
    var hsb: HSB {
        var h: CGFloat = 0.0
        var s: CGFloat = 0.0
        var b: CGFloat = 0.0

        getHue(&h, saturation: &s, brightness: &b, alpha: nil)
        return HSB(hue: h, saturation: s, brightness: b)
    }

    /// Initializes a color from the components of a HSB color model.
    convenience init(hsb: HSB, alpha: CGFloat = 1.0) {
        self.init(hue: hsb.hue, saturation: hsb.saturation, brightness: hsb.brightness, alpha: alpha)
    }

}
