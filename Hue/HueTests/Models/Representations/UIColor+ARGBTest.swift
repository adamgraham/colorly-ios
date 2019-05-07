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
        XCTAssertEqual(UIColor.white.argb, ARGB(alpha: 255.0, red: 255.0, green: 255.0, blue: 255.0))
        XCTAssertEqual(UIColor.red.argb, ARGB(alpha: 255.0, red: 255.0, green: 0.0, blue: 0.0))
        XCTAssertEqual(UIColor.green.argb, ARGB(alpha: 255.0, red: 0.0, green: 255.0, blue: 0.0))
        XCTAssertEqual(UIColor.blue.argb, ARGB(alpha: 255.0, red: 0.0, green: 0.0, blue: 255.0))
        XCTAssertEqual(UIColor.cyan.argb, ARGB(alpha: 255.0, red: 0.0, green: 255.0, blue: 255.0))
        XCTAssertEqual(UIColor.magenta.argb, ARGB(alpha: 255.0, red: 255.0, green: 0.0, blue: 255.0))
        XCTAssertEqual(UIColor.yellow.argb, ARGB(alpha: 255.0, red: 255.0, green: 255.0, blue: 0.0))
        XCTAssertEqual(UIColor.black.argb, ARGB(alpha: 255.0, red: 0.0, green: 0.0, blue: 0.0))
        XCTAssertEqual(UIColor.darkGray.argb, ARGB(alpha: 255.0, red: 85.0, green: 85.0, blue: 85.0))
        XCTAssertEqual(UIColor.gray.argb, ARGB(alpha: 255.0, red: 127.5, green: 127.5, blue: 127.5))
        XCTAssertEqual(UIColor.lightGray.argb, ARGB(alpha: 255.0, red: 170.0, green: 170.0, blue: 170.0))
        XCTAssertEqual(UIColor.clear.argb, ARGB(alpha: 0.0, red: 0.0, green: 0.0, blue: 0.0))
    }

    func testARGBInit() {
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 255.0, red: 255.0, green: 255.0, blue: 255.0)), .white)
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 255.0, red: 255.0, green: 0.0, blue: 0.0)), .red)
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 255.0, red: 0.0, green: 255.0, blue: 0.0)), .green)
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 255.0, red: 0.0, green: 0.0, blue: 255.0)), .blue)
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 255.0, red: 0.0, green: 255.0, blue: 255.0)), .cyan)
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 255.0, red: 255.0, green: 0.0, blue: 255.0)), .magenta)
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 255.0, red: 255.0, green: 255.0, blue: 0.0)), .yellow)
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 255.0, red: 0.0, green: 0.0, blue: 0.0)), .black)
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 255.0, red: 85.0, green: 85.0, blue: 85.0)), .darkGray)
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 255.0, red: 127.5, green: 127.5, blue: 127.5)), .gray)
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 255.0, red: 170.0, green: 170.0, blue: 170.0)), .lightGray)
        XCTAssertEqual(UIColor(argb: ARGB(alpha: 0.0, red: 0.0, green: 0.0, blue: 0.0)), .clear)
    }

}
