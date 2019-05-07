//
//  UIColor+CMYKTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_CMYKTest: XCTestCase {

    typealias CMYK = UIColor.CMYK

    func testCMYK() {
        XCTAssertEqual(UIColor.white.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 0.0))
        XCTAssertEqual(UIColor.red.cmyk, CMYK(cyan: 0.0, magenta: 1.0, yellow: 1.0, black: 0.0))
        XCTAssertEqual(UIColor.green.cmyk, CMYK(cyan: 1.0, magenta: 0.0, yellow: 1.0, black: 0.0))
        XCTAssertEqual(UIColor.blue.cmyk, CMYK(cyan: 1.0, magenta: 1.0, yellow: 0.0, black: 0.0))
        XCTAssertEqual(UIColor.cyan.cmyk, CMYK(cyan: 1.0, magenta: 0.0, yellow: 0.0, black: 0.0))
        XCTAssertEqual(UIColor.magenta.cmyk, CMYK(cyan: 0.0, magenta: 1.0, yellow: 0.0, black: 0.0))
        XCTAssertEqual(UIColor.yellow.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 1.0, black: 0.0))
        XCTAssertEqual(UIColor.black.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 1.0))
        XCTAssertEqual(UIColor.darkGray.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 0.6666666666666667))
        XCTAssertEqual(UIColor.gray.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 0.5))
        XCTAssertEqual(UIColor.lightGray.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 0.33333333333333337))
        XCTAssertEqual(UIColor.clear.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 1.0))
    }

    func testCMYKInit() {
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 0.0)), .white)
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 0.0, magenta: 1.0, yellow: 1.0, black: 0.0)), .red)
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 1.0, magenta: 0.0, yellow: 1.0, black: 0.0)), .green)
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 1.0, magenta: 1.0, yellow: 0.0, black: 0.0)), .blue)
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 1.0, magenta: 0.0, yellow: 0.0, black: 0.0)), .cyan)
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 0.0, magenta: 1.0, yellow: 0.0, black: 0.0)), .magenta)
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 0.0, magenta: 0.0, yellow: 1.0, black: 0.0)), .yellow)
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 1.0)), .black)
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 2.0/3.0)), .darkGray)
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 0.5)), .gray)
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 1.0/3.0)), .lightGray)
        XCTAssertEqual(UIColor(cmyk: CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 1.0), alpha: 0.0), .clear)
    }

}
