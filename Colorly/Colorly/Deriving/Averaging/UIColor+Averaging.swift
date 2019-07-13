//
//  UIColor+Averaging.swift
//  Colorly
//
//  Created by Adam Graham on 4/10/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to calculate color averages.
public extension UIColor {

    // MARK: Averaging

    /**
     Returns the average color of an array of colors.

     This function accounts for human visual perception by squaring the RGB values first,
     then dividing by the number of colors and taking the square root. Here is a video that
     explains it further: https://www.youtube.com/watch?v=LKnqECcg6Gw.

     - parameter colors: The array of colors to average.
     - returns: The average color.
     */
    static func average(of colors: [UIColor]) -> UIColor {
        var rgba = (r: CGFloat(), g: CGFloat(), b: CGFloat(), a: CGFloat())

        for color in colors {
            let components = color.rgbaComponents
            rgba.r += pow(components.r, 2.0)
            rgba.g += pow(components.g, 2.0)
            rgba.b += pow(components.b, 2.0)
            rgba.a += pow(components.a, 2.0)
        }

        let count = CGFloat(colors.count)
        rgba.r = sqrt(rgba.r / count)
        rgba.g = sqrt(rgba.g / count)
        rgba.b = sqrt(rgba.b / count)
        rgba.a = sqrt(rgba.a / count)

        return UIColor(rgba: rgba)
    }

    /**
     Returns the average of two colors.

     This function accounts for human visual perception by squaring the RGB values first,
     then dividing by two and taking the square root. Here is a video that explains it further:
     https://www.youtube.com/watch?v=LKnqECcg6Gw.

     - parameter color1: The first color to average with the second.
     - parameter color2: The second color to average with the first.

     - returns: The average color.
     */
    static func average(of color1: UIColor, and color2: UIColor) -> UIColor {
        return average(of: [color1, color2])
    }

}
