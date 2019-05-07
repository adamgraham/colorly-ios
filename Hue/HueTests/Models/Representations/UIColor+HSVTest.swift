//
//  UIColor+HSVTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HSVTest: XCTestCase {

    typealias HSV = UIColor.HSV

    func testHSV() {
        XCTAssertEqual(UIColor.white.hsv, HSV(hue: 0.0, saturation: 0.0, value: 1.0))
        XCTAssertEqual(UIColor.red.hsv, HSV(hue: 0.0, saturation: 1.0, value: 1.0))
        XCTAssertEqual(UIColor.green.hsv, HSV(hue: 120.0, saturation: 1.0, value: 1.0))
        XCTAssertEqual(UIColor.blue.hsv, HSV(hue: 240.0, saturation: 1.0, value: 1.0))
        XCTAssertEqual(UIColor.cyan.hsv, HSV(hue: 180.0, saturation: 1.0, value: 1.0))
        XCTAssertEqual(UIColor.magenta.hsv, HSV(hue: 300.0, saturation: 1.0, value: 1.0))
        XCTAssertEqual(UIColor.yellow.hsv, HSV(hue: 60.0, saturation: 1.0, value: 1.0))
        XCTAssertEqual(UIColor.black.hsv, HSV(hue: 0.0, saturation: 0.0, value: 0.0))
        XCTAssertEqual(UIColor.darkGray.hsv, HSV(hue: 0.0, saturation: 0.0, value: 1.0/3.0))
        XCTAssertEqual(UIColor.gray.hsv, HSV(hue: 0.0, saturation: 0.0, value: 0.5))
        XCTAssertEqual(UIColor.lightGray.hsv, HSV(hue: 0.0, saturation: 0.0, value: 2.0/3.0))
        XCTAssertEqual(UIColor.clear.hsv, HSV(hue: 0.0, saturation: 0.0, value: 0.0))
    }

    func testHSVInit() {
        XCTAssertEqual(UIColor(hsv: HSV(hue: 0.0, saturation: 0.0, value: 1.0)), .white)
        XCTAssertEqual(UIColor(hsv: HSV(hue: 0.0, saturation: 1.0, value: 1.0)), .red)
        XCTAssertEqual(UIColor(hsv: HSV(hue: 120.0, saturation: 1.0, value: 1.0)), .green)
        XCTAssertEqual(UIColor(hsv: HSV(hue: 240.0, saturation: 1.0, value: 1.0)), .blue)
        XCTAssertEqual(UIColor(hsv: HSV(hue: 180.0, saturation: 1.0, value: 1.0)), .cyan)
        XCTAssertEqual(UIColor(hsv: HSV(hue: 300.0, saturation: 1.0, value: 1.0)), .magenta)
        XCTAssertEqual(UIColor(hsv: HSV(hue: 60.0, saturation: 1.0, value: 1.0)), .yellow)
        XCTAssertEqual(UIColor(hsv: HSV(hue: 0.0, saturation: 0.0, value: 0.0)), .black)
        XCTAssertEqual(UIColor(hsv: HSV(hue: 0.0, saturation: 0.0, value: 1.0/3.0)), .darkGray)
        XCTAssertEqual(UIColor(hsv: HSV(hue: 0.0, saturation: 0.0, value: 0.5)), .gray)
        XCTAssertEqual(UIColor(hsv: HSV(hue: 0.0, saturation: 0.0, value: 2.0/3.0)), .lightGray)
        XCTAssertEqual(UIColor(hsv: HSV(hue: 0.0, saturation: 0.0, value: 0.0), alpha: 0.0), .clear)
    }

}
