//
//  UIColor+ColorWheel.swift
//  Hue
//
//  Created by Adam Graham on 4/19/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to declare common tertiary colors.
extension UIColor {

    /// A color object whose RGB values are 0.0, 0.5, and 1.0 and whose alpha value is 1.0.
    open class var azure: UIColor { return (cyan * 0.5) + (blue * 0.5) }
    /// A color object whose RGB values are 0.5, 0.0, and 1.0 and whose alpha value is 1.0.
    open class var violet: UIColor { return (blue * 0.5) + (magenta * 0.5) }
    /// A color object whose RGB values are 1.0, 0.0, and 0.5 and whose alpha value is 1.0.
    open class var rose: UIColor { return (magenta * 0.5) + (red * 0.5) }
    /// A color object whose RGB values are 1.0, 0.5, and 0.0 and whose alpha value is 1.0.
    // open class var orange: UIColor { return (red * 0.5) + (yellow * 0.5) }
    /// A color object whose RGB values are 0.5, 1.0, and 0.0 and whose alpha value is 1.0.
    open class var chartreuse: UIColor { return (yellow * 0.5) + (green * 0.5) }
    /// A color object whose RGB values are 0.0, 1.0, and 0.5 and whose alpha value is 1.0.
    open class var springGreen: UIColor { return (green * 0.5) + (cyan * 0.5) }

}

/// An extension to declare the colors of the color wheel.
public extension UIColor {

    /// The colors that define the color wheel.
    struct ColorWheel {

        /// The colors that define the RGB color wheel.
        public struct RGB {

            /// `#ffffff`, `rgb(255,255,255)`
            public static let white = UIColor.white
            /// `#000000`, `rgb(0,0,0)`
            public static let black = UIColor.black

            /// `#ff0000`, `rgb(255,0,0)`
            public static let red = UIColor.red
            /// `#00ff00`, `rgb(0,255,0)`
            public static let green = UIColor.green
            /// `#0000ff`, `rgb(0,0,255)`
            public static let blue = UIColor.blue

            /// `#00ffff`, `rgb(0,255,255)`
            public static let cyan = UIColor.cyan
            /// `#ff00ff`, `rgb(255,0,255)`
            public static let magenta = UIColor.magenta
            /// `#ffff00`, `rgb(255,255,0)`
            public static let yellow = UIColor.yellow

            /// `#0080ff`, `rgb(0,128,255)`
            public static let azure = UIColor.azure
            /// `#8000ff`, `rgb(128,0,255)`
            public static let violet = UIColor.violet
            /// `#ff0080`, `rgb(255,0,128)`
            public static let rose = UIColor.rose
            /// `#ff8000`, `rgb(255,128,0)`
            public static let orange = UIColor.orange
            /// `#80ff00`, `rgb(128,255,0)`
            public static let chartreuse = UIColor.chartreuse
            /// `#00ff80`, `rgb(0,255,128)`
            public static let springGreen = UIColor.springGreen

            internal init() {}

        }

        /// The colors that define the RYB color wheel.
        public struct RYB {

            /// `#ffffff`, `ryb(255,255,255)`
            public static let white = UIColor.white
            /// `#000000`, `ryb(0,0,0)`
            public static let black = UIColor.black

            /// `#ff0000`, `ryb(255,0,0)`
            public static let red = UIColor.red
            /// `#00ff00`, `ryb(0,255,0)`
            public static let yellow = UIColor.yellow
            /// `#0000ff`, `ryb(0,0,255)`
            public static let blue = UIColor.blue

            /// `#00ffff`, `ryb(0,255,255)`
            public static let green = UIColor.green
            /// `#ff00ff`, `ryb(255,0,255)`
            public static let purple = UIColor.magenta
            /// `#ffff00`, `ryb(255,255,0)`
            public static let orange = UIColor.orange

            /// `#ff8000`, `ryb(255,128,0)`
            public static let vermilion = (red * 0.5) + (orange * 0.5)
            /// `#80ff00`, `ryb(128,255,0)`
            public static let amber = (orange * 0.5) + (yellow * 0.5)
            /// `#00ff80`, `ryb(0,255,128)`
            public static let chartreuse = (yellow * 0.5) + (green * 0.5)
            /// `#0080ff`, `ryb(0,128,255)`
            public static let teal = (green * 0.5) + (blue * 0.5)
            /// `#8000ff`, `ryb(128,0,255)`
            public static let violet = (blue * 0.5) + (purple * 0.5)
            /// `#ff0080`, `ryb(255,0,128)`
            public static let magenta = (purple * 0.5) + (red * 0.5)

            internal init() {}

        }

        internal init() {}

    }

}
