//
//  Functions.swift
//  Hue
//
//  Created by Adam Graham on 3/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

/**
 Restricts a value between a lower and upper range.

 - Parameters:
    - value: The value to be clamped.
    - lower: The minimum value that can be returned.
    - upper: The maximum value that can be returned.

 - Returns: The clamped value between `lower` and `upper`.
 */
func clamp<T: Comparable>(_ value: T, _ lower: T, _ upper: T) -> T {
    return min(max(value, lower), upper)
}

/**
 Restricts a value between a lower and upper range by wrapping the value as needed.
 For example, a value of `1.5` clamped between `0.0` and `1.0` would return `0.5`.

 - Parameters:
    - value: The value to be clamped.
    - lower: The minimum value that can be returned.
    - upper: The maximum value that can be returned.

 - Returns: The clamped value between `lower` and `upper`.
 */
func rotatingClamp<T: Numeric & Comparable>(_ value: T, _ lower: T, _ upper: T) -> T {
    var value = value
    let delta = upper - lower
    while value < lower { value += delta }
    while value > upper { value -= delta }
    return value
}

/**
 Converts degrees to radians. 1° × π/180 = 0.01745rad

 - parameter degrees: The amount of degrees to convert to radians.
 - returns: The amount of radians equal to the amount of degrees.
 */
func deg2rad(_ degrees: CGFloat) -> CGFloat {
    return degrees * .pi / 180.0
}

/**
 Converts radians to degrees. 1rad × 180/π = 57.296°

 - parameter radians: The amount of radians to convert to degrees.
 - returns: The amount of degrees equal to the amount of radians.
 */
func rad2deg(_ radians: CGFloat) -> CGFloat {
    return radians * 180.0 / .pi
}

extension CGFloat {

    /**
     Returns `true` if the number is close to zero with a given accuracy.

     - parameter accuracy: The margin of error within which the number is still considered zero.
     - returns: `true` if self is between +0.0+accuracy and -0.0-accuracy.
     */
    func isZero(accuracy: CGFloat) -> Bool {
        return self >= -accuracy && self <= accuracy
    }

}
