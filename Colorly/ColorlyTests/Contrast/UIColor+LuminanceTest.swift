//
//  UIColor+LuminanceTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_LuminanceTest: XCTestCase {

    private let accuracy: CGFloat = 0.0001

    func testRelativeLuminance() {
        XCTAssertEqual(UIColor.red.relativeLuminance, 0.2126, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.green.relativeLuminance, 0.7152, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.blue.relativeLuminance, 0.0722, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.cyan.relativeLuminance, 0.7874, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.magenta.relativeLuminance, 0.2848, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.yellow.relativeLuminance, 0.9278, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.black.relativeLuminance, 0.0, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.white.relativeLuminance, 1.0, accuracy: self.accuracy)
    }

    func testPerceivedBrightness() {
        XCTAssertEqual(UIColor.red.perceivedBrightness, 0.5468, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.green.perceivedBrightness, 0.7662, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.blue.perceivedBrightness, 0.3376, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.cyan.perceivedBrightness, 0.8373, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.magenta.perceivedBrightness, 0.6427, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.yellow.perceivedBrightness, 0.9413, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.black.perceivedBrightness, 0.0, accuracy: self.accuracy)
        XCTAssertEqual(UIColor.white.perceivedBrightness, 1.0, accuracy: self.accuracy)
    }

    func testIsLight() {
        XCTAssertTrue(UIColor.red.isLight)
        XCTAssertTrue(UIColor.green.isLight)
        XCTAssertFalse(UIColor.blue.isLight)
        XCTAssertTrue(UIColor.cyan.isLight)
        XCTAssertTrue(UIColor.magenta.isLight)
        XCTAssertTrue(UIColor.yellow.isLight)
        XCTAssertFalse(UIColor.black.isLight)
        XCTAssertTrue(UIColor.white.isLight)
    }

    func testIsDark() {
        XCTAssertFalse(UIColor.red.isDark)
        XCTAssertFalse(UIColor.green.isDark)
        XCTAssertTrue(UIColor.blue.isDark)
        XCTAssertFalse(UIColor.cyan.isDark)
        XCTAssertFalse(UIColor.magenta.isDark)
        XCTAssertFalse(UIColor.yellow.isDark)
        XCTAssertTrue(UIColor.black.isDark)
        XCTAssertFalse(UIColor.white.isDark)
    }

}
