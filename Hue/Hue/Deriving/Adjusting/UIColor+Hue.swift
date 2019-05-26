//
//  UIColor+Hue.swift
//  Hue
//
//  Created by Adam Graham on 4/3/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to adjust the hue of a color.
public extension UIColor {

    /// Returns a new instance of the color with an adjusted hue.
    /// - parameter degrees: The amount to adjust the hue, in the range [-360°, 360°].
    /// - returns: The hue adjusted color.
    func adjustingHue(by degrees: CGFloat) -> UIColor {
        let degrees = rotatingClamp(degrees, 0.0, 360.0)
        var hsb = self.hsb
        hsb.hue = (hsb.hue + degrees).truncatingRemainder(dividingBy: 360.0)
        return UIColor(hsb: hsb)
    }

    /// The color opposite on the color wheel, equivalant to adjusting the hue by 180°.
    var complement: UIColor {
        return adjustingHue(by: 180.0)
    }

    /// Returns `true` if the color falls on the cool side of the color wheel
    /// (90° ≤ hue < 270°).
    var isCool: Bool {
        let hue = self.hueComponent * 360.0
        return hue >= 90.0 && hue < 270.0
    }

    /// Returns `true` if the color falls on the warm side of the color wheel
    /// (90° > hue ≥ 270°).
    var isWarm: Bool {
        return !self.isCool
    }

}
