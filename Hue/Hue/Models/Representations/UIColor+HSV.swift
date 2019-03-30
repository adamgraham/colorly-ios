//
//  UIColor+HSV.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from HSV (hue, saturation, value) colors.
public extension UIColor {

    /// The components of a color in the HSV color model.
    typealias HSV = (
        hue: CGFloat,        // 0 to 1 (% of 360°)
        saturation: CGFloat, // 0 to 1 (% of 100)
        value: CGFloat       // 0 to 1 (% of 100)
    )

    /// The components of the color in the HSV color model.
    var hsv: HSV {
        var h: CGFloat = 0.0
        var s: CGFloat = 0.0
        var v: CGFloat = 0.0

        getHue(&h, saturation: &s, brightness: &v, alpha: nil)
        return HSV(hue: h, saturation: s, value: v)
    }

    /// Initializes a color from the components of a HSV color model.
    convenience init(hsv: HSV, alpha: CGFloat = 1.0) {
        self.init(hue: hsv.hue, saturation: hsv.saturation, brightness: hsv.value, alpha: alpha)
    }

}
