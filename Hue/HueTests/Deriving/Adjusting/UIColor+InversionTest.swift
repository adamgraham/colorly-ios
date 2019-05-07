//
//  UIColor+InversionTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_InversionTest: XCTestCase {

    func testInverted() {
        XCTAssertEqual(UIColor.red.inverted, .cyan)
        XCTAssertEqual(UIColor.orange.inverted, .azure)
        XCTAssertEqual(UIColor.yellow.inverted, .blue)
        XCTAssertEqual(UIColor.chartreuse.inverted, .violet)
        XCTAssertEqual(UIColor.green.inverted, .magenta)
        XCTAssertEqual(UIColor.springGreen.inverted, .rose)
        XCTAssertEqual(UIColor.cyan.inverted, .red)
        XCTAssertEqual(UIColor.azure.inverted, .orange)
        XCTAssertEqual(UIColor.blue.inverted, .yellow)
        XCTAssertEqual(UIColor.violet.inverted, .chartreuse)
        XCTAssertEqual(UIColor.magenta.inverted, .green)
        XCTAssertEqual(UIColor.rose.inverted, .springGreen)
        XCTAssertEqual(UIColor.black.inverted, .white)
        XCTAssertEqual(UIColor.white.inverted, .black)
    }

}
