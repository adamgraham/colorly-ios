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

}
