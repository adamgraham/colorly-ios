//
//  UIColor+RGBTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_RGBTest: XCTestCase {

    typealias RGB = UIColor.RGB

    func testRGB() {
        XCTAssertEqual(UIColor.white.rgb, RGB(red: 255.0, green: 255.0, blue: 255.0))
        XCTAssertEqual(UIColor.red.rgb, RGB(red: 255.0, green: 0.0, blue: 0.0))
        XCTAssertEqual(UIColor.green.rgb, RGB(red: 0.0, green: 255.0, blue: 0.0))
        XCTAssertEqual(UIColor.blue.rgb, RGB(red: 0.0, green: 0.0, blue: 255.0))
        XCTAssertEqual(UIColor.cyan.rgb, RGB(red: 0.0, green: 255.0, blue: 255.0))
        XCTAssertEqual(UIColor.magenta.rgb, RGB(red: 255.0, green: 0.0, blue: 255.0))
        XCTAssertEqual(UIColor.yellow.rgb, RGB(red: 255.0, green: 255.0, blue: 0.0))
        XCTAssertEqual(UIColor.black.rgb, RGB(red: 0.0, green: 0.0, blue: 0.0))
        XCTAssertEqual(UIColor.darkGray.rgb, RGB(red: 85.0, green: 85.0, blue: 85.0))
        XCTAssertEqual(UIColor.gray.rgb, RGB(red: 127.5, green: 127.5, blue: 127.5))
        XCTAssertEqual(UIColor.lightGray.rgb, RGB(red: 170.0, green: 170.0, blue: 170.0))
        XCTAssertEqual(UIColor.clear.rgb, RGB(red: 0.0, green: 0.0, blue: 0.0))
    }

    func testRGBInit() {
        XCTAssertEqual(UIColor(rgb: RGB(red: 255.0, green: 255.0, blue: 255.0)), .white)
        XCTAssertEqual(UIColor(rgb: RGB(red: 255.0, green: 0.0, blue: 0.0)), .red)
        XCTAssertEqual(UIColor(rgb: RGB(red: 0.0, green: 255.0, blue: 0.0)), .green)
        XCTAssertEqual(UIColor(rgb: RGB(red: 0.0, green: 0.0, blue: 255.0)), .blue)
        XCTAssertEqual(UIColor(rgb: RGB(red: 0.0, green: 255.0, blue: 255.0)), .cyan)
        XCTAssertEqual(UIColor(rgb: RGB(red: 255.0, green: 0.0, blue: 255.0)), .magenta)
        XCTAssertEqual(UIColor(rgb: RGB(red: 255.0, green: 255.0, blue: 0.0)), .yellow)
        XCTAssertEqual(UIColor(rgb: RGB(red: 0.0, green: 0.0, blue: 0.0)), .black)
        XCTAssertEqual(UIColor(rgb: RGB(red: 85.0, green: 85.0, blue: 85.0)), .darkGray)
        XCTAssertEqual(UIColor(rgb: RGB(red: 127.5, green: 127.5, blue: 127.5)), .gray)
        XCTAssertEqual(UIColor(rgb: RGB(red: 170.0, green: 170.0, blue: 170.0)), .lightGray)
        XCTAssertEqual(UIColor(rgb: RGB(red: 0.0, green: 0.0, blue: 0.0), alpha: 0.0), .clear)
    }

}
