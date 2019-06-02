//
//  UIColor+ColorWheelTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 4/26/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_ColorWheelTest: XCTestCase {

    func testRGB() {
        XCTAssertNotNil(UIColor.ColorWheel()) // needed for code coverage
        XCTAssertNotNil(UIColor.ColorWheel.RGB()) // needed for code coverage
        XCTAssertEqual(UIColor.ColorWheel.RGB.azure, UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.black, UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.blue, UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.chartreuse, UIColor(red: 0.5, green: 1.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.cyan, UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.green, UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.magenta, UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.orange, UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.red, UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.rose, UIColor(red: 1.0, green: 0.0, blue: 0.5, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.springGreen, UIColor(red: 0.0, green: 1.0, blue: 0.5, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.violet, UIColor(red: 0.5, green: 0.0, blue: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.white, UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RGB.yellow, UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0))
    }

    func testRYB() {
        XCTAssertNotNil(UIColor.ColorWheel()) // needed for code coverage
        XCTAssertNotNil(UIColor.ColorWheel.RYB()) // needed for code coverage
        XCTAssertEqual(UIColor.ColorWheel.RYB.amber, UIColor(red: 1.0, green: 0.75, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.black, UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.blue, UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.chartreuse, UIColor(red: 0.5, green: 1.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.green, UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.magenta, UIColor(red: 1.0, green: 0.0, blue: 0.5, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.orange, UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.purple, UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.red, UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.teal, UIColor(red: 0.0, green: 0.5, blue: 0.5, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.vermilion, UIColor(red: 1.0, green: 0.25, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.violet, UIColor(red: 0.5, green: 0.0, blue: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.white, UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.ColorWheel.RYB.yellow, UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0))
    }

}
