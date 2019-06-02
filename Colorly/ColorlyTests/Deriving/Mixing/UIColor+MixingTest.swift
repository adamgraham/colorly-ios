//
//  UIColor+MixingTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_MixingTest: XCTestCase {

    func testMixing() {
        XCTAssertEqual(UIColor.white.mixed(with: .black), .gray)
        XCTAssertEqual(UIColor.white.mixed(with: .black, weight: 0.0), .white)
        XCTAssertEqual(UIColor.white.mixed(with: .black, weight: 1.0), .black)
        XCTAssertEqual(UIColor.cyan.mixed(with: .blue), .azure)
        XCTAssertEqual(UIColor.blue.mixed(with: .magenta), .violet)
        XCTAssertEqual(UIColor.magenta.mixed(with: .red), .rose)
        XCTAssertEqual(UIColor.red.mixed(with: .yellow), .orange)
        XCTAssertEqual(UIColor.yellow.mixed(with: .green), .chartreuse)
        XCTAssertEqual(UIColor.green.mixed(with: .cyan), .springGreen)
    }

}
