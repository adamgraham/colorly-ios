//
//  UIColor+Harmony.swift
//  Hue
//
//  Created by Adam Graham on 3/28/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

public extension UIColor {

    /// A set of harmonized color schemes created from a base color.
    public struct Harmony {

        /// The base color used to create the harmonized color schemes.
        private let color: UIColor

        /// Initializes a set of harmonized color schemes from a base color.
        fileprivate init(_ color: UIColor) {
            self.color = color
        }

        /// Monochromatic color schemes use different values of the same color.
        public typealias Monochromatic = (UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor)
        /// Complementary color schemes use two opposite colors on the color wheel.
        public typealias Complementary = (UIColor)
        /// Split complements use a color and the two adjacent tertiary colors of its complement.
        public typealias SplitComplementary = (UIColor, UIColor, UIColor)
        /// Analogous color schemes use three adjacent colors on the color wheel.
        public typealias Analogous = (UIColor, UIColor, UIColor)
        /// Triadic color schemes use three evenly spaced colors on the color wheel.
        public typealias Triadic = (UIColor, UIColor, UIColor)
        /// Tetradic color schemes use two complementary pairs in a rectangular pattern on the color wheel.
        public typealias Tetradic = (UIColor, UIColor, UIColor, UIColor)

        /// The opposite color on the color wheel (hue+180).
        var complementary: Complementary {
            return self.color.adjustingHue(by: 180.0)
        }

        /// The base color and two adjacent colors of the complement (base, hue+180-30, hue+180+30).
        var splitComplementary: SplitComplementary {
            return (self.color,
                    self.color.adjustingHue(by: 150.0),
                    self.color.adjustingHue(by: 210.0))
        }

        /// The base color and two adjacent colors (base, hue+30, hue-30).
        var analogous: Analogous {
            return (self.color,
                    self.color.adjustingHue(by: 30.0),
                    self.color.adjustingHue(by: -30.0))
        }

        /// The base color and two evenly spaced colors (base, hue+120, hue-120).
        var triadic: Triadic {
            return (self.color,
                    self.color.adjustingHue(by: 120.0),
                    self.color.adjustingHue(by: -120.0))
        }

        /// The base color and its complement and another complement pair (base, hue+180, hue+60, hue+60+180).
        var tetradic: Tetradic {
            return (self.color,
                    self.color.adjustingHue(by: 180.0),
                    self.color.adjustingHue(by: 60.0),
                    self.color.adjustingHue(by: 240.0))
        }

    }

    /// A set of harmonized color schemes based on the base color.
    var harmony: Harmony {
        return Harmony(self)
    }

    /**
     Returns a new color by adjusting the color's hue by a given amount.

     - parameter amount: The amount of degrees to adjust the hue, in the range -360° to 360°.
     - returns: The hue adjusted color.
     */
    func adjustingHue(by amount: CGFloat) -> UIColor {
        var hsl = self.hsl
        hsl.hue = (hsl.hue + (amount / 360.0)).truncatingRemainder(dividingBy: 1.0)
        return UIColor(hsl: hsl)
    }

}
