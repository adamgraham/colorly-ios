//
//  UIColor+Harmony.swift
//  Hue
//
//  Created by Adam Graham on 3/28/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

public extension UIColor {

    public struct Harmony {

        public typealias Monochromatic = (UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor)
        public typealias SplitComplementary = (UIColor, UIColor, UIColor)
        public typealias Analogous = (UIColor, UIColor, UIColor)
        public typealias Triadic = (UIColor, UIColor, UIColor)
        public typealias Tetradic = (UIColor, UIColor, UIColor, UIColor)

        private let color: UIColor

        fileprivate init(_ color: UIColor) {
            self.color = color
        }

        var complement: UIColor {
            return self.color.adjustingHue(by: 180.0)
        }

        var splitComplementary: SplitComplementary {
            return (self.color,
                    self.color.adjustingHue(by: 150.0),
                    self.color.adjustingHue(by: 210.0))
        }

        var analogous: Analogous {
            return (self.color,
                    self.color.adjustingHue(by: 30.0),
                    self.color.adjustingHue(by: -30.0))
        }

        var triadic: Triadic {
            return (self.color,
                    self.color.adjustingHue(by: 120.0),
                    self.color.adjustingHue(by: -120.0))
        }

        var tetradic: Tetradic {
            return (self.color,
                    self.color.adjustingHue(by: 60.0),
                    self.color.adjustingHue(by: 180.0),
                    self.color.adjustingHue(by: 240.0))
        }

    }

    var harmony: Harmony {
        return Harmony(self)
    }

    func adjustingHue(by amount: CGFloat) -> UIColor {
        var hsl = self.hsl
        hsl.hue = (hsl.hue + (amount / 360.0)).truncatingRemainder(dividingBy: 1.0)
        return UIColor(hsl: hsl)
    }

}
