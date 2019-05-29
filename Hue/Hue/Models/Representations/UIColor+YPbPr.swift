//
//  UIColor+YPbPr.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from Y′PbPr colors.
public extension UIColor {

    /// The Y′PbPr components of a color - luma (Y′) and chroma (Cb,Cr).
    struct YPbPr: Hashable {

        /// The luma component of the color, in the range [0, 1] (black to white).
        public var Y: CGFloat
        /// The blue-difference chroma component of the color, in the range [-0.5, 0.5].
        public var Pb: CGFloat
        /// The red-difference chroma component of the color, in the range [-0.5, 0.5].
        public var Pr: CGFloat

    }

    /// The Y′PbPr components of the color using standard-definition encoding.
    var yPbPr: YPbPr {
        return yPbPr(.standard)
    }

    /// The Y′PbPr components of the color using a given encoding.
    /// - parameter encoding: The signal encoding with which the components are derived.
    /// - returns: The Y′PbPr components of the color.
    func yPbPr(_ encoding: SignalEncoding) -> YPbPr {
        let rgb = self.rgbComponents
        let k = encoding.coefficients

        let Y = (k.r * rgb.r) + (k.g * rgb.g) + (k.b * rgb.b)
        let Pb = 0.5 * ((rgb.b - Y) / (1.0 - k.b))
        let Pr = 0.5 * ((rgb.r - Y) / (1.0 - k.r))

        return YPbPr(Y: Y, Pb: Pb, Pr: Pr)
    }

    /// Initializes a color from Y′PbPr components.
    /// - parameter yPbPr: The components used to initialize the color.
    /// - parameter encoding: The signal encoding with which the components were derived.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ yPbPr: YPbPr, encoding: SignalEncoding = .standard, alpha: CGFloat = 1.0) {
        let Y = yPbPr.Y
        let Pb = yPbPr.Pb
        let Pr = yPbPr.Pr

        let k = encoding.coefficients
        let kr = (Pr * ((1.0 - k.r) / 0.5))
        let kgb = (Pb * ((k.b * (1.0 - k.b)) / (0.5 * k.g)))
        let kgr = (Pr * ((k.r * (1.0 - k.r)) / (0.5 * k.g)))
        let kb = (Pb * ((1.0 - k.b) / 0.5))

        let r = Y + kr
        let g = Y - kgb - kgr
        let b = Y + kb

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
