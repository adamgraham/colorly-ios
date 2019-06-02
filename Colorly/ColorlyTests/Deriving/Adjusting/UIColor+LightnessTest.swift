//
//  UIColor+LightnessTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_LightnessTest: XCTestCase {

    func testLighter() {
        XCTAssertEqual(UIColor.black.lighter(percent: -1.0), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 0.0), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 0.1), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.1, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 0.2), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.2, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 0.3), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.3, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 0.4), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.4, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 0.5), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.5, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 0.6), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.6, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 0.7), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.7, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 0.8), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.8, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 0.9), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.9, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 1.0), UIColor(hue: 0.0, saturation: 0.0, brightness: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.black.lighter(percent: 2.0), UIColor(hue: 0.0, saturation: 0.0, brightness: 1.0, alpha: 1.0))
    }

    func testDarker() {
        XCTAssertEqual(UIColor.white.darker(percent: -1.0), UIColor(hue: 0.0, saturation: 0.0, brightness: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 0.0), UIColor(hue: 0.0, saturation: 0.0, brightness: 1.0, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 0.1), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.9, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 0.2), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.8, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 0.3), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.7, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 0.4), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.6, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 0.5), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.5, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 0.6), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.4, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 0.7), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.3, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 0.8), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.2, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 0.9), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.1, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 1.0), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.0, alpha: 1.0))
        XCTAssertEqual(UIColor.white.darker(percent: 2.0), UIColor(hue: 0.0, saturation: 0.0, brightness: 0.0, alpha: 1.0))
    }

}
