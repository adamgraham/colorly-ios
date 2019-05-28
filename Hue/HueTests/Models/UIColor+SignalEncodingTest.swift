//
//  UIColor+SignalEncodingTest.swift
//  HueTests
//
//  Created by Adam Graham on 5/28/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_SignalEncodingTest: XCTestCase {

    func testStandard() {
        let encoding = UIColor.SignalEncoding.standard
        let coefficients = encoding.coefficients
        XCTAssertEqual(coefficients.r, 0.299)
        XCTAssertEqual(coefficients.g, 0.587)
        XCTAssertEqual(coefficients.b, 0.114)
        XCTAssertEqual(coefficients.r + coefficients.g + coefficients.b, 1.0, accuracy: .ulpOfOne)
    }

    func testHDTV() {
        let encoding = UIColor.SignalEncoding.hdtv
        let coefficients = encoding.coefficients
        XCTAssertEqual(coefficients.r, 0.2126)
        XCTAssertEqual(coefficients.g, 0.7152)
        XCTAssertEqual(coefficients.b, 0.0722)
        XCTAssertEqual(coefficients.r + coefficients.g + coefficients.b, 1.0, accuracy: .ulpOfOne)
    }

}
