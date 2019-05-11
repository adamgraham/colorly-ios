//
//  UIColor+MixingModel.swift
//  Hue
//
//  Created by Adam Graham on 3/27/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to describe different color mixing models.
public extension UIColor {

    /// A model that describes how colors are mixed together to form all other colors.
    enum MixingModel {

        /// A mixing model that leads to the RGB color model with primary colors of red, green,
        /// and blue. The absence of color is black, and the presence of all three primary colors is
        /// white. Colors are added from black to form white. Additive color mixing simulates light.
        case additive

        /// A mixing model that leads to the CMYK color model with primary colors of cyan,
        /// magenta, and yellow. The absence of color is white, and the presence of all three
        /// primary colors is black. Colors are subtracted from black to form white. Subtractive
        /// color mixing simulates print.
        case subtractive

        /// A mixing model that leads to the RYB color model with primary colors of red, yellow,
        /// and blue. The absence of color is white, and the presence of all three primary colors is
        /// black. Traditional color mixing simulates paint.
        case traditional

        /// The primary colors of the mixing model.
        public var primaryColors: (UIColor, UIColor, UIColor) {
            switch self {
            case .additive:
                return (.red, .green, .blue)
            case .subtractive:
                return (.cyan, .magenta, .yellow)
            case .traditional:
                return (.red, .yellow, .blue)
            }
        }

        /// The secondary colors of the mixing model.
        public var secondaryColors: (UIColor, UIColor, UIColor) {
            switch self {
            case .additive:
                return (.cyan, .magenta, .yellow)
            case .subtractive:
                return (.red, .green, .blue)
            case .traditional:
                return (.green, .magenta, .orange)
            }
        }

        /// The tertiary colors of the mixing model, created by mixing the primary colors with the
        /// secondary colors.
        public var tertiaryColors: (UIColor, UIColor, UIColor,
                                    UIColor, UIColor, UIColor) {

            let primary = self.primaryColors
            let secondary = self.secondaryColors

            return (primary.0 * 0.5 + secondary.1 * 0.5,
                    primary.0 * 0.5 + secondary.2 * 0.5,
                    primary.1 * 0.5 + secondary.0 * 0.5,
                    primary.1 * 0.5 + secondary.2 * 0.5,
                    primary.2 * 0.5 + secondary.0 * 0.5,
                    primary.2 * 0.5 + secondary.1 * 0.5)
        }

        /// The primary, secondary, and tertiary colors of the mixing model, together forming a
        /// complete color wheel.
        public var colorWheel: (UIColor, UIColor, UIColor,
                                UIColor, UIColor, UIColor,
                                UIColor, UIColor, UIColor,
                                UIColor, UIColor, UIColor) {

            let primary = self.primaryColors
            let secondary = self.secondaryColors
            let tertiary = self.tertiaryColors

            return (primary.0, tertiary.1, secondary.2, tertiary.3,
                    primary.1, tertiary.2, secondary.0, tertiary.4,
                    primary.2, tertiary.5, secondary.1, tertiary.0)
        }

    }

}
