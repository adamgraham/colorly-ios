//
//  UIColor+LinearRGBTest.swift
//  HueTests
//
//  Created by Adam Graham on 5/19/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_LinearRGBTest: XCTestCase {

    private let accuracy: CGFloat = 0.0001

    func testLinearRGB() {
        assert(UIColor.white.linearRGB, (1.0, 1.0, 1.0))
        assert(UIColor.red.linearRGB, (1.0, 0.0, 0.0))
        assert(UIColor.green.linearRGB, (0.0, 1.0, 0.0))
        assert(UIColor.blue.linearRGB, (0.0, 0.0, 1.0))
        assert(UIColor.cyan.linearRGB, (0.0, 1.0, 1.0))
        assert(UIColor.magenta.linearRGB, (1.0, 0.0, 1.0))
        assert(UIColor.yellow.linearRGB, (1.0, 1.0, 0.0))
        assert(UIColor.black.linearRGB, (0.0, 0.0, 0.0))
        assert(UIColor.darkGray.linearRGB, (0.09084, 0.09084, 0.09084))
        assert(UIColor.gray.linearRGB, (0.21404, 0.21404, 0.21404))
        assert(UIColor.lightGray.linearRGB, (0.40198, 0.40198, 0.40198))
        assert(UIColor.clear.linearRGB, (0.0, 0.0, 0.0))
    }

    func testLinearRGBInit() {
        assert(UIColor(linear: (1.0, 1.0, 1.0)), .white)
        assert(UIColor(linear: (1.0, 0.0, 0.0)), .red)
        assert(UIColor(linear: (0.0, 1.0, 0.0)), .green)
        assert(UIColor(linear: (0.0, 0.0, 1.0)), .blue)
        assert(UIColor(linear: (0.0, 1.0, 1.0)), .cyan)
        assert(UIColor(linear: (1.0, 0.0, 1.0)), .magenta)
        assert(UIColor(linear: (1.0, 1.0, 0.0)), .yellow)
        assert(UIColor(linear: (0.0, 0.0, 0.0)), .black)
        assert(UIColor(linear: (0.09084, 0.09084, 0.09084)), .darkGray)
        assert(UIColor(linear: (0.21404, 0.21404, 0.21404)), .gray)
        assert(UIColor(linear: (0.40198, 0.40198, 0.40198)), .lightGray)
        assert(UIColor(linear: (0.0, 0.0, 0.0), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ rgb: (r: CGFloat, g: CGFloat, b: CGFloat), _ expected: (r: CGFloat, g: CGFloat, b: CGFloat)) {
        XCTAssertEqual(rgb.r, expected.r, accuracy: self.accuracy)
        XCTAssertEqual(rgb.g, expected.g, accuracy: self.accuracy)
        XCTAssertEqual(rgb.b, expected.b, accuracy: self.accuracy)
    }

}
