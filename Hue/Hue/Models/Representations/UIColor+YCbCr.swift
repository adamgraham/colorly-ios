//
//  UIColor+YCbCr.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from Y′CbCr colors.
public extension UIColor {

    /// The Y′CbCr components of a color - luma (Y′) and chroma (Cb,Cr).
    struct YCbCr: Hashable {

        /// The luma component of the color, in the full range [0, 255] (black to white).
        public var Y: CGFloat
        /// The blue-difference chroma component of the color, in the full range [0, 255].
        public var Cb: CGFloat
        /// The red-difference chroma component of the color, in the full range [0, 255].
        public var Cr: CGFloat

    }

    /// The Y′CbCr components of the color using standard-definition encoding.
    var yCbCr: YCbCr {
        return yCbCr(.standard)
    }

    /// The Y′CbCr components of the color using a given encoding.
    /// - parameter encoding: The signal encoding with which the components are derived.
    /// - returns: The Y′CbCr components of the color.
    func yCbCr(_ encoding: SignalEncoding) -> YCbCr {
        let yPbPr = self.yPbPr(encoding)

        let Y  = (yPbPr.Y  * 255.0)
        let Cb = (yPbPr.Pb * 255.0) + 127.5
        let Cr = (yPbPr.Pr * 255.0) + 127.5

        return YCbCr(Y: Y, Cb: Cb, Cr: Cr)
    }

    /// Initializes a color from Y′CbCr components.
    /// - parameter yCbCr: The components used to initialize the color.
    /// - parameter encoding: The signal encoding with which the components were derived.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ yCbCr: YCbCr,
                     encoding: SignalEncoding = .standard,
                     alpha: CGFloat = 1.0) {

        let Y  = (yCbCr.Y  / 255.0)
        let Pb = (yCbCr.Cb / 255.0) - 0.5
        let Pr = (yCbCr.Cr / 255.0) - 0.5

        self.init(YPbPr(Y: Y, Pb: Pb, Pr: Pr),
                  encoding: encoding,
                  alpha: alpha)
    }

}
