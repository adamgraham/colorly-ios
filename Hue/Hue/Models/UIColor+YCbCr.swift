//
//  UIColor+YCbCr.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from YCbCr colors.
public extension UIColor {

    /// The components of a color in the YCbCr color model.
    public struct YCbCr {

        /// The type of image signal encoding used for color conversions.
        public enum Encoding {

            /// ITU-R BT.601 (standard-definition television)
            case standard
            /// ITU-R BT.709 (high-definition television)
            case hdtv

        }

        /// The luminance component of the color, in the range 0 to 1 (black to white).
        public let luma: CGFloat

        /// The chrominance (blue-difference, red-difference) components of the color, in the
        /// range -0.5 to 0.5.
        public let chroma: (blue: CGFloat, red: CGFloat)

        /// The image signal encoding used for color conversions.
        public let encoding: Encoding

    }

    /// The components of the color in the YCbCr color model using standard-definition encoding.
    var yCbCr: YCbCr {
        return yCbCr(.standard)
    }

    /// The components of the color in the YCbCr color model using a given encoding.
    func yCbCr(_ encoding: YCbCr.Encoding) -> YCbCr {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0

        getRed(&r, green: &g, blue: &b, alpha: nil)

        let Y: CGFloat
        let Cb: CGFloat
        let Cr: CGFloat

        switch encoding {
        case .standard:
            Y  = (0.299 * r) + (0.587 * g) + (0.114 * b)
            Cb = 0.564 * (b - Y)
            Cr = 0.713 * (r - Y)
        case .hdtv:
            Y  = (0.2126 * r) + (0.7152 * g) + (0.0722 * b)
            Cb = 0.5389 * (b - Y)
            Cr = 0.6350 * (r - Y)
        }

        return YCbCr(luma: Y, chroma: (blue: Cb, red: Cr), encoding: encoding)
    }

    /// Initializes a color from the components of a YCbCr color model.
    convenience init(yCbCr: YCbCr, alpha: CGFloat = 1.0) {
        let r: CGFloat
        let g: CGFloat
        let b: CGFloat

        switch yCbCr.encoding {
        case .standard:
            r = yCbCr.luma + (1.402 * yCbCr.chroma.red)
            g = yCbCr.luma - (0.344 * yCbCr.chroma.blue) - (0.714 * yCbCr.chroma.red)
            b = yCbCr.luma + (1.773 * yCbCr.chroma.blue)
        case .hdtv:
            r = yCbCr.luma + (1.5701 * yCbCr.chroma.red)
            g = yCbCr.luma - (0.1870 * yCbCr.chroma.blue) - (0.4664 * yCbCr.chroma.red)
            b = yCbCr.luma - (1.8556 * yCbCr.chroma.blue)
        }

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
