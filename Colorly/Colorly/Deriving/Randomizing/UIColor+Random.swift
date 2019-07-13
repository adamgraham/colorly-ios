//
//  UIColor+Random.swift
//  Colorly
//
//  Created by Adam Graham on 4/9/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to generate random colors.
public extension UIColor {

    // MARK: Randomization

    /**
     Returns a color with random component values.

     - parameter includeAlpha: Indicates whether the alpha component should be randomized.
                               If `false`, the color will have an alpha value of `1.0`.

     - returns: The random color.
     */
    static func random(includeAlpha: Bool = false) -> UIColor {
        return UIColor(red: CGFloat.random(in: 0.0...1.0),
                       green: CGFloat.random(in: 0.0...1.0),
                       blue: CGFloat.random(in: 0.0...1.0),
                       alpha: includeAlpha ? CGFloat.random(in: 0.0...1.0) : 1.0)
    }

    /**
     Returns a set of unique colors with random component values.

     - parameter amount: The amount of random colors to be generated.
     - parameter includeAlpha: Indicates whether the alpha components should be randomized.
                               If `false`, the colors will have an alpha value of `1.0`.

     - returns: The random set of colors.
     */
    static func randomSet(of amount: Int, includeAlpha: Bool = false) -> Set<UIColor> {
        var colors = Set<UIColor>()

        while colors.count < amount {
            colors.insert(UIColor.random(includeAlpha: includeAlpha))
        }

        return colors
    }

}
