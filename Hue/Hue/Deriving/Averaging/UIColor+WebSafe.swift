//
//  UIColor+WebSafe.swift
//  Hue
//
//  Created by Adam Graham on 5/19/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to derive web safe colors.
public extension UIColor {

    /// The nearest web safe color to the current color. All web safe colors have RGB
    /// component values of 0, 51, 102, 153, 204, or 255 (20% intervals).
    var webSafe: UIColor {
        var rgba = self.rgba
        rgba.red = (rgba.red + 25) / 51 * 51
        rgba.green = (rgba.green + 25) / 51 * 51
        rgba.blue = (rgba.blue + 25) / 51 * 51
        return UIColor(rgba)
    }

}
