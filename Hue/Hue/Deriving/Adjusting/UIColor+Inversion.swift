//
//  UIColor+Inversion.swift
//  Hue
//
//  Created by Adam Graham on 4/5/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to produce the inverse of a color.
public extension UIColor {

    /// The negative of the color, produced by inverting the RGB values.
    var inverted: UIColor {
        var rgba = self.rgba
        rgba.red = 255.0 - rgb.red
        rgba.green = 255.0 - rgb.green
        rgba.blue = 255.0 - rgb.blue
        return UIColor(rgba: rgba)
    }

}
