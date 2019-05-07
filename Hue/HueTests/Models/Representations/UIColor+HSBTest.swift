//
//  UIColor+HSBTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HSBTest: XCTestCase {

    typealias HSB = UIColor.HSB

    func testHSB() {
        XCTAssertEqual(UIColor.white.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 1.0))
        XCTAssertEqual(UIColor.red.hsb, HSB(hue: 0.0, saturation: 1.0, brightness: 1.0))
        XCTAssertEqual(UIColor.green.hsb, HSB(hue: 120.0, saturation: 1.0, brightness: 1.0))
        XCTAssertEqual(UIColor.blue.hsb, HSB(hue: 240.0, saturation: 1.0, brightness: 1.0))
        XCTAssertEqual(UIColor.cyan.hsb, HSB(hue: 180.0, saturation: 1.0, brightness: 1.0))
        XCTAssertEqual(UIColor.magenta.hsb, HSB(hue: 300.0, saturation: 1.0, brightness: 1.0))
        XCTAssertEqual(UIColor.yellow.hsb, HSB(hue: 60.0, saturation: 1.0, brightness: 1.0))
        XCTAssertEqual(UIColor.black.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 0.0))
        XCTAssertEqual(UIColor.darkGray.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 1.0/3.0))
        XCTAssertEqual(UIColor.gray.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 0.5))
        XCTAssertEqual(UIColor.lightGray.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 2.0/3.0))
        XCTAssertEqual(UIColor.clear.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 0.0))
    }

    func testHSBInit() {
        XCTAssertEqual(UIColor(hsb: HSB(hue: 0.0, saturation: 0.0, brightness: 1.0)), .white)
        XCTAssertEqual(UIColor(hsb: HSB(hue: 0.0, saturation: 1.0, brightness: 1.0)), .red)
        XCTAssertEqual(UIColor(hsb: HSB(hue: 120.0, saturation: 1.0, brightness: 1.0)), .green)
        XCTAssertEqual(UIColor(hsb: HSB(hue: 240.0, saturation: 1.0, brightness: 1.0)), .blue)
        XCTAssertEqual(UIColor(hsb: HSB(hue: 180.0, saturation: 1.0, brightness: 1.0)), .cyan)
        XCTAssertEqual(UIColor(hsb: HSB(hue: 300.0, saturation: 1.0, brightness: 1.0)), .magenta)
        XCTAssertEqual(UIColor(hsb: HSB(hue: 60.0, saturation: 1.0, brightness: 1.0)), .yellow)
        XCTAssertEqual(UIColor(hsb: HSB(hue: 0.0, saturation: 0.0, brightness: 0.0)), .black)
        XCTAssertEqual(UIColor(hsb: HSB(hue: 0.0, saturation: 0.0, brightness: 1.0/3.0)), .darkGray)
        XCTAssertEqual(UIColor(hsb: HSB(hue: 0.0, saturation: 0.0, brightness: 0.5)), .gray)
        XCTAssertEqual(UIColor(hsb: HSB(hue: 0.0, saturation: 0.0, brightness: 2.0/3.0)), .lightGray)
        XCTAssertEqual(UIColor(hsb: HSB(hue: 0.0, saturation: 0.0, brightness: 0.0), alpha: 0.0), .clear)
    }

}
