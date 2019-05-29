//
//  UIColor+YIQ.swift
//  Hue
//
//  Created by Adam Graham on 5/25/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from Y′IQ colors.
public extension UIColor {

    /// The Y′IQ components of a color - luma (Y′) and chroma (I,Q).
    struct YIQ: Hashable {

        /// The luma component of the color, in the range [0, 1] (black to white).
        public var Y: CGFloat
        /// The orange-blue chroma component of the color, in the range [-0.596, 0.596].
        public var I: CGFloat
        /// The purple-green chroma component of the color, in the range [-0.523, 0.523].
        public var Q: CGFloat

    }

    /// Constant values used to convert to and from Y′IQ colors.
    private struct Constant {

        /// The cosine of 33°.
        static let cos33: CGFloat = cos(deg2rad(33.0))
        /// The sine of 33°.
        static let sin33: CGFloat = sin(deg2rad(33.0))

    }

    /// The Y′IQ components of the color using Rec.601 (standard-definition) encoding.
    var yiq: YIQ {
        return yiq(.rec601)
    }

    /// The Y′IQ components of the color using a given encoding.
    /// - parameter encoding: The signal encoding with which the components are derived.
    /// - returns: The Y′IQ components of the color.
    func yiq(_ encoding: SignalEncoding) -> YIQ {
        let yuv = self.yuv(encoding)

        let Y = yuv.Y
        let I = -(yuv.U * Constant.sin33) + (yuv.V * Constant.cos33)
        let Q = (yuv.U * Constant.cos33) + (yuv.V * Constant.sin33)

        return YIQ(Y: Y, I: I, Q: Q)
    }

    /// Initializes a color from Y′IQ components.
    /// - parameter yiq: The components used to initialize the color.
    /// - parameter encoding: The signal encoding with which the components were derived.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ yiq: YIQ,
                     encoding: SignalEncoding = .rec601,
                     alpha: CGFloat = 1.0) {

        let Y = yiq.Y
        let U = -(yiq.I * Constant.sin33) + (yiq.Q * Constant.cos33)
        let V = (yiq.I * Constant.cos33) + (yiq.Q * Constant.sin33)

        self.init(YUV(Y: Y, U: U, V: V),
                  encoding: encoding,
                  alpha: alpha)
    }

}
