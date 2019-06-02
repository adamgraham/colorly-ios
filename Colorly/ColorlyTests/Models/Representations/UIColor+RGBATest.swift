//
//  UIColor+RGBATest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_RGBATest: XCTestCase {

    typealias RGBA = UIColor.RGBA

    func testRGBA() {
        XCTAssertEqual(UIColor.white.rgba, RGBA(red: 255, green: 255, blue: 255, alpha: 255))
        XCTAssertEqual(UIColor.red.rgba, RGBA(red: 255, green: 0, blue: 0, alpha: 255))
        XCTAssertEqual(UIColor.green.rgba, RGBA(red: 0, green: 255, blue: 0, alpha: 255))
        XCTAssertEqual(UIColor.blue.rgba, RGBA(red: 0, green: 0, blue: 255, alpha: 255))
        XCTAssertEqual(UIColor.cyan.rgba, RGBA(red: 0, green: 255, blue: 255, alpha: 255))
        XCTAssertEqual(UIColor.magenta.rgba, RGBA(red: 255, green: 0, blue: 255, alpha: 255))
        XCTAssertEqual(UIColor.yellow.rgba, RGBA(red: 255, green: 255, blue: 0, alpha: 255))
        XCTAssertEqual(UIColor.black.rgba, RGBA(red: 0, green: 0, blue: 0, alpha: 255))
        XCTAssertEqual(UIColor.darkGray.rgba, RGBA(red: 85, green: 85, blue: 85, alpha: 255))
        XCTAssertEqual(UIColor.gray.rgba, RGBA(red: 128, green: 128, blue: 128, alpha: 255))
        XCTAssertEqual(UIColor.lightGray.rgba, RGBA(red: 170, green: 170, blue: 170, alpha: 255))
        XCTAssertEqual(UIColor.clear.rgba, RGBA(red: 0, green: 0, blue: 0, alpha: 0))
    }

    func testRGBAInit() {
        XCTAssertEqual(UIColor(RGBA(red: 255, green: 255, blue: 255, alpha: 255)), .white)
        XCTAssertEqual(UIColor(RGBA(red: 255, green: 0, blue: 0, alpha: 255)), .red)
        XCTAssertEqual(UIColor(RGBA(red: 0, green: 255, blue: 0, alpha: 255)), .green)
        XCTAssertEqual(UIColor(RGBA(red: 0, green: 0, blue: 255, alpha: 255)), .blue)
        XCTAssertEqual(UIColor(RGBA(red: 0, green: 255, blue: 255, alpha: 255)), .cyan)
        XCTAssertEqual(UIColor(RGBA(red: 255, green: 0, blue: 255, alpha: 255)), .magenta)
        XCTAssertEqual(UIColor(RGBA(red: 255, green: 255, blue: 0, alpha: 255)), .yellow)
        XCTAssertEqual(UIColor(RGBA(red: 0, green: 0, blue: 0, alpha: 255)), .black)
        XCTAssertEqual(UIColor(RGBA(red: 85, green: 85, blue: 85, alpha: 255)), .darkGray)
        XCTAssertEqual(UIColor(RGBA(red: 128, green: 128, blue: 128, alpha: 255)), .gray, accuracy: 0.0019607843137255)
        XCTAssertEqual(UIColor(RGBA(red: 170, green: 170, blue: 170, alpha: 255)), .lightGray)
        XCTAssertEqual(UIColor(RGBA(red: 0, green: 0, blue: 0, alpha: 0)), .clear)
    }

}
