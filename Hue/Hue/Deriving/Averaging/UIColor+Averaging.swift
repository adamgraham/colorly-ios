//
//  UIColor+Averaging.swift
//  Hue
//
//  Created by Adam Graham on 4/10/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to calculate color averages.
public extension UIColor {

    /**
     Returns the average color of an array of colors.

     This function accounts for human visual perception by squaring the RGB values first,
     then dividing by the number of colors and taking the square root. Here is a video that
     explains it further: https://www.youtube.com/watch?v=LKnqECcg6Gw.

     - parameter colors: The array of colors to average.
     - returns: The average color.
     */
    static func average(of colors: [UIColor]) -> UIColor {
        var rgba = RGBA(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)

        for color in colors {
            let components = color.rgba
            rgba.red += pow(components.red, 2.0)
            rgba.green += pow(components.green, 2.0)
            rgba.blue += pow(components.blue, 2.0)
            rgba.alpha += pow(components.alpha, 2.0)
        }

        let count = CGFloat(colors.count)
        rgba.red = sqrt(rgba.red / count)
        rgba.green = sqrt(rgba.green / count)
        rgba.blue = sqrt(rgba.blue / count)
        rgba.alpha = sqrt(rgba.alpha / count)

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
