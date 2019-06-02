//
//  UIColor+AveragingTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_AveragingTest: XCTestCase {

    func testAverage() {
        XCTAssertEqual(UIColor.average(of: .white, and: .black), UIColor(red: 0.7071067811865476, green: 0.7071067811865476, blue: 0.7071067811865476, alpha: 1.0))
        XCTAssertEqual(UIColor.average(of: [.red, .green, .blue]), UIColor(red: 0.5773502691896257, green: 0.5773502691896257, blue: 0.5773502691896257, alpha: 1.0))
        XCTAssertEqual(UIColor.average(of: [.cyan, .magenta, .yellow]), UIColor(red: 0.816496580927726, green: 0.816496580927726, blue: 0.816496580927726, alpha: 1.0))
        XCTAssertEqual(UIColor.average(of: [.red, .green, .blue, .cyan, .magenta, .yellow]), UIColor(red: 0.7071067811865476, green: 0.7071067811865476, blue: 0.7071067811865476, alpha: 1.0))
    }

}
