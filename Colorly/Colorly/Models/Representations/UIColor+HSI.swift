//
//  UIColor+HSI.swift
//  Colorly
//
//  Created by Adam Graham on 5/26/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from HSI (hue, saturation, intensity) colors.
public extension UIColor {

    /// The HSI (hue, saturation, intensity) components of a color.
    struct HSI: Hashable {

        /// The hue component of the color, in the range [0, 360°].
        public var hue: CGFloat
        /// The saturation component of the color, in the range [0, 100%].
        public var saturation: CGFloat
        /// The intensity component of the color, in the range [0, 100%].
        public var intensity: CGFloat

    }

    /// The HSI (hue, saturation, intensity) components of the color.
    var hsi: HSI {
        let rgb = self.rgbComponents
        let sum = rgb.r + rgb.g + rgb.b

        let i = sum / 3.0
        let s = 1.0 - (min(rgb.r, rgb.g, rgb.b) / i)

        return HSI(hue: self.hueComponent * 360.0,
                   saturation: s.isNaN ? 0.0 : s * 100.0,
                   intensity: i * 100.0)
    }

    /// Initializes a color from HSI (hue, saturation, intensity) components.
    /// - parameter hsi: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ hsi: HSI, alpha: CGFloat = 1.0) {
        let r: CGFloat
        let g: CGFloat
        let b: CGFloat

        let h = hsi.hue
        let s = hsi.saturation / 100.0
        let i = hsi.intensity / 100.0

        if h < 120.0 {
            b = i * (1.0 - s)
            r = i * (1.0 + (s * cos(deg2rad(h)) / cos(deg2rad(60.0 - h))))
            g = 3.0 * i - b - r
        } else if h < 240.0 {
            r = i * (1.0 - s)
            g = i * (1.0 + (s * cos(deg2rad(h - 120.0)) / cos(deg2rad(180.0 - h))))
            b = 3.0 * i - r - g
        } else {
            g = i * (1.0 - s)
            b = i * (1.0 + (s * cos(deg2rad(h - 240.0)) / cos(deg2rad(300.0 - h))))
            r = 3.0 * i - g - b
        }

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
