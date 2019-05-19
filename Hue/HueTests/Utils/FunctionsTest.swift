//
//  FunctionsTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class FunctionsTest: XCTestCase {

    func testClamp() {
        XCTAssertEqual(clamp(-0.5, 0.0, 1.0), 0.0)
        XCTAssertEqual(clamp(-0.25, 0.0, 1.0), 0.0)
        XCTAssertEqual(clamp(0.0, 0.0, 1.0), 0.0)
        XCTAssertEqual(clamp(0.25, 0.0, 1.0), 0.25)
        XCTAssertEqual(clamp(0.5, 0.0, 1.0), 0.5)
        XCTAssertEqual(clamp(0.75, 0.0, 1.0), 0.75)
        XCTAssertEqual(clamp(1.0, 0.0, 1.0), 1.0)
        XCTAssertEqual(clamp(1.25, 0.0, 1.0), 1.0)
        XCTAssertEqual(clamp(1.5, 0.0, 1.0), 1.0)
    }

    func testRotatingClamp() {
        XCTAssertEqual(rotatingClamp(-0.5, 0.0, 1.0), 0.5)
        XCTAssertEqual(rotatingClamp(-0.25, 0.0, 1.0), 0.75)
        XCTAssertEqual(rotatingClamp(0.0, 0.0, 1.0), 0.0)
        XCTAssertEqual(rotatingClamp(0.25, 0.0, 1.0), 0.25)
        XCTAssertEqual(rotatingClamp(0.5, 0.0, 1.0), 0.5)
        XCTAssertEqual(rotatingClamp(0.75, 0.0, 1.0), 0.75)
        XCTAssertEqual(rotatingClamp(1.0, 0.0, 1.0), 1.0)
        XCTAssertEqual(rotatingClamp(1.25, 0.0, 1.0), 0.25)
        XCTAssertEqual(rotatingClamp(1.5, 0.0, 1.0), 0.5)
    }

    func testDeg2Rad() {
        XCTAssertEqual(deg2rad(1.0), 0.0174533, accuracy: 0.0001)
        XCTAssertEqual(deg2rad(57.2958), 1.0, accuracy: 0.0001)
        XCTAssertEqual(deg2rad(180.0), .pi, accuracy: 0.0001)
    }

    func testRad2Deg() {
        XCTAssertEqual(rad2deg(0.0174533), 1.0, accuracy: 0.0001)
        XCTAssertEqual(rad2deg(1.0), 57.2958, accuracy: 0.0001)
        XCTAssertEqual(rad2deg(.pi), 180.0, accuracy: 0.0001)
    }

    func testIsZero() {
        XCTAssertTrue(CGFloat(0.0).isZero(accuracy: .ulpOfOne))
        XCTAssertTrue(CGFloat.ulpOfOne.isZero(accuracy: .ulpOfOne))
        XCTAssertTrue((-CGFloat.ulpOfOne).isZero(accuracy: .ulpOfOne))
        XCTAssertTrue((CGFloat.ulpOfOne / 2.0).isZero(accuracy: .ulpOfOne))
        XCTAssertFalse((CGFloat.ulpOfOne * 2.0).isZero(accuracy: .ulpOfOne))
        XCTAssertFalse((CGFloat.ulpOfOne * -2.0).isZero(accuracy: .ulpOfOne))
    }

}
