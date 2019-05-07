//
//  UIColor+RGBATest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_RGBATest: XCTestCase {

    typealias RGBA = UIColor.RGBA

    func testRGBA() {
        XCTAssertEqual(UIColor.white.rgba, RGBA(red: 255.0, green: 255.0, blue: 255.0, alpha: 255.0))
        XCTAssertEqual(UIColor.red.rgba, RGBA(red: 255.0, green: 0.0, blue: 0.0, alpha: 255.0))
        XCTAssertEqual(UIColor.green.rgba, RGBA(red: 0.0, green: 255.0, blue: 0.0, alpha: 255.0))
        XCTAssertEqual(UIColor.blue.rgba, RGBA(red: 0.0, green: 0.0, blue: 255.0, alpha: 255.0))
        XCTAssertEqual(UIColor.cyan.rgba, RGBA(red: 0.0, green: 255.0, blue: 255.0, alpha: 255.0))
        XCTAssertEqual(UIColor.magenta.rgba, RGBA(red: 255.0, green: 0.0, blue: 255.0, alpha: 255.0))
        XCTAssertEqual(UIColor.yellow.rgba, RGBA(red: 255.0, green: 255.0, blue: 0.0, alpha: 255.0))
        XCTAssertEqual(UIColor.black.rgba, RGBA(red: 0.0, green: 0.0, blue: 0.0, alpha: 255.0))
        XCTAssertEqual(UIColor.darkGray.rgba, RGBA(red: 85.0, green: 85.0, blue: 85.0, alpha: 255.0))
        XCTAssertEqual(UIColor.gray.rgba, RGBA(red: 127.5, green: 127.5, blue: 127.5, alpha: 255.0))
        XCTAssertEqual(UIColor.lightGray.rgba, RGBA(red: 170.0, green: 170.0, blue: 170.0, alpha: 255.0))
        XCTAssertEqual(UIColor.clear.rgba, RGBA(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0))
    }

    func testRGBAInit() {
        XCTAssertEqual(UIColor(rgba: RGBA(red: 255.0, green: 255.0, blue: 255.0, alpha: 255.0)), .white)
        XCTAssertEqual(UIColor(rgba: RGBA(red: 255.0, green: 0.0, blue: 0.0, alpha: 255.0)), .red)
        XCTAssertEqual(UIColor(rgba: RGBA(red: 0.0, green: 255.0, blue: 0.0, alpha: 255.0)), .green)
        XCTAssertEqual(UIColor(rgba: RGBA(red: 0.0, green: 0.0, blue: 255.0, alpha: 255.0)), .blue)
        XCTAssertEqual(UIColor(rgba: RGBA(red: 0.0, green: 255.0, blue: 255.0, alpha: 255.0)), .cyan)
        XCTAssertEqual(UIColor(rgba: RGBA(red: 255.0, green: 0.0, blue: 255.0, alpha: 255.0)), .magenta)
        XCTAssertEqual(UIColor(rgba: RGBA(red: 255.0, green: 255.0, blue: 0.0, alpha: 255.0)), .yellow)
        XCTAssertEqual(UIColor(rgba: RGBA(red: 0.0, green: 0.0, blue: 0.0, alpha: 255.0)), .black)
        XCTAssertEqual(UIColor(rgba: RGBA(red: 85.0, green: 85.0, blue: 85.0, alpha: 255.0)), .darkGray)
        XCTAssertEqual(UIColor(rgba: RGBA(red: 127.5, green: 127.5, blue: 127.5, alpha: 255.0)), .gray)
        XCTAssertEqual(UIColor(rgba: RGBA(red: 170.0, green: 170.0, blue: 170.0, alpha: 255.0)), .lightGray)
        XCTAssertEqual(UIColor(rgba: RGBA(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)), .clear)
    }

}
