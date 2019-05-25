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

        /// The luminance component of the color, in the full range [0, 255] (black to white).
        public var Y: CGFloat

        /// The blue-difference chrominance component of the color, in the full range [0, 255].
        public var Cb: CGFloat

        /// The red-difference chrominance component of the color, in the full range [0, 255].
        public var Cr: CGFloat

    }

    /// The YCbCr components of the color using standard-definition encoding.
    var yCbCr: YCbCr {
        return yCbCr(.standard)
    }

    /// The YCbCr components of the color using a given encoding.
    func yCbCr(_ encoding: SignalEncoding) -> YCbCr {
        let yPbPr = self.yPbPr(encoding)

        let Y  = (yPbPr.Y  * 255.0)
        let Cb = (yPbPr.Pb * 255.0) + 127.5
        let Cr = (yPbPr.Pr * 255.0) + 127.5

        return YCbCr(Y: Y, Cb: Cb, Cr: Cr)
    }

    /// Initializes a color from YCbCr components.
    /// - parameter yCbCr: The components used to initialize the color.
    /// - parameter encoding: The signal encoding with which the components were derived.
    /// - parameter alpha: The alpha value of the color.
    convenience init(yCbCr: YCbCr,
                     encoding: SignalEncoding,
                     alpha: CGFloat = 1.0) {

        let Y  = (yCbCr.Y  / 255.0)
        let Pb = (yCbCr.Cb / 255.0) - 0.5
        let Pr = (yCbCr.Cr / 255.0) - 0.5

        self.init(yPbPr: YPbPr(Y: Y, Pb: Pb, Pr: Pr),
                  encoding: encoding,
                  alpha: alpha)
    }

}
