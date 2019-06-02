//
//  UIColor+ContrastTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_ContrastTest: XCTestCase {

    func testContrastRatio() {
        let accuracy = CGFloat.ulpOfOne
        XCTAssertEqual(UIColor.red.contrastRatio(to: .white), 3.9984767707539985, accuracy: accuracy)
        XCTAssertEqual(UIColor.green.contrastRatio(to: .white), 1.3721902770517513, accuracy: accuracy)
        XCTAssertEqual(UIColor.blue.contrastRatio(to: .white), 8.592471358428805, accuracy: accuracy)
        XCTAssertEqual(UIColor.cyan.contrastRatio(to: .white), 1.2538810604251254, accuracy: accuracy)
        XCTAssertEqual(UIColor.magenta.contrastRatio(to: .white), 3.1362007168458783, accuracy: accuracy)
        XCTAssertEqual(UIColor.yellow.contrastRatio(to: .white), 1.0738392309265699, accuracy: accuracy)
        XCTAssertEqual(UIColor.black.contrastRatio(to: .white), 21.0, accuracy: accuracy)
        XCTAssertEqual(UIColor.white.contrastRatio(to: .white), 1.0, accuracy: accuracy)

        XCTAssertEqual(UIColor.red.contrastRatio(to: .black), 5.252, accuracy: accuracy)
        XCTAssertEqual(UIColor.green.contrastRatio(to: .black), 15.303999999999998, accuracy: accuracy)
        XCTAssertEqual(UIColor.blue.contrastRatio(to: .black), 2.444, accuracy: accuracy)
        XCTAssertEqual(UIColor.cyan.contrastRatio(to: .black), 16.748, accuracy: accuracy)
        XCTAssertEqual(UIColor.magenta.contrastRatio(to: .black), 6.696, accuracy: accuracy)
        XCTAssertEqual(UIColor.yellow.contrastRatio(to: .black), 19.555999999999997, accuracy: accuracy)
        XCTAssertEqual(UIColor.black.contrastRatio(to: .black), 1.0, accuracy: accuracy)
        XCTAssertEqual(UIColor.white.contrastRatio(to: .black), 21.0, accuracy: accuracy)
    }

    func testHigherContrastRatio() {
        XCTAssertEqual(UIColor.red.higherContrastingColor(between: .white, and: .black), .black)
        XCTAssertEqual(UIColor.green.higherContrastingColor(between: .white, and: .black), .black)
        XCTAssertEqual(UIColor.blue.higherContrastingColor(between: .white, and: .black), .white)
        XCTAssertEqual(UIColor.cyan.higherContrastingColor(between: .white, and: .black), .black)
        XCTAssertEqual(UIColor.magenta.higherContrastingColor(between: .white, and: .black), .black)
        XCTAssertEqual(UIColor.yellow.higherContrastingColor(between: .white, and: .black), .black)
        XCTAssertEqual(UIColor.black.higherContrastingColor(between: .white, and: .black), .white)
        XCTAssertEqual(UIColor.white.higherContrastingColor(between: .white, and: .black), .black)
    }

    func testHighestContrastRatio() {
        XCTAssertEqual(UIColor.black.highestContrastingColor(between: [.red, .green, .blue]), .green)
        XCTAssertEqual(UIColor.black.highestContrastingColor(between: [.cyan, .magenta, .yellow]), .yellow)
        XCTAssertEqual(UIColor.white.highestContrastingColor(between: [.red, .green, .blue]), .blue)
        XCTAssertEqual(UIColor.white.highestContrastingColor(between: [.cyan, .magenta, .yellow]), .magenta)
    }

    func testLowerContrastRatio() {
        XCTAssertEqual(UIColor.red.lowerContrastingColor(between: .white, and: .black), .white)
        XCTAssertEqual(UIColor.green.lowerContrastingColor(between: .white, and: .black), .white)
        XCTAssertEqual(UIColor.blue.lowerContrastingColor(between: .white, and: .black), .black)
        XCTAssertEqual(UIColor.cyan.lowerContrastingColor(between: .white, and: .black), .white)
        XCTAssertEqual(UIColor.magenta.lowerContrastingColor(between: .white, and: .black), .white)
        XCTAssertEqual(UIColor.yellow.lowerContrastingColor(between: .white, and: .black), .white)
        XCTAssertEqual(UIColor.black.lowerContrastingColor(between: .white, and: .black), .black)
        XCTAssertEqual(UIColor.white.lowerContrastingColor(between: .white, and: .black), .white)
    }

    func testLowestContrastRatio() {
        XCTAssertEqual(UIColor.black.lowestContrastingColor(between: [.red, .green, .blue]), .blue)
        XCTAssertEqual(UIColor.black.lowestContrastingColor(between: [.cyan, .magenta, .yellow]), .magenta)
        XCTAssertEqual(UIColor.white.lowestContrastingColor(between: [.red, .green, .blue]), .green)
        XCTAssertEqual(UIColor.white.lowestContrastingColor(between: [.cyan, .magenta, .yellow]), .yellow)
    }

}
