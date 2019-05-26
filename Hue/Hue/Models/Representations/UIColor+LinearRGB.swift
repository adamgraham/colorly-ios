//
//  UIColor+LinearRGB.swift
//  Hue
//
//  Created by Adam Graham on 5/19/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from linear RGB.
public extension UIColor {

    /// A set of non-gamma corrected linear RGB values, in the range [0, 1].
    typealias LinearRGB = (r: CGFloat, g: CGFloat, b: CGFloat)

    /// The inverse companded sRGB components to get non-gamma corrected linear values.
    var linearRGB: LinearRGB {
        var rgb = self.rgbComponents
        rgb.r = (rgb.r > 0.03928) ? pow((rgb.r + 0.055) / 1.055, 2.4) : (rgb.r / 12.92)
        rgb.g = (rgb.g > 0.03928) ? pow((rgb.g + 0.055) / 1.055, 2.4) : (rgb.g / 12.92)
        rgb.b = (rgb.b > 0.03928) ? pow((rgb.b + 0.055) / 1.055, 2.4) : (rgb.b / 12.92)
        return rgb
    }

    /// Initializes an sRGB gamma corrected color from linear RGB values.
    /// - parameter rgb: The linear RGB values to be gamma corrected.
    /// - parameter alpha: The alpha value of the color.
    convenience init(linear rgb: LinearRGB, alpha: CGFloat = 1.0) {
        let k: CGFloat = 1.0 / 2.4

        let red = (rgb.r <= 0.00304) ? (12.92 * rgb.r) : (1.055 * pow(rgb.r, k) - 0.055)
        let green = (rgb.g <= 0.00304) ? (12.92 * rgb.g) : (1.055 * pow(rgb.g, k) - 0.055)
        let blue = (rgb.b <= 0.00304) ? (12.92 * rgb.b) : (1.055 * pow(rgb.b, k) - 0.055)

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

}
