//
//  UIColor+Inversion.swift
//  Colorly
//
//  Created by Adam Graham on 4/5/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to produce the inverse of a color.
public extension UIColor {

    // MARK: Inversion

    /// The negative of the color, produced by inverting the RGB values.
    var inverted: UIColor {
        var rgba = self.rgbaComponents
        rgba.r = 1.0 - rgba.r
        rgba.g = 1.0 - rgba.g
        rgba.b = 1.0 - rgba.b
        return UIColor(rgba: rgba)
    }

}
