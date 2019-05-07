//
//  UIColor+LuminanceTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_LuminanceTest: XCTestCase {

    func testLuminance() {
        let accuracy = CGFloat.ulpOfOne
        XCTAssertEqual(UIColor.red.luminance, 0.2126, accuracy: accuracy)
        XCTAssertEqual(UIColor.green.luminance, 0.7152, accuracy: accuracy)
        XCTAssertEqual(UIColor.blue.luminance, 0.0722, accuracy: accuracy)
        XCTAssertEqual(UIColor.cyan.luminance, 0.7874, accuracy: accuracy)
        XCTAssertEqual(UIColor.magenta.luminance, 0.2848, accuracy: accuracy)
        XCTAssertEqual(UIColor.yellow.luminance, 0.9278, accuracy: accuracy)
        XCTAssertEqual(UIColor.black.luminance, 0.0, accuracy: accuracy)
        XCTAssertEqual(UIColor.white.luminance, 1.0, accuracy: accuracy)
    }

    func testPerceivedBrightness() {
        let accuracy = CGFloat.ulpOfOne
        XCTAssertEqual(UIColor.red.perceivedBrightness, 0.5468089245796927, accuracy: accuracy)
        XCTAssertEqual(UIColor.green.perceivedBrightness, 0.7661592523751182, accuracy: accuracy)
        XCTAssertEqual(UIColor.blue.perceivedBrightness, 0.33763886032268264, accuracy: accuracy)
        XCTAssertEqual(UIColor.cyan.perceivedBrightness, 0.8372574275573791, accuracy: accuracy)
        XCTAssertEqual(UIColor.magenta.perceivedBrightness, 0.6426507605223851, accuracy: accuracy)
        XCTAssertEqual(UIColor.yellow.perceivedBrightness, 0.9412757300600074, accuracy: accuracy)
        XCTAssertEqual(UIColor.black.perceivedBrightness, 0.0, accuracy: accuracy)
        XCTAssertEqual(UIColor.white.perceivedBrightness, 1.0, accuracy: accuracy)
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
