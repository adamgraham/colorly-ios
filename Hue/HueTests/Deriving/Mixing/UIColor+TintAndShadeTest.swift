//
//  UIColor+TintAndShadeTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_TintAndShadeTest: XCTestCase {

    func testShade() {
        XCTAssertEqual(UIColor.red.shade(percent: -1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 0.1), UIColor(red: 0.9, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 0.2), UIColor(red: 0.8, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 0.3), UIColor(red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 0.4), UIColor(red: 0.6, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 0.5), UIColor(red: 0.5, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 0.6), UIColor(red: 0.4, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 0.7), UIColor(red: 0.3, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 0.8), UIColor(red: 0.2, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 0.9), UIColor(red: 0.1, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.shade(percent: 2.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
    }

    func testTint() {
        XCTAssertEqual(UIColor.red.tint(percent: -1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 0.1), UIColor(red: 1.0, green: 0.1, blue: 0.1, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 0.2), UIColor(red: 1.0, green: 0.2, blue: 0.2, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 0.3), UIColor(red: 1.0, green: 0.3, blue: 0.3, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 0.4), UIColor(red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 0.5), UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 0.6), UIColor(red: 1.0, green: 0.6, blue: 0.6, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 0.7), UIColor(red: 1.0, green: 0.7, blue: 0.7, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 0.8), UIColor(red: 1.0, green: 0.8, blue: 0.8, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 0.9), UIColor(red: 1.0, green: 0.9, blue: 0.9, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tint(percent: 2.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }

    func testTone() {
        XCTAssertEqual(UIColor.red.tone(percent: -1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 0.1), UIColor(red: 0.95, green: 0.05, blue: 0.05, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 0.2), UIColor(red: 0.9, green: 0.1, blue: 0.1, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 0.3), UIColor(red: 0.85, green: 0.15, blue: 0.15, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 0.4), UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 0.5), UIColor(red: 0.75, green: 0.25, blue: 0.25, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 0.6), UIColor(red: 0.7, green: 0.3, blue: 0.3, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 0.7), UIColor(red: 0.65, green: 0.35, blue: 0.35, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 0.8), UIColor(red: 0.6, green: 0.4, blue: 0.4, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 0.9), UIColor(red: 0.55, green: 0.45, blue: 0.45, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 1.0), UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0))
        XCTAssertEqual(UIColor.red.tone(percent: 2.0), UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0))
    }

}
