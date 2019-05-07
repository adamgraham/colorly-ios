//
//  UIColor+HarmonyTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HarmonyTest: XCTestCase {

    func testMonochromatic() {
        let harmony = UIColor.red.harmonies.monochromatic
        XCTAssertEqual(harmony.0, UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0))
        XCTAssertEqual(harmony.1, UIColor(red: 1.0, green: 0.25, blue: 0.25, alpha: 1.0))
        XCTAssertEqual(harmony.2, UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(harmony.3, UIColor(red: 0.75, green: 0.0, blue: 0.0, alpha: 1.0))
        XCTAssertEqual(harmony.4, UIColor(red: 0.5, green: 0.0, blue: 0.0, alpha: 1.0))
    }

    func testComplementary() {
        let harmony = UIColor.red.harmonies.complementary
        XCTAssertEqual(harmony.0, .red)
        XCTAssertEqual(harmony.1, .cyan)
    }

    func testSplitComplementary() {
        let harmony = UIColor.red.harmonies.splitComplementary
        XCTAssertEqual(harmony.0, .red)
        XCTAssertEqual(harmony.1, .springGreen)
        XCTAssertEqual(harmony.2, .azure)
    }

    func testAnalogous() {
        let harmony = UIColor.red.harmonies.analogous
        XCTAssertEqual(harmony.0, .red)
        XCTAssertEqual(harmony.1, .orange)
        XCTAssertEqual(harmony.2, .rose)
    }

    func testTriadic() {
        let harmony = UIColor.red.harmonies.triadic
        XCTAssertEqual(harmony.0, .red)
        XCTAssertEqual(harmony.1, .green)
        XCTAssertEqual(harmony.2, .blue)
    }

    func testTetradic() {
        let harmony = UIColor.red.harmonies.tetradic
        XCTAssertEqual(harmony.0, .red)
        XCTAssertEqual(harmony.1, .cyan)
        XCTAssertEqual(harmony.2, .yellow)
        XCTAssertEqual(harmony.3, .blue)
    }

    func testSquare() {
        let harmony = UIColor.red.harmonies.square
        XCTAssertEqual(harmony.0, .red)
        XCTAssertEqual(harmony.1, .cyan)
        XCTAssertEqual(harmony.2, .chartreuse)
        XCTAssertEqual(harmony.3, .violet)
    }

}
