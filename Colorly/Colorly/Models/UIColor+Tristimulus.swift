//
//  UIColor+Tristimulus.swift
//  Colorly
//
//  Created by Adam Graham on 5/6/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to declare the tristimulus system.
public extension UIColor {

    /// Tristimulus system, a system for visually matching a color under standardized
    /// conditions against the three primary colors — red, green, and blue; the three results
    /// are expressed as X, Y, and Z, respectively, and are called tristimulus values.
    typealias Tristimulus = UIColor.CIEXYZ

}
