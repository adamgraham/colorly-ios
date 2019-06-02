//
//  UIColor+RandomTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_RandomTest: XCTestCase {

    func testRandom() {
        XCTAssertEqual(UIColor.random().alphaComponent, 1.0)
        XCTAssertEqual(UIColor.random(includeAlpha: false).alphaComponent, 1.0)
        XCTAssertNotEqual(UIColor.random(includeAlpha: true).alphaComponent, 1.0)
    }

    func testRandomSet() {
        XCTAssertEqual(UIColor.randomSet(of: 3).count, 3)
        XCTAssertEqual(UIColor.randomSet(of: 4).count, 4)
        XCTAssertEqual(UIColor.randomSet(of: 5).count, 5)
    }

}
