//
//  UIColor+ArithmeticTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_ArithmeticTest: XCTestCase {

    func testAdd() {
        XCTAssertEqual(UIColor.white + .black, .white)
        XCTAssertEqual(UIColor.black + .white, .white)
        XCTAssertEqual(UIColor.black + .red + .green + .blue, .white)
        XCTAssertEqual(UIColor.black + .red + .blue, .magenta)
        XCTAssertEqual(UIColor.black + .red + .green, .yellow)
        XCTAssertEqual(UIColor.black + .blue + .red, .magenta)
        XCTAssertEqual(UIColor.black + .blue + .green, .cyan)
        XCTAssertEqual(UIColor.black + .green + .red, .yellow)
        XCTAssertEqual(UIColor.black + .green + .blue, .cyan)
    }

    func testSubtract() {
        XCTAssertEqual(UIColor.white - .black, .white)
        XCTAssertEqual(UIColor.black - .white, .black)
        XCTAssertEqual(UIColor.white - .red - .green - .blue, .black)
        XCTAssertEqual(UIColor.white - .red, .cyan)
        XCTAssertEqual(UIColor.white - .red - .green, .blue)
        XCTAssertEqual(UIColor.white - .red - .blue, .green)
        XCTAssertEqual(UIColor.white - .green, .magenta)
        XCTAssertEqual(UIColor.white - .green - .red, .blue)
        XCTAssertEqual(UIColor.white - .green - .blue, .red)
        XCTAssertEqual(UIColor.white - .blue, .yellow)
        XCTAssertEqual(UIColor.white - .blue - .red, .green)
        XCTAssertEqual(UIColor.white - .blue - .green, .red)
    }

    func testMultiply() {
        XCTAssertEqual(UIColor.white * 0.0, .black)
        XCTAssertEqual(UIColor.white * 0.5, .gray)
        XCTAssertEqual(UIColor.white * 1.0, .white)
        XCTAssertEqual(UIColor.white * 1.5, .white)
        XCTAssertEqual(UIColor.white * 2.0, .white)
        XCTAssertEqual(UIColor.black * 0.0, .black)
        XCTAssertEqual(UIColor.black * 0.5, .black)
        XCTAssertEqual(UIColor.black * 1.0, .black)
        XCTAssertEqual(UIColor.black * 1.5, .black)
        XCTAssertEqual(UIColor.black * 2.0, .black)
        XCTAssertEqual(UIColor.gray * 0.0, .black)
        XCTAssertEqual(UIColor.gray * 0.5, UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0))
        XCTAssertEqual(UIColor.gray * 1.0, .gray)
        XCTAssertEqual(UIColor.gray * 1.5, UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0))
        XCTAssertEqual(UIColor.gray * 2.0, .white)
    }

    func testDivide() {
        XCTAssertEqual(UIColor.white / 0.5, .white)
        XCTAssertEqual(UIColor.white / 1.0, .white)
        XCTAssertEqual(UIColor.white / 2.0, .gray)
        XCTAssertEqual(UIColor.black / 0.5, .black)
        XCTAssertEqual(UIColor.black / 1.0, .black)
        XCTAssertEqual(UIColor.black / 2.0, .black)
        XCTAssertEqual(UIColor.gray / 0.5, .white)
        XCTAssertEqual(UIColor.gray / 1.0, .gray)
        XCTAssertEqual(UIColor.gray / 2.0, UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0))
    }

}
