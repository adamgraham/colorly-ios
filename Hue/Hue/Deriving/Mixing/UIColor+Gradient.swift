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
     Generates an array of colors between a start color and an end color. The colors are
     produced by mixing the start color with the end color with evenly distanced stops.

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

}
