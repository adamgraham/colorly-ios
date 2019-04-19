//
//  UIColor+Arithmetic.swift
//  Hue
//
//  Created by Adam Graham on 3/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// Returns the result of adding two colors together.
/// This is the same as mixing 50% of each color together.
public func +(lhs: UIColor, rhs: UIColor) -> UIColor {
    return UIColor.mixing(lhs, with: rhs, weight: 0.5)
}

/// Returns the result of multiplying a color by a multiplier.
public func *(color: UIColor, multiplier: CGFloat) -> UIColor {
    var (r, g, b, a) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
    color.getRed(&r, green: &g, blue: &b, alpha: &a)

    return UIColor(red: clamp(r * multiplier, 0.0, 1.0),
                   green: clamp(g * multiplier, 0.0, 1.0),
                   blue: clamp(b * multiplier, 0.0, 1.0),
                   alpha: a)
}
