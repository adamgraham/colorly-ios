//
//  UIColor+YUV.swift
//  Hue
//
//  Created by Adam Graham on 5/25/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from YUV colors.
public extension UIColor {

    /// The YUV components of a color - luminance (Y) and chrominance (U,V).
    struct YUV {

        /// The luminance component of the color, in the range [0, 1] (black to white).
        public var Y: CGFloat
        /// The blue-difference chrominance component of the color, in the range [-0.436, 0.436].
        public var U: CGFloat
        /// The red-difference chrominance component of the color, in the range [-0.615, 0.615].
        public var V: CGFloat

    }

    /// The YUV components of the color using standard-definition encoding.
    var yuv: YUV {
        return yuv(.standard)
    }

    /// The YUV components of the color using a given encoding.
    /// - parameter encoding: The signal encoding with which the components are derived.
    /// - returns: The YUV components of the color.
    func yuv(_ encoding: SignalEncoding) -> YUV {
        let rgb = self.rgbComponents

        let Y: CGFloat
        let U: CGFloat
        let V: CGFloat

        switch encoding {
        case .standard:
            Y =    (0.299 * rgb.r) +   (0.587 * rgb.g) +   (0.114 * rgb.b)
            U = -(0.14713 * rgb.r) - (0.28886 * rgb.g) +   (0.436 * rgb.b)
            V =    (0.615 * rgb.r) - (0.51499 * rgb.g) - (0.10001 * rgb.b)
        case .hdtv:
            Y =   (0.2126 * rgb.r) +  (0.7152 * rgb.g) +  (0.0722 * rgb.b)
            U = -(0.09991 * rgb.r) - (0.33609 * rgb.g) +   (0.436 * rgb.b)
            V =    (0.615 * rgb.r) - (0.55861 * rgb.g) - (0.05639 * rgb.b)
        }

        return YUV(Y: Y, U: U, V: V)
    }

    /// Initializes a color from YUV components.
    /// - parameter yuv: The components used to initialize the color.
    /// - parameter encoding: The signal encoding with which the components were derived.
    /// - parameter alpha: The alpha value of the color.
    convenience init(yuv: YUV,
                     encoding: SignalEncoding,
                     alpha: CGFloat = 1.0) {

        let r: CGFloat
        let g: CGFloat
        let b: CGFloat

        switch encoding {
        case .standard:
            r = yuv.Y + (1.13983 * yuv.V)
            g = yuv.Y - (0.39465 * yuv.U) - (0.58060 * yuv.V)
            b = yuv.Y + (2.03211 * yuv.U)
        case .hdtv:
            r = yuv.Y + (1.28033 * yuv.V)
            g = yuv.Y - (0.21482 * yuv.U) - (0.38059 * yuv.V)
            b = yuv.Y + (2.12798 * yuv.U)
        }

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
