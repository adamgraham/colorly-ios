//
//  UIColor+XYZ.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from CIE-XYZ colors.
public extension UIColor {

    /// The components of a color in the CIE-XYZ color model.
    ///
    /// - **x** – a mix (a linear combination) of cone response curves chosen to be non-negative
    /// - **y** – luminance (perceived brightness)
    /// - **z** – quasi-equal to blue stimulation, or the "S" cone response
    typealias XYZ = (
        x: CGFloat, // 0 to 1 (% of 100)
        y: CGFloat, // 0 to 1 (% of 100)
        z: CGFloat  // 0 to 1 (% of 100)
    )

    /// The components of the color in the CIE-XYZ color model.
    var xyz: XYZ {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0

        getRed(&r, green: &g, blue: &b, alpha: nil)

        // sRGB (D65) gamma correction - inverse companding to get linear values
        r = (r <= 0.04045) ? (r / 12.92) : pow((r + 0.055) / 1.055, 2.4)
        g = (g <= 0.04045) ? (g / 12.92) : pow((g + 0.055) / 1.055, 2.4)
        b = (b <= 0.04045) ? (b / 12.92) : pow((b + 0.055) / 1.055, 2.4)

        // sRGB (D65) matrix transformation
        let x = (0.4124 * r) + (0.3576 * g) + (0.1805 * b)
        let y = (0.2126 * r) + (0.7152 * g) + (0.0722 * b)
        let z = (0.0193 * r) + (0.1192 * g) + (0.9505 * b)

        return XYZ(x: x, y: y, z: z)
    }

    /// Initializes a color from the components of a CIE-XYZ color model.
    convenience init(xyz: XYZ, alpha: CGFloat = 1.0) {
        // sRGB (D65) matrix transformation
        var r =  (3.2406 * xyz.x) - (1.5372 * xyz.y) - (0.4986 * xyz.z)
        var g = (-0.9689 * xyz.x) + (1.8758 * xyz.y) + (0.0415 * xyz.z)
        var b =  (0.0557 * xyz.x) - (0.2040 * xyz.y) + (1.0570 * xyz.z)

        // sRGB (D65) gamma correction - companding to get non-linear values
        r = (r <= 0.0031308) ? (12.92 * r) : (1.055 * pow(r, 1/2.4) - 0.055)
        g = (g <= 0.0031308) ? (12.92 * g) : (1.055 * pow(g, 1/2.4) - 0.055)
        b = (b <= 0.0031308) ? (12.92 * b) : (1.055 * pow(b, 1/2.4) - 0.055)

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
