//
//  UIColor+Accessibility.swift
//  Colorly
//
//  Created by Adam Graham on 3/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to test if colors meet standard accessibility contrast requirements.
public extension UIColor {

    /// A requirement defining how the visual presentation of text achieves a minimum contrast
    /// ratio to pass the accessibility specification -
    /// https://www.w3.org/TR/2008/REC-WCAG20-20081211/#visual-audio-contrast-contrast
    enum AccessibilityRequirement {

        /// The visual presentation of text has a contrast ratio of at least `4.5:1` (Level AA) -
        /// https://www.w3.org/WAI/WCAG21/quickref/?versions=2.0#qr-visual-audio-contrast-contrast
        case minimum
        /// The visual presentation of large text has a contrast ratio of at least `3:1` (Level AA) -
        /// https://www.w3.org/WAI/WCAG21/quickref/?versions=2.0#qr-visual-audio-contrast-contrast
        case minimumLargeText
        /// The visual presentation of text has a contrast ratio of at least `7:1` (Level AAA) -
        /// https://www.w3.org/WAI/WCAG21/quickref/?versions=2.0#qr-visual-audio-contrast7
        case enhanced
        /// The visual presentation of large text has a contrast ratio of at least `4.5:1` (Level AAA) -
        /// https://www.w3.org/WAI/WCAG21/quickref/?versions=2.0#qr-visual-audio-contrast7
        case enhancedLargeText

        /// The minimum contrast ratio required to pass the specification.
        var minimumContrastRatio: CGFloat {
            switch self {
            case .minimum, .enhancedLargeText:
                return 4.5
            case .minimumLargeText:
                return 3.0
            case .enhanced:
                return 7.0
            }
        }

    }

    /**
     Tests if two contrasting colors pass a provided accessibility requirement.

     - parameter requirement: The accessibility requirement to test.
     - parameter foreground: The foreground color to contrast against the `background` color.
     - parameter background: The background color to contrast against the `foreground` color.

     - returns: `true` if the two contrasting colors pass the accessibility requirement.
     */
    static func isCompliant(with requirement: AccessibilityRequirement, testing foreground: UIColor, against background: UIColor) -> Bool {
        let contrastRatio = UIColor.contrastRatio(between: foreground, and: background)
        return contrastRatio >= requirement.minimumContrastRatio
    }

    /**
     Tests if the current color, contrasting with another color, passes a provided
     accessibility requirement.

     - parameter requirement: The accessibility requirement to test.
     - parameter background: The background color to contrast against the current color.

     - returns: `true` if the two contrasting colors pass the accessibility requirement.
     */
    func isCompliant(with requirement: AccessibilityRequirement, against background: UIColor) -> Bool {
        return UIColor.isCompliant(with: requirement, testing: self, against: background)
    }

}
