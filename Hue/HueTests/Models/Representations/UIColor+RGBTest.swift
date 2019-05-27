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
        XCTAssertEqual(UIColor.white.rgb, RGB(red: 255, green: 255, blue: 255))
        XCTAssertEqual(UIColor.red.rgb, RGB(red: 255, green: 0, blue: 0))
        XCTAssertEqual(UIColor.green.rgb, RGB(red: 0, green: 255, blue: 0))
        XCTAssertEqual(UIColor.blue.rgb, RGB(red: 0, green: 0, blue: 255))
        XCTAssertEqual(UIColor.cyan.rgb, RGB(red: 0, green: 255, blue: 255))
        XCTAssertEqual(UIColor.magenta.rgb, RGB(red: 255, green: 0, blue: 255))
        XCTAssertEqual(UIColor.yellow.rgb, RGB(red: 255, green: 255, blue: 0))
        XCTAssertEqual(UIColor.black.rgb, RGB(red: 0, green: 0, blue: 0))
        XCTAssertEqual(UIColor.darkGray.rgb, RGB(red: 85, green: 85, blue: 85))
        XCTAssertEqual(UIColor.gray.rgb, RGB(red: 128, green: 128, blue: 128))
        XCTAssertEqual(UIColor.lightGray.rgb, RGB(red: 170, green: 170, blue: 170))
        XCTAssertEqual(UIColor.clear.rgb, RGB(red: 0, green: 0, blue: 0))
    }

    func testRGBInit() {
        XCTAssertEqual(UIColor(RGB(red: 255, green: 255, blue: 255)), .white)
        XCTAssertEqual(UIColor(RGB(red: 255, green: 0, blue: 0)), .red)
        XCTAssertEqual(UIColor(RGB(red: 0, green: 255, blue: 0)), .green)
        XCTAssertEqual(UIColor(RGB(red: 0, green: 0, blue: 255)), .blue)
        XCTAssertEqual(UIColor(RGB(red: 0, green: 255, blue: 255)), .cyan)
        XCTAssertEqual(UIColor(RGB(red: 255, green: 0, blue: 255)), .magenta)
        XCTAssertEqual(UIColor(RGB(red: 255, green: 255, blue: 0)), .yellow)
        XCTAssertEqual(UIColor(RGB(red: 0, green: 0, blue: 0)), .black)
        XCTAssertEqual(UIColor(RGB(red: 85, green: 85, blue: 85)), .darkGray)
        XCTAssertEqual(UIColor(RGB(red: 128, green: 128, blue: 128)), .gray, accuracy: 0.0019607843137255)
        XCTAssertEqual(UIColor(RGB(red: 170, green: 170, blue: 170)), .lightGray)
        XCTAssertEqual(UIColor(RGB(red: 0, green: 0, blue: 0), alpha: 0), .clear)
    }

}
