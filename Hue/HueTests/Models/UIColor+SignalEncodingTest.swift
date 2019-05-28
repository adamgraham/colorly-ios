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
        let constants = encoding.constants
        XCTAssertEqual(constants.r, 0.299)
        XCTAssertEqual(constants.g, 0.587)
        XCTAssertEqual(constants.b, 0.114)
        XCTAssertEqual(constants.r + constants.g + constants.b, 1.0, accuracy: .ulpOfOne)
    }

    func testHDTV() {
        let encoding = UIColor.SignalEncoding.hdtv
        let constants = encoding.constants
        XCTAssertEqual(constants.r, 0.2126)
        XCTAssertEqual(constants.g, 0.7152)
        XCTAssertEqual(constants.b, 0.0722)
        XCTAssertEqual(constants.r + constants.g + constants.b, 1.0, accuracy: .ulpOfOne)
    }

}
