//
//  UIColor+CMYKTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_CMYKTest: XCTestCase {

    typealias CMYK = UIColor.CMYK

    private let accuracy: CGFloat = .ulpOfOne * 100.0

    func testCMYK() {
        assert(UIColor.white.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 0.0))
        assert(UIColor.red.cmyk, CMYK(cyan: 0.0, magenta: 100.0, yellow: 100.0, black: 0.0))
        assert(UIColor.green.cmyk, CMYK(cyan: 100.0, magenta: 0.0, yellow: 100.0, black: 0.0))
        assert(UIColor.blue.cmyk, CMYK(cyan: 100.0, magenta: 100.0, yellow: 0.0, black: 0.0))
        assert(UIColor.cyan.cmyk, CMYK(cyan: 100.0, magenta: 0.0, yellow: 0.0, black: 0.0))
        assert(UIColor.magenta.cmyk, CMYK(cyan: 0.0, magenta: 100.0, yellow: 0.0, black: 0.0))
        assert(UIColor.yellow.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 100.0, black: 0.0))
        assert(UIColor.black.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 100.0))
        assert(UIColor.darkGray.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 200.0/3.0))
        assert(UIColor.gray.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 50.0))
        assert(UIColor.lightGray.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 100.0/3.0))
        assert(UIColor.clear.cmyk, CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 100.0))
    }

    func testCMYKInit() {
        assert(UIColor(CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 0.0)), .white)
        assert(UIColor(CMYK(cyan: 0.0, magenta: 100.0, yellow: 100.0, black: 0.0)), .red)
        assert(UIColor(CMYK(cyan: 100.0, magenta: 0.0, yellow: 100.0, black: 0.0)), .green)
        assert(UIColor(CMYK(cyan: 100.0, magenta: 100.0, yellow: 0.0, black: 0.0)), .blue)
        assert(UIColor(CMYK(cyan: 100.0, magenta: 0.0, yellow: 0.0, black: 0.0)), .cyan)
        assert(UIColor(CMYK(cyan: 0.0, magenta: 100.0, yellow: 0.0, black: 0.0)), .magenta)
        assert(UIColor(CMYK(cyan: 0.0, magenta: 0.0, yellow: 100.0, black: 0.0)), .yellow)
        assert(UIColor(CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 100.0)), .black)
        assert(UIColor(CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 200.0/3.0)), .darkGray)
        assert(UIColor(CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 50.0)), .gray)
        assert(UIColor(CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 100.0/3.0)), .lightGray)
        assert(UIColor(CMYK(cyan: 0.0, magenta: 0.0, yellow: 0.0, black: 100.0), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ cmyk: CMYK, _ expected: CMYK) {
        XCTAssertEqual(cmyk.cyan, expected.cyan, accuracy: self.accuracy)
        XCTAssertEqual(cmyk.magenta, expected.magenta, accuracy: self.accuracy)
        XCTAssertEqual(cmyk.yellow, expected.yellow, accuracy: self.accuracy)
        XCTAssertEqual(cmyk.black, expected.black, accuracy: self.accuracy)
    }

}
