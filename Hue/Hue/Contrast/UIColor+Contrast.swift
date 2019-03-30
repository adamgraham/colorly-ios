//
//  UIColor+Contrast.swift
//  Hue
//
//  Created by Adam Graham on 3/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

public extension UIColor {

    var luminance: CGFloat {
        let ciColor = CIColor(color: self)

        func adjust(colorComponent: CGFloat) -> CGFloat {
            return (colorComponent < 0.03928) ? (colorComponent / 12.92) : pow((colorComponent + 0.055) / 1.055, 2.4)
        }

        return 0.2126 * adjust(colorComponent: ciColor.red) +
               0.7152 * adjust(colorComponent: ciColor.green) +
               0.0722 * adjust(colorComponent: ciColor.blue)
    }

    static func contrastRatio(between color1: UIColor, and color2: UIColor) -> CGFloat {
        let luminance1 = color1.luminance
        let luminance2 = color2.luminance

        let luminanceDarker = min(luminance1, luminance2)
        let luminanceLighter = max(luminance1, luminance2)

        return (luminanceLighter + 0.05) / (luminanceDarker + 0.05)
    }

    func contrastRatio(to color: UIColor) -> CGFloat {
        return UIColor.contrastRatio(between: self, and: color)
    }

    func highestContrastRatio(between color1: UIColor, and color2: UIColor) -> UIColor {
        let contrastRatio1 = contrastRatio(to: color1)
        let contrastRatio2 = contrastRatio(to: color2)
        return contrastRatio1 > contrastRatio2 ? color1 : color2
    }

    func lowestContrastRatio(between color1: UIColor, and color2: UIColor) -> UIColor {
        let contrastRatio1 = contrastRatio(to: color1)
        let contrastRatio2 = contrastRatio(to: color2)
        return contrastRatio1 < contrastRatio2 ? color1 : color2
    }

}
