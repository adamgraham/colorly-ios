//
//  UIColor+ARGBTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_ARGBTest: XCTestCase {

    typealias ARGB = UIColor.ARGB

    func testARGB() {
        XCTAssertEqual(UIColor.white.argb, ARGB(alpha: 255, red: 255, green: 255, blue: 255))
        XCTAssertEqual(UIColor.red.argb, ARGB(alpha: 255, red: 255, green: 0, blue: 0))
        XCTAssertEqual(UIColor.green.argb, ARGB(alpha: 255, red: 0, green: 255, blue: 0))
        XCTAssertEqual(UIColor.blue.argb, ARGB(alpha: 255, red: 0, green: 0, blue: 255))
        XCTAssertEqual(UIColor.cyan.argb, ARGB(alpha: 255, red: 0, green: 255, blue: 255))
        XCTAssertEqual(UIColor.magenta.argb, ARGB(alpha: 255, red: 255, green: 0, blue: 255))
        XCTAssertEqual(UIColor.yellow.argb, ARGB(alpha: 255, red: 255, green: 255, blue: 0))
        XCTAssertEqual(UIColor.black.argb, ARGB(alpha: 255, red: 0, green: 0, blue: 0))
        XCTAssertEqual(UIColor.darkGray.argb, ARGB(alpha: 255, red: 85, green: 85, blue: 85))
        XCTAssertEqual(UIColor.gray.argb, ARGB(alpha: 255, red: 128, green: 128, blue: 128))
        XCTAssertEqual(UIColor.lightGray.argb, ARGB(alpha: 255, red: 170, green: 170, blue: 170))
        XCTAssertEqual(UIColor.clear.argb, ARGB(alpha: 0, red: 0, green: 0, blue: 0))
    }

    func testARGBInit() {
        XCTAssertEqual(UIColor(ARGB(alpha: 255, red: 255, green: 255, blue: 255)), .white)
        XCTAssertEqual(UIColor(ARGB(alpha: 255, red: 255, green: 0, blue: 0)), .red)
        XCTAssertEqual(UIColor(ARGB(alpha: 255, red: 0, green: 255, blue: 0)), .green)
        XCTAssertEqual(UIColor(ARGB(alpha: 255, red: 0, green: 0, blue: 255)), .blue)
        XCTAssertEqual(UIColor(ARGB(alpha: 255, red: 0, green: 255, blue: 255)), .cyan)
        XCTAssertEqual(UIColor(ARGB(alpha: 255, red: 255, green: 0, blue: 255)), .magenta)
        XCTAssertEqual(UIColor(ARGB(alpha: 255, red: 255, green: 255, blue: 0)), .yellow)
        XCTAssertEqual(UIColor(ARGB(alpha: 255, red: 0, green: 0, blue: 0)), .black)
        XCTAssertEqual(UIColor(ARGB(alpha: 255, red: 85, green: 85, blue: 85)), .darkGray)
        XCTAssertEqual(UIColor(ARGB(alpha: 255, red: 128, green: 128, blue: 128)), .gray, accuracy: 0.0019607843137255)
        XCTAssertEqual(UIColor(ARGB(alpha: 255, red: 170, green: 170, blue: 170)), .lightGray)
        XCTAssertEqual(UIColor(ARGB(alpha: 0, red: 0, green: 0, blue: 0)), .clear)
    }

}
