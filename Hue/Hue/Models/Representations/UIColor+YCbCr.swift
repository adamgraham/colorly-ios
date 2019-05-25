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

    /// The YCbCr components of a color - luminance (Y) and chrominance (Cb,Cr).
    struct YCbCr {

        /// The luminance component of the color, in the range [0, 1] (black to white).
        public var Y: CGFloat

        /// The blue-difference chrominance component of the color, in the range [-0.5, 0.5].
        public var Cb: CGFloat

        /// The red-difference chrominance component of the color, in the range [-0.5, 0.5].
        public var Cr: CGFloat

    }

    /// The YCbCr components of the color using standard-definition encoding.
    var yCbCr: YCbCr {
        return yCbCr(.standard)
    }

    /// The YCbCr components of the color using a given encoding.
    func yCbCr(_ encoding: SignalEncoding) -> YCbCr {
        var (r, g, b) = (CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: nil)

        let Y: CGFloat
        let Cb: CGFloat
        let Cr: CGFloat

        switch encoding {
        case .standard:
            Y  =  (0.299 * r) + (0.587 * g) + (0.114 * b)
            Cb = (-0.169 * r) - (0.331 * g) + (0.500 * b)
            Cr =  (0.500 * r) - (0.419 * g) - (0.081 * b)
        case .hdtv:
            Y  =  (0.213 * r) + (0.715 * g) + (0.072 * b)
            Cb = (-0.115 * r) - (0.385 * g) + (0.500 * b)
            Cr =  (0.500 * r) - (0.454 * g) - (0.046 * b)
        }

        return YCbCr(Y: Y, Cb: Cb, Cr: Cr)
    }

    /// Initializes a color from YCbCr components.
    /// - parameter yCbCr: The components used to initialize the color.
    /// - parameter encoding: The signal encoding with which the components were derived.
    /// - parameter alpha: The alpha value of the color.
    convenience init(yCbCr: YCbCr,
                     encoding: SignalEncoding,
                     alpha: CGFloat = 1.0) {

        let r: CGFloat
        let g: CGFloat
        let b: CGFloat

        switch encoding {
        case .standard:
            r = yCbCr.Y + (1.402 * yCbCr.Cr)
            g = yCbCr.Y - (0.344 * yCbCr.Cb) - (0.714 * yCbCr.Cr)
            b = yCbCr.Y + (1.772 * yCbCr.Cb)
        case .hdtv:
            r = yCbCr.Y + (1.575 * yCbCr.Cr)
            g = yCbCr.Y - (0.187 * yCbCr.Cb) - (0.468 * yCbCr.Cr)
            b = yCbCr.Y + (1.856 * yCbCr.Cb)
        }

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
