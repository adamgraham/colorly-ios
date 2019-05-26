//
//  UIColor+Gradient.swift
//  Hue
//
//  Created by Adam Graham on 4/5/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to generate color gradients.
public extension UIColor {

    /**
     Generates an array of colors between a start and end color. The colors are produced by
     mixing the start color with the end color with evenly distributed stops.

     - parameter start: The starting color of the gradient.
     - parameter end: The ending color of the gradient.
     - parameter stops: The number of colors to be produced, including the start and end.
                        For example, 5 stops would return the following:
                        `[start, 25%, 50%, 75%, end]`

     - returns: The array of colors forming the gradient.
     */
    static func gradient(between start: UIColor, and end: UIColor, stops: Int = 5) -> [UIColor] {
        var colors = [UIColor]()

        for i in 1...stops {
            let ratio = CGFloat(i-1) / CGFloat(stops-1)
            colors.append(start.mixed(with: end, weight: ratio))
        }

        return colors
    }

    /**
     Generates an array of colors between a start and end color. The colors are produced by
     mixing the start color with the end color with a custom array of distributed stops. This
     function can be used to generate a gradient that is not evenly distributed.

     - parameter start: The color at a stop of `0%`.
     - parameter end: The color at a stop of `100%`.
     - parameter customStops: The array of custom stop percentages. The start and end color are
                              not included by default; therefore, a value of `0.0` and `1.0` should
                              be included in the array, if desired.

     - returns: The array of colors forming the gradient.
     */
    static func gradient(between start: UIColor, and end: UIColor, customStops: [CGFloat]) -> [UIColor] {
        var colors = [UIColor]()

        for stop in customStops {
            colors.append(start.mixed(with: end, weight: stop))
        }

        return colors
    }

}
