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
internal func clamp<T: Comparable>(_ value: T, _ lower: T, _ upper: T) -> T {
    return min(max(value, lower), upper)
}
