//
//  UIColor+HSLTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HSLTest: XCTestCase {

    typealias HSL = UIColor.HSL

    func testHSL() {
        XCTAssertEqual(UIColor.white.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 1.0))
        XCTAssertEqual(UIColor.red.hsl, HSL(hue: 0.0, saturation: 1.0, lightness: 0.5))
        XCTAssertEqual(UIColor.green.hsl, HSL(hue: 120.0, saturation: 1.0, lightness: 0.5))
        XCTAssertEqual(UIColor.blue.hsl, HSL(hue: 240.0, saturation: 1.0, lightness: 0.5))
        XCTAssertEqual(UIColor.cyan.hsl, HSL(hue: 180.0, saturation: 1.0, lightness: 0.5))
        XCTAssertEqual(UIColor.magenta.hsl, HSL(hue: 300.0, saturation: 1.0, lightness: 0.5))
        XCTAssertEqual(UIColor.yellow.hsl, HSL(hue: 60.0, saturation: 1.0, lightness: 0.5))
        XCTAssertEqual(UIColor.black.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 0.0))
        XCTAssertEqual(UIColor.darkGray.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 1.0/3.0))
        XCTAssertEqual(UIColor.gray.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 0.5))
        XCTAssertEqual(UIColor.lightGray.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 2.0/3.0))
        XCTAssertEqual(UIColor.clear.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 0.0))
    }

    func testHSLInit() {
        XCTAssertEqual(UIColor(hsl: HSL(hue: 0.0, saturation: 0.0, lightness: 1.0)), .white)
        XCTAssertEqual(UIColor(hsl: HSL(hue: 0.0, saturation: 1.0, lightness: 0.5)), .red)
        XCTAssertEqual(UIColor(hsl: HSL(hue: 120.0, saturation: 1.0, lightness: 0.5)), .green)
        XCTAssertEqual(UIColor(hsl: HSL(hue: 240.0, saturation: 1.0, lightness: 0.5)), .blue)
        XCTAssertEqual(UIColor(hsl: HSL(hue: 180.0, saturation: 1.0, lightness: 0.5)), .cyan)
        XCTAssertEqual(UIColor(hsl: HSL(hue: 300.0, saturation: 1.0, lightness: 0.5)), .magenta)
        XCTAssertEqual(UIColor(hsl: HSL(hue: 60.0, saturation: 1.0, lightness: 0.5)), .yellow)
        XCTAssertEqual(UIColor(hsl: HSL(hue: 0.0, saturation: 0.0, lightness: 0.0)), .black)
        XCTAssertEqual(UIColor(hsl: HSL(hue: 0.0, saturation: 0.0, lightness: 1.0/3.0)), .darkGray)
        XCTAssertEqual(UIColor(hsl: HSL(hue: 0.0, saturation: 0.0, lightness: 0.5)), .gray)
        XCTAssertEqual(UIColor(hsl: HSL(hue: 0.0, saturation: 0.0, lightness: 2.0/3.0)), .lightGray)
        XCTAssertEqual(UIColor(hsl: HSL(hue: 0.0, saturation: 0.0, lightness: 0.0), alpha: 0.0), .clear)
    }

}
