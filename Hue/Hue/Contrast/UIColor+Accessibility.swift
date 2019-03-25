//
//  UIColor+Accessibility.swift
//  Hue
//
//  Created by Adam Graham on 3/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// https://www.w3.org/TR/WCAG20
public extension UIColor {

    public enum AccessibilityLevel: CaseIterable {

        case A
        case AA
        case AAA

        func passes(test: AccessibilityTest, foreground: UIColor, background: UIColor) -> Bool {
            return UIColor.isADACompliant(testing: foreground, against: background, level: self, test: test)
        }

    }

    public enum AccessibilityTest: CaseIterable {

        case normalText
        case largeText
        case graphical

        func passes(level: AccessibilityLevel, foreground: UIColor, background: UIColor) -> Bool {
            return UIColor.isADACompliant(testing: foreground, against: background, level: level, test: self)
        }

    }

    static func isADACompliant(testing foreground: UIColor, against background: UIColor, level: AccessibilityLevel, test: AccessibilityTest) -> Bool {
        let requirements = [
            AccessibilityLevel.AAA: [
                AccessibilityTest.normalText: CGFloat(7.0),
                AccessibilityTest.largeText: CGFloat(4.5),
                AccessibilityTest.graphical: CGFloat(4.5),
            ],
            AccessibilityLevel.AA: [
                AccessibilityTest.normalText: CGFloat(4.5),
                AccessibilityTest.largeText: CGFloat(3.0),
                AccessibilityTest.graphical: CGFloat(3.0),
            ],
            AccessibilityLevel.A: [
                AccessibilityTest.normalText: CGFloat(1.0),
                AccessibilityTest.largeText: CGFloat(1.0),
                AccessibilityTest.graphical: CGFloat(1.0),
            ]
        ]

        let contrastRatio = UIColor.contrastRatio(between: foreground, and: background)
        return contrastRatio >= requirements[level]![test]!
    }

    func isADACompliant(against background: UIColor, level: AccessibilityLevel, test: AccessibilityTest) -> Bool {
        return UIColor.isADACompliant(testing: self, against: background, level: level, test: test)
    }

    typealias AccessibilitySummary = [AccessibilityLevel: [AccessibilityTest: Bool]]
    static func accessibilitySummary(testing foreground: UIColor, against background: UIColor) -> AccessibilitySummary {
        return AccessibilityLevel.allCases.reduce(AccessibilitySummary()) {
            (summary, level) -> AccessibilitySummary in

            var summary = summary
            summary[level] = AccessibilityTest.allCases.reduce([AccessibilityTest: Bool]()) {
                (tests, test) -> [AccessibilityTest: Bool] in

                var tests = tests
                tests[test] = UIColor.isADACompliant(testing: foreground, against: background, level: level, test: test)
                return tests
            }

            return summary
        }
    }

}
