//
//  UIColor+SignalEncodingTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 5/28/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_SignalEncodingTest: XCTestCase {

    func testRec601() {
        let encoding = UIColor.SignalEncoding.rec601
        let coefficients = encoding.coefficients
        XCTAssertEqual(coefficients.r, 0.299)
        XCTAssertEqual(coefficients.g, 0.587)
        XCTAssertEqual(coefficients.b, 0.114)
        XCTAssertEqual(coefficients.r + coefficients.g + coefficients.b, 1.0, accuracy: .ulpOfOne)
    }

    func testRec709() {
        let encoding = UIColor.SignalEncoding.rec709
        let coefficients = encoding.coefficients
        XCTAssertEqual(coefficients.r, 0.2126)
        XCTAssertEqual(coefficients.g, 0.7152)
        XCTAssertEqual(coefficients.b, 0.0722)
        XCTAssertEqual(coefficients.r + coefficients.g + coefficients.b, 1.0, accuracy: .ulpOfOne)
    }

}
