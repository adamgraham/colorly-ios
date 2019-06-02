//
//  UIColor+MixingModelTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_MixingModelTest: XCTestCase {

    func testPrimaryColors() {
        assertColors(UIColor.MixingModel.additive.primaryColors, equals: (.red, .green, .blue))
        assertColors(UIColor.MixingModel.subtractive.primaryColors, equals: (.cyan, .magenta, .yellow))
        assertColors(UIColor.MixingModel.traditional.primaryColors, equals: (.red, .yellow, .blue))
    }

    func testSecondaryColors() {
        assertColors(UIColor.MixingModel.additive.secondaryColors, equals: (.cyan, .magenta, .yellow))
        assertColors(UIColor.MixingModel.subtractive.secondaryColors, equals: (.red, .green, .blue))
        assertColors(UIColor.MixingModel.traditional.secondaryColors, equals: (.green, .magenta, .orange))
    }

    func testTertiaryColors() {
        assertColors(UIColor.MixingModel.additive.tertiaryColors, equals: (
            .rose, .orange,
            .springGreen, .chartreuse,
            .azure, .violet))

        assertColors(UIColor.MixingModel.subtractive.tertiaryColors, equals: (
            .springGreen, .azure,
            .rose, .violet,
            .orange, .chartreuse))

        assertColors(UIColor.MixingModel.traditional.tertiaryColors, equals: (
            .rose, UIColor.ColorWheel.RYB.vermilion,
            .chartreuse, UIColor.ColorWheel.RYB.amber,
            UIColor.ColorWheel.RYB.teal, .violet))
    }

    func testColorWheel() {
        assertColors(UIColor.MixingModel.additive.colorWheel, equals: (
            .red, .orange, .yellow, .chartreuse,
            .green, .springGreen, .cyan, .azure,
            .blue, .violet, .magenta, .rose))

        assertColors(UIColor.MixingModel.subtractive.colorWheel, equals: (
            .cyan, .azure, .blue, .violet,
            .magenta, .rose, .red, .orange,
            .yellow, .chartreuse, .green, .springGreen))

        assertColors(UIColor.MixingModel.traditional.colorWheel, equals: (
            .red, UIColor.ColorWheel.RYB.vermilion, .orange, UIColor.ColorWheel.RYB.amber,
            .yellow, .chartreuse, .green, UIColor.ColorWheel.RYB.teal,
            .blue, .violet, .magenta, .rose))
    }

    private func assertColors(_ colors: (UIColor, UIColor, UIColor),
                              equals expected: (UIColor, UIColor, UIColor)) {
        XCTAssertEqual(colors.0, expected.0)
        XCTAssertEqual(colors.1, expected.1)
        XCTAssertEqual(colors.2, expected.2)
    }

    private func assertColors(_ colors: (UIColor, UIColor, UIColor, UIColor, UIColor, UIColor),
                              equals expected: (UIColor, UIColor, UIColor, UIColor, UIColor, UIColor)) {
        XCTAssertEqual(colors.0, expected.0)
        XCTAssertEqual(colors.1, expected.1)
        XCTAssertEqual(colors.2, expected.2)
        XCTAssertEqual(colors.3, expected.3)
        XCTAssertEqual(colors.4, expected.4)
        XCTAssertEqual(colors.5, expected.5)
    }

    private func assertColors(_ colors: (UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor),
                              equals expected: (UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor, UIColor)) {
        XCTAssertEqual(colors.0, expected.0)
        XCTAssertEqual(colors.1, expected.1)
        XCTAssertEqual(colors.2, expected.2)
        XCTAssertEqual(colors.3, expected.3)
        XCTAssertEqual(colors.4, expected.4)
        XCTAssertEqual(colors.5, expected.5)
        XCTAssertEqual(colors.6, expected.6)
        XCTAssertEqual(colors.7, expected.7)
        XCTAssertEqual(colors.8, expected.8)
        XCTAssertEqual(colors.9, expected.9)
        XCTAssertEqual(colors.10, expected.10)
        XCTAssertEqual(colors.11, expected.11)
    }

}
