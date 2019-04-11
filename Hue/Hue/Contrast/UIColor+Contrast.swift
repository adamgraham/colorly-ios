//
//  UIColor+Contrast.swift
//  Hue
//
//  Created by Adam Graham on 3/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to retrieve contrast ratio values between colors.
public extension UIColor {

    /**
     Returns the contrast ratio between two colors based on their luminance values.

     - parameter color1: The first color to compare to the second.
     - parameter color2: The second color to compare to the first.

     - returns: The contrast ratio between the two colors.
     */
    static func contrastRatio(between color1: UIColor, and color2: UIColor) -> CGFloat {
        let luminance1 = color1.luminance
        let luminance2 = color2.luminance

        let luminanceDarker = min(luminance1, luminance2)
        let luminanceLighter = max(luminance1, luminance2)

        return (luminanceLighter + 0.05) / (luminanceDarker + 0.05)
    }

    /**
     Returns the contrast ratio of the color compared to another color based on their
     luminance values.

     - parameter color: The other color to compare.
     - returns: The contrast ratio between the two colors.
     */
    func contrastRatio(to color: UIColor) -> CGFloat {
        return UIColor.contrastRatio(between: self, and: color)
    }

    /**
     Compares the contrast ratio of the color to two others and returns which of the two
     colors has the higher ratio.

     - parameter color1: The first color to compare to the base color.
     - parameter color2: The second color to compare to the base color.

     - returns: The color with the higher contrast ratio compared to the base color.
     */
    func higherContrastingColor(between color1: UIColor, and color2: UIColor) -> UIColor {
        let contrastRatio1 = contrastRatio(to: color1)
        let contrastRatio2 = contrastRatio(to: color2)
        return contrastRatio1 > contrastRatio2 ? color1 : color2
    }

    /**
     Compares the contrast ratio of the color to an array of others and returns which color in
     the array has the highest ratio.

     - parameter colors: An array of colors to compare to the base color.
     - returns: The color with the highest contrast ratio compared to the base color.
     */
    func highestContrastingColor(between colors: [UIColor]) -> UIColor? {
        return colors.max(by: { contrastRatio(to: $0) < contrastRatio(to: $1) })
    }

    /**
     Compares the contrast ratio of the color to two others and returns which of the two
     colors has the lower ratio.

     - parameter color1: The first color to compare to the base color.
     - parameter color2: The second color to compare to the base color.

     - returns: The color with the lower contrast ratio compared to the base color.
     */
    func lowerContrastingColor(between color1: UIColor, and color2: UIColor) -> UIColor {
        let contrastRatio1 = contrastRatio(to: color1)
        let contrastRatio2 = contrastRatio(to: color2)
        return contrastRatio1 < contrastRatio2 ? color1 : color2
    }

    /**
     Compares the contrast ratio of the color to an array of others and returns which color in
     the array has the lowest ratio.

     - parameter colors: An array of colors to compare to the base color.
     - returns: The color with the lowest contrast ratio compared to the base color.
     */
    func lowestContrastingColor(between colors: [UIColor]) -> UIColor? {
        return colors.min(by: { contrastRatio(to: $0) < contrastRatio(to: $1) })
    }

}
