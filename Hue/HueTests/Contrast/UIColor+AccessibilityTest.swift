//
//  UIColor+AccessibilityTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_AccessibilityTest: XCTestCase {

    func testMinimumContrastRatio() {
        XCTAssertEqual(UIColor.AccessibilityRequirement.minimum.minimumContrastRatio, 4.5)
        XCTAssertEqual(UIColor.AccessibilityRequirement.minimumLargeText.minimumContrastRatio, 3.0)
        XCTAssertEqual(UIColor.AccessibilityRequirement.enhanced.minimumContrastRatio, 7.0)
        XCTAssertEqual(UIColor.AccessibilityRequirement.enhancedLargeText.minimumContrastRatio, 4.5)
    }

    func testIsCompliantMinimum() {
        XCTAssertFalse(UIColor.red.isCompliant(with: .minimum, against: .white))
        XCTAssertFalse(UIColor.green.isCompliant(with: .minimum, against: .white))
        XCTAssertTrue(UIColor.blue.isCompliant(with: .minimum, against: .white))
        XCTAssertFalse(UIColor.cyan.isCompliant(with: .minimum, against: .white))
        XCTAssertFalse(UIColor.magenta.isCompliant(with: .minimum, against: .white))
        XCTAssertFalse(UIColor.yellow.isCompliant(with: .minimum, against: .white))
        XCTAssertTrue(UIColor.black.isCompliant(with: .minimum, against: .white))
        XCTAssertFalse(UIColor.white.isCompliant(with: .minimum, against: .white))

        XCTAssertTrue(UIColor.red.isCompliant(with: .minimum, against: .black))
        XCTAssertTrue(UIColor.green.isCompliant(with: .minimum, against: .black))
        XCTAssertFalse(UIColor.blue.isCompliant(with: .minimum, against: .black))
        XCTAssertTrue(UIColor.cyan.isCompliant(with: .minimum, against: .black))
        XCTAssertTrue(UIColor.magenta.isCompliant(with: .minimum, against: .black))
        XCTAssertTrue(UIColor.yellow.isCompliant(with: .minimum, against: .black))
        XCTAssertFalse(UIColor.black.isCompliant(with: .minimum, against: .black))
        XCTAssertTrue(UIColor.white.isCompliant(with: .minimum, against: .black))
    }

    func testIsCompliantMinimumLargeText() {
        XCTAssertTrue(UIColor.red.isCompliant(with: .minimumLargeText, against: .white))
        XCTAssertFalse(UIColor.green.isCompliant(with: .minimumLargeText, against: .white))
        XCTAssertTrue(UIColor.blue.isCompliant(with: .minimumLargeText, against: .white))
        XCTAssertFalse(UIColor.cyan.isCompliant(with: .minimumLargeText, against: .white))
        XCTAssertTrue(UIColor.magenta.isCompliant(with: .minimumLargeText, against: .white))
        XCTAssertFalse(UIColor.yellow.isCompliant(with: .minimumLargeText, against: .white))
        XCTAssertTrue(UIColor.black.isCompliant(with: .minimumLargeText, against: .white))
        XCTAssertFalse(UIColor.white.isCompliant(with: .minimumLargeText, against: .white))

        XCTAssertTrue(UIColor.red.isCompliant(with: .minimumLargeText, against: .black))
        XCTAssertTrue(UIColor.green.isCompliant(with: .minimumLargeText, against: .black))
        XCTAssertFalse(UIColor.blue.isCompliant(with: .minimumLargeText, against: .black))
        XCTAssertTrue(UIColor.cyan.isCompliant(with: .minimumLargeText, against: .black))
        XCTAssertTrue(UIColor.magenta.isCompliant(with: .minimumLargeText, against: .black))
        XCTAssertTrue(UIColor.yellow.isCompliant(with: .minimumLargeText, against: .black))
        XCTAssertFalse(UIColor.black.isCompliant(with: .minimumLargeText, against: .black))
        XCTAssertTrue(UIColor.white.isCompliant(with: .minimumLargeText, against: .black))
    }

    func testIsCompliantEnhanced() {
        XCTAssertFalse(UIColor.red.isCompliant(with: .enhanced, against: .white))
        XCTAssertFalse(UIColor.green.isCompliant(with: .enhanced, against: .white))
        XCTAssertTrue(UIColor.blue.isCompliant(with: .enhanced, against: .white))
        XCTAssertFalse(UIColor.cyan.isCompliant(with: .enhanced, against: .white))
        XCTAssertFalse(UIColor.magenta.isCompliant(with: .enhanced, against: .white))
        XCTAssertFalse(UIColor.yellow.isCompliant(with: .enhanced, against: .white))
        XCTAssertTrue(UIColor.black.isCompliant(with: .enhanced, against: .white))
        XCTAssertFalse(UIColor.white.isCompliant(with: .enhanced, against: .white))

        XCTAssertFalse(UIColor.red.isCompliant(with: .enhanced, against: .black))
        XCTAssertTrue(UIColor.green.isCompliant(with: .enhanced, against: .black))
        XCTAssertFalse(UIColor.blue.isCompliant(with: .enhanced, against: .black))
        XCTAssertTrue(UIColor.cyan.isCompliant(with: .enhanced, against: .black))
        XCTAssertFalse(UIColor.magenta.isCompliant(with: .enhanced, against: .black))
        XCTAssertTrue(UIColor.yellow.isCompliant(with: .enhanced, against: .black))
        XCTAssertFalse(UIColor.black.isCompliant(with: .enhanced, against: .black))
        XCTAssertTrue(UIColor.white.isCompliant(with: .enhanced, against: .black))
    }

    func testIsCompliantEnhancedLargeText() {
        XCTAssertFalse(UIColor.red.isCompliant(with: .enhancedLargeText, against: .white))
        XCTAssertFalse(UIColor.green.isCompliant(with: .enhancedLargeText, against: .white))
        XCTAssertTrue(UIColor.blue.isCompliant(with: .enhancedLargeText, against: .white))
        XCTAssertFalse(UIColor.cyan.isCompliant(with: .enhancedLargeText, against: .white))
        XCTAssertFalse(UIColor.magenta.isCompliant(with: .enhancedLargeText, against: .white))
        XCTAssertFalse(UIColor.yellow.isCompliant(with: .enhancedLargeText, against: .white))
        XCTAssertTrue(UIColor.black.isCompliant(with: .enhancedLargeText, against: .white))
        XCTAssertFalse(UIColor.white.isCompliant(with: .enhancedLargeText, against: .white))

        XCTAssertTrue(UIColor.red.isCompliant(with: .enhancedLargeText, against: .black))
        XCTAssertTrue(UIColor.green.isCompliant(with: .enhancedLargeText, against: .black))
        XCTAssertFalse(UIColor.blue.isCompliant(with: .enhancedLargeText, against: .black))
        XCTAssertTrue(UIColor.cyan.isCompliant(with: .enhancedLargeText, against: .black))
        XCTAssertTrue(UIColor.magenta.isCompliant(with: .enhancedLargeText, against: .black))
        XCTAssertTrue(UIColor.yellow.isCompliant(with: .enhancedLargeText, against: .black))
        XCTAssertFalse(UIColor.black.isCompliant(with: .enhancedLargeText, against: .black))
        XCTAssertTrue(UIColor.white.isCompliant(with: .enhancedLargeText, against: .black))
    }

}
