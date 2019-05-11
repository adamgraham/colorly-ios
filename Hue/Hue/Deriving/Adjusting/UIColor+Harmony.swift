//
//  UIColor+Harmony.swift
//  Hue
//
//  Created by Adam Graham on 3/28/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to generate harmonized color schemes.
public extension UIColor {

    /// A set of harmonized color schemes created from a base color.
    struct Harmony {

        /// The base color used to create the harmonized color schemes.
        private let color: UIColor

        /// Initializes a set of harmonized color schemes from a base color.
        fileprivate init(_ color: UIColor) {
            self.color = color
        }

        /// Monochromatic color schemes use different values of the same color.
        public typealias Monochromatic = (UIColor, UIColor, UIColor, UIColor, UIColor)
        /// Complementary color schemes use two opposite colors on the color wheel.
        public typealias Complementary = (UIColor, UIColor)
        /// Split complements use a color and the two adjacent tertiary colors of its complement.
        public typealias SplitComplementary = (UIColor, UIColor, UIColor)
        /// Analogous color schemes use three adjacent colors on the color wheel.
        public typealias Analogous = (UIColor, UIColor, UIColor)
        /// Triadic color schemes use three evenly spaced colors on the color wheel.
        public typealias Triadic = (UIColor, UIColor, UIColor)
        /// Tetradic color schemes use two complementary pairs in a rectangular pattern on the color wheel.
        public typealias Tetradic = (UIColor, UIColor, UIColor, UIColor)
        /// Square color schemes use two evenly spaced complementary pairs on the color wheel.
        public typealias Square = (UIColor, UIColor, UIColor, UIColor)

        /// The base color and two of its tints and shades.
        /// (tint50%, tint25%, base, shade25%, shade50%).
        public var monochromatic: Monochromatic {
            return (self.color.tint(percent: 0.50),
                    self.color.tint(percent: 0.25),
                    self.color,
                    self.color.shade(percent: 0.25),
                    self.color.shade(percent: 0.50))
        }

        /// The base color and the opposite color on the color wheel (base, hue+180).
        public var complementary: Complementary {
            return (self.color,
                    self.color.adjustingHue(by: 180.0))
        }

        /// The base color and the two adjacent colors of the complement
        /// (base, hue+180-30, hue+180+30).
        public var splitComplementary: SplitComplementary {
            return (self.color,
                    self.color.adjustingHue(by: 150.0),
                    self.color.adjustingHue(by: 210.0))
        }

        /// The base color and the two adjacent colors (base, hue+30, hue-30).
        public var analogous: Analogous {
            return (self.color,
                    self.color.adjustingHue(by: 30.0),
                    self.color.adjustingHue(by: -30.0))
        }

        /// The base color and two evenly spaced colors (base, hue+120, hue-120).
        public var triadic: Triadic {
            return (self.color,
                    self.color.adjustingHue(by: 120.0),
                    self.color.adjustingHue(by: -120.0))
        }

        /// The base color and its complement (base, hue+180)
        /// and another complement pair (hue+60, hue+60+180).
        public var tetradic: Tetradic {
            return (self.color,
                    self.color.adjustingHue(by: 180.0),
                    self.color.adjustingHue(by: 60.0),
                    self.color.adjustingHue(by: 240.0))
        }

        /// The base color and its complement (base, hue+180)
        /// and an evenly spaced complement pair (hue+90, hue+90+180).
        public var square: Square {
            return (self.color,
                    self.color.adjustingHue(by: 180.0),
                    self.color.adjustingHue(by: 90.0),
                    self.color.adjustingHue(by: 270.0))
        }

    }

    /// A set of harmonized color schemes based on the base color.
    var harmonies: Harmony {
        return Harmony(self)
    }

}
