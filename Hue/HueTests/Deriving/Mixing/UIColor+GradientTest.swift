//
//  UIColor+GradientTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_GradientTest: XCTestCase {

    func testGradient() {
        var gradient = UIColor.gradient(between: .orange, and: .purple, stops: 2)
        XCTAssertEqual(gradient[0], .orange)
        XCTAssertEqual(gradient[1], .purple)

        gradient = UIColor.gradient(between: .orange, and: .purple, stops: 3)
        XCTAssertEqual(gradient[0], .orange)
        XCTAssertEqual(gradient[1], UIColor(red: 0.75, green: 0.25, blue: 0.25, alpha: 1.0))
        XCTAssertEqual(gradient[2], .purple)

        gradient = UIColor.gradient(between: .orange, and: .purple, stops: 4)
        XCTAssertEqual(gradient[0], .orange)
        XCTAssertEqual(gradient[1], UIColor(red: 5.0/6.0, green: 1.0/3.0, blue: 1.0/6.0, alpha: 1.0))
        XCTAssertEqual(gradient[2], UIColor(red: 2.0/3.0, green: 1.0/6.0, blue: 1.0/3.0, alpha: 1.0))
        XCTAssertEqual(gradient[3], .purple)

        gradient = UIColor.gradient(between: .orange, and: .purple, stops: 5)
        XCTAssertEqual(gradient[0], .orange)
        XCTAssertEqual(gradient[1], UIColor(red: 0.875, green: 0.375, blue: 0.125, alpha: 1.0))
        XCTAssertEqual(gradient[2], UIColor(red: 0.75, green: 0.25, blue: 0.25, alpha: 1.0))
        XCTAssertEqual(gradient[3], UIColor(red: 0.625, green: 0.125, blue: 0.375, alpha: 1.0))
        XCTAssertEqual(gradient[4], .purple)
    }

    func testGradientCustomStops() {
        var gradient = UIColor.gradient(between: .orange, and: .purple, customStops: [0.0, 0.25, 0.5, 0.75, 1.0])
        XCTAssertEqual(gradient[0], .orange)
        XCTAssertEqual(gradient[1], UIColor(red: 0.875, green: 0.375, blue: 0.125, alpha: 1.0))
        XCTAssertEqual(gradient[2], UIColor(red: 0.75, green: 0.25, blue: 0.25, alpha: 1.0))
        XCTAssertEqual(gradient[3], UIColor(red: 0.625, green: 0.125, blue: 0.375, alpha: 1.0))
        XCTAssertEqual(gradient[4], .purple)

        gradient = UIColor.gradient(between: .orange, and: .purple, customStops: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0])
        XCTAssertEqual(gradient[0], .orange)
        XCTAssertEqual(gradient[1], UIColor(red: 0.9, green: 0.4, blue: 0.1, alpha: 1.0))
        XCTAssertEqual(gradient[2], UIColor(red: 0.8, green: 0.3, blue: 0.2, alpha: 1.0))
        XCTAssertEqual(gradient[3], UIColor(red: 0.7, green: 0.2, blue: 0.3, alpha: 1.0))
        XCTAssertEqual(gradient[4], UIColor(red: 0.6, green: 0.1, blue: 0.4, alpha: 1.0))
        XCTAssertEqual(gradient[5], .purple)
    }

}
