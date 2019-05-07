//
//  UIColor+HueTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HueTest: XCTestCase {

    func testAdjustingHue() {
        let baseColor = UIColor.red

        XCTAssertEqual(baseColor.adjustingHue(by: -360.0), .red)
        XCTAssertEqual(baseColor.adjustingHue(by: -330.0), .orange)
        XCTAssertEqual(baseColor.adjustingHue(by: -300.0), .yellow)
        XCTAssertEqual(baseColor.adjustingHue(by: -270.0), .chartreuse)
        XCTAssertEqual(baseColor.adjustingHue(by: -240.0), .green)
        XCTAssertEqual(baseColor.adjustingHue(by: -210.0), .springGreen)
        XCTAssertEqual(baseColor.adjustingHue(by: -180.0), .cyan)
        XCTAssertEqual(baseColor.adjustingHue(by: -150.0), .azure)
        XCTAssertEqual(baseColor.adjustingHue(by: -120.0), .blue)
        XCTAssertEqual(baseColor.adjustingHue(by: -90.0), .violet)
        XCTAssertEqual(baseColor.adjustingHue(by: -60.0), .magenta)
        XCTAssertEqual(baseColor.adjustingHue(by: -30.0), .rose)

        XCTAssertEqual(baseColor.adjustingHue(by: 0.0), .red)
        XCTAssertEqual(baseColor.adjustingHue(by: 30.0), .orange)
        XCTAssertEqual(baseColor.adjustingHue(by: 60.0), .yellow)
        XCTAssertEqual(baseColor.adjustingHue(by: 90.0), .chartreuse)
        XCTAssertEqual(baseColor.adjustingHue(by: 120.0), .green)
        XCTAssertEqual(baseColor.adjustingHue(by: 150.0), .springGreen)
        XCTAssertEqual(baseColor.adjustingHue(by: 180.0), .cyan)
        XCTAssertEqual(baseColor.adjustingHue(by: 210.0), .azure)
        XCTAssertEqual(baseColor.adjustingHue(by: 240.0), .blue)
        XCTAssertEqual(baseColor.adjustingHue(by: 270.0), .violet)
        XCTAssertEqual(baseColor.adjustingHue(by: 300.0), .magenta)
        XCTAssertEqual(baseColor.adjustingHue(by: 330.0), .rose)
        XCTAssertEqual(baseColor.adjustingHue(by: 360.0), .red)

        XCTAssertEqual(baseColor.adjustingHue(by: 390.0), .orange)
        XCTAssertEqual(baseColor.adjustingHue(by: 420.0), .yellow)
        XCTAssertEqual(baseColor.adjustingHue(by: 450.0), .chartreuse)
        XCTAssertEqual(baseColor.adjustingHue(by: 480.0), .green)
        XCTAssertEqual(baseColor.adjustingHue(by: 510.0), .springGreen)
        XCTAssertEqual(baseColor.adjustingHue(by: 540.0), .cyan)
        XCTAssertEqual(baseColor.adjustingHue(by: 570.0), .azure)
        XCTAssertEqual(baseColor.adjustingHue(by: 600.0), .blue)
        XCTAssertEqual(baseColor.adjustingHue(by: 630.0), .violet)
        XCTAssertEqual(baseColor.adjustingHue(by: 660.0), .magenta)
        XCTAssertEqual(baseColor.adjustingHue(by: 690.0), .rose)
        XCTAssertEqual(baseColor.adjustingHue(by: 720.0), .red)
    }

    func testComplement() {
        XCTAssertEqual(UIColor.red.complement, .cyan)
        XCTAssertEqual(UIColor.orange.complement, .azure)
        XCTAssertEqual(UIColor.yellow.complement, .blue)
        XCTAssertEqual(UIColor.chartreuse.complement, .violet)
        XCTAssertEqual(UIColor.green.complement, .magenta)
        XCTAssertEqual(UIColor.springGreen.complement, .rose)
        XCTAssertEqual(UIColor.cyan.complement, .red)
        XCTAssertEqual(UIColor.azure.complement, .orange)
        XCTAssertEqual(UIColor.blue.complement, .yellow)
        XCTAssertEqual(UIColor.violet.complement, .chartreuse)
        XCTAssertEqual(UIColor.magenta.complement, .green)
        XCTAssertEqual(UIColor.rose.complement, .springGreen)
    }

    func testIsCool() {
        XCTAssertFalse(UIColor.red.isCool)
        XCTAssertFalse(UIColor.orange.isCool)
        XCTAssertFalse(UIColor.yellow.isCool)
        XCTAssertTrue(UIColor.chartreuse.isCool)
        XCTAssertTrue(UIColor.green.isCool)
        XCTAssertTrue(UIColor.springGreen.isCool)
        XCTAssertTrue(UIColor.cyan.isCool)
        XCTAssertTrue(UIColor.azure.isCool)
        XCTAssertTrue(UIColor.blue.isCool)
        XCTAssertFalse(UIColor.violet.isCool)
        XCTAssertFalse(UIColor.magenta.isCool)
        XCTAssertFalse(UIColor.rose.isCool)
    }

    func testIsWarm() {
        XCTAssertTrue(UIColor.red.isWarm)
        XCTAssertTrue(UIColor.orange.isWarm)
        XCTAssertTrue(UIColor.yellow.isWarm)
        XCTAssertFalse(UIColor.chartreuse.isWarm)
        XCTAssertFalse(UIColor.green.isWarm)
        XCTAssertFalse(UIColor.springGreen.isWarm)
        XCTAssertFalse(UIColor.cyan.isWarm)
        XCTAssertFalse(UIColor.azure.isWarm)
        XCTAssertFalse(UIColor.blue.isWarm)
        XCTAssertTrue(UIColor.violet.isWarm)
        XCTAssertTrue(UIColor.magenta.isWarm)
        XCTAssertTrue(UIColor.rose.isWarm)
    }

}
