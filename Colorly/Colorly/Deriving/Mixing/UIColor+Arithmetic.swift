//
//  UIColor+Arithmetic.swift
//  Colorly
//
//  Created by Adam Graham on 3/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// Returns the result of adding two colors together.
public func +(lhs: UIColor, rhs: UIColor) -> UIColor {
    var (r1, g1, b1, a1) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
    lhs.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)

    var (r2, g2, b2, a2) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
    rhs.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

    return UIColor(red: clamp(r1 + r2, 0.0, 1.0),
                   green: clamp(g1 + g2, 0.0, 1.0),
                   blue: clamp(b1 + b2, 0.0, 1.0),
                   alpha: clamp((a1 + a2) / 2.0, 0.0, 1.0))
}

/// Returns the result of subtracting one color from another.
public func -(lhs: UIColor, rhs: UIColor) -> UIColor {
    var (r1, g1, b1, a1) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
    lhs.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)

    var (r2, g2, b2, a2) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
    rhs.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

    return UIColor(red: clamp(r1 - r2, 0.0, 1.0),
                   green: clamp(g1 - g2, 0.0, 1.0),
                   blue: clamp(b1 - b2, 0.0, 1.0),
                   alpha: clamp((a1 + a2) / 2.0, 0.0, 1.0))
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

/// Returns the result of dividing a color by a divisor.
public func /(color: UIColor, divisor: CGFloat) -> UIColor {
    var (r, g, b, a) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
    color.getRed(&r, green: &g, blue: &b, alpha: &a)

    return UIColor(red: clamp(r / divisor, 0.0, 1.0),
                   green: clamp(g / divisor, 0.0, 1.0),
                   blue: clamp(b / divisor, 0.0, 1.0),
                   alpha: a)
}
