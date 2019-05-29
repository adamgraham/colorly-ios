//
//  UIColor+YUV.swift
//  Hue
//
//  Created by Adam Graham on 5/25/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from Y′UV colors.
public extension UIColor {

    /// The Y′UV components of a color - luma (Y′) and chroma (U,V).
    struct YUV: Hashable {

        /// The luma component of the color, in the range [0, 1] (black to white).
        public var Y: CGFloat
        /// The blue-difference chroma component of the color, in the range [-0.436, 0.436].
        public var U: CGFloat
        /// The red-difference chroma component of the color, in the range [-0.615, 0.615].
        public var V: CGFloat

    }

    /// Constant values used to convert to and from Y′UV colors.
    private struct Constant {

        /// The maximum value of the U component.
        static let Umax: CGFloat = 0.436
        /// The maximum value of the V component.
        static let Vmax: CGFloat = 0.615

    }

    /// The Y′UV components of the color using standard-definition encoding.
    var yuv: YUV {
        return yuv(.standard)
    }

    /// The Y′UV components of the color using a given encoding.
    /// - parameter encoding: The signal encoding with which the components are derived.
    /// - returns: The Y′UV components of the color.
    func yuv(_ encoding: SignalEncoding) -> YUV {
        let rgb = self.rgbComponents
        let k = encoding.coefficients

        let Y = (k.r * rgb.r) + (k.g * rgb.g) + (k.b * rgb.b)
        let U = Constant.Umax * ((rgb.b - Y) / (1.0 - k.b))
        let V = Constant.Vmax * ((rgb.r - Y) / (1.0 - k.r))

        return YUV(Y: Y, U: U, V: V)
    }

    /// Initializes a color from Y′UV components.
    /// - parameter yuv: The components used to initialize the color.
    /// - parameter encoding: The signal encoding with which the components were derived.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ yuv: YUV, encoding: SignalEncoding = .standard, alpha: CGFloat = 1.0) {
        let Y = yuv.Y
        let U = yuv.U
        let V = yuv.V

        let k = encoding.coefficients
        let kr = (V * ((1.0 - k.r) / Constant.Vmax))
        let kgb = (U * ((k.b * (1.0 - k.b)) / (Constant.Umax * k.g)))
        let kgr = (V * ((k.r * (1.0 - k.r)) / (Constant.Vmax * k.g)))
        let kb = (U * ((1.0 - k.b) / Constant.Umax))

        let r = Y + kr
        let g = Y - kgb - kgr
        let b = Y + kb

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
