//
//  UIColor+YIQ.swift
//  Hue
//
//  Created by Adam Graham on 5/25/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from YIQ colors.
public extension UIColor {

    /// The YIQ components of a color - luminance (Y) and chrominance (I,Q).
    struct YIQ {

        /// The luminance component of the color, in the range [0, 1] (black to white).
        public var Y: CGFloat
        /// The orange-blue chrominance component of the color, in the range [-0.5957, 0.5957].
        public var I: CGFloat
        /// The purple-green chrominance component of the color, in the range [-0.5226, 0.5226].
        public var Q: CGFloat

    }

    /// The YIQ components of the color.
    var yiq: YIQ {
        let rgb = self.rgbComponents

        let Y =  (0.299 * rgb.r) +  (0.587 * rgb.g) +  (0.114 * rgb.b)
        let I = (0.5959 * rgb.r) - (0.2746 * rgb.g) - (0.3213 * rgb.b)
        let Q = (0.2115 * rgb.r) - (0.5227 * rgb.g) + (0.3112 * rgb.b)

        return YIQ(Y: Y, I: I, Q: Q)
    }

    /// Initializes a color from YIQ components.
    /// - parameter yiq: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(_ yiq: YIQ, alpha: CGFloat = 1.0) {
        let r = yiq.Y + (0.956 * yiq.I) + (0.619 * yiq.Q)
        let g = yiq.Y - (0.272 * yiq.I) - (0.647 * yiq.Q)
        let b = yiq.Y - (1.106 * yiq.I) + (1.703 * yiq.Q)

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
