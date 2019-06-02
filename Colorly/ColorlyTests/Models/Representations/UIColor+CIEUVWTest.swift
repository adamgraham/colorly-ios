//
//  UIColor+CIEUVWTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 6/1/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_CIEUVWTest: XCTestCase {

    typealias CIEUVW = UIColor.CIEUVW

    private let accuracy: CGFloat = 0.0001

    func testCIEUVW() {
        assert(UIColor.white.uvw, CIEUVW(U: 0.00000, V: 0.00000, W: 99.03972))
        assert(UIColor.red.uvw, CIEUVW(U: 171.80573, V: 24.70939, W: 52.26450))
        assert(UIColor.green.uvw, CIEUVW(U: -82.16428, V: 70.81193, W: 86.77024))
        assert(UIColor.blue.uvw, CIEUVW(U: -9.11900, V: -84.24890, W: 31.31355))
        assert(UIColor.cyan.uvw, CIEUVW(U: -69.73220, V: -10.02899, W: 90.14990))
        assert(UIColor.magenta.uvw, CIEUVW(U: 82.71416, V: -71.28585, W: 59.35035))
        assert(UIColor.yellow.uvw, CIEUVW(U: 7.62936, V: 70.48660, W: 96.17801))
        assert(UIColor.black.uvw, CIEUVW(U: 0.00000, V: 0.00000, W: -17.00000))
        assert(UIColor.darkGray.uvw, CIEUVW(U: 0.00000, V: 0.00000, W: 35.16371))
        assert(UIColor.gray.uvw, CIEUVW(U: 0.00000, V: 0.00000, W: 52.41273))
        assert(UIColor.lightGray.uvw, CIEUVW(U: 0.00000, V: 0.00000, W: 68.63948))
        assert(UIColor.clear.uvw, CIEUVW(U: 0.00000, V: 0.00000, W: -17.00000))
    }

    func testCIEUVWInit() {
        assert(UIColor(CIEUVW(U: 0.00000, V: 0.00000, W: 99.03972)), .white)
        assert(UIColor(CIEUVW(U: 171.80573, V: 24.70939, W: 52.26450)), .red)
        assert(UIColor(CIEUVW(U: -82.16428, V: 70.81193, W: 86.77024)), .green)
        assert(UIColor(CIEUVW(U: -9.11900, V: -84.24890, W: 31.31355)), .blue)
        assert(UIColor(CIEUVW(U: -69.73220, V: -10.02899, W: 90.14990)), .cyan)
        assert(UIColor(CIEUVW(U: 82.71416, V: -71.28585, W: 59.35035)), .magenta)
        assert(UIColor(CIEUVW(U: 7.62936, V: 70.48660, W: 96.17801)), .yellow)
        assert(UIColor(CIEUVW(U: 0.00000, V: 0.00000, W: -17.00000)), .black)
        assert(UIColor(CIEUVW(U: 0.00000, V: 0.00000, W: 35.16371)), .darkGray)
        assert(UIColor(CIEUVW(U: 0.00000, V: 0.00000, W: 52.41273)), .gray)
        assert(UIColor(CIEUVW(U: 0.00000, V: 0.00000, W: 68.63948)), .lightGray)
        assert(UIColor(CIEUVW(U: 0.00000, V: 0.00000, W: -17.00000), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ uvw: CIEUVW, _ expected: CIEUVW) {
        XCTAssertEqual(uvw.U, expected.U, accuracy: self.accuracy)
        XCTAssertEqual(uvw.V, expected.V, accuracy: self.accuracy)
        XCTAssertEqual(uvw.W, expected.W, accuracy: self.accuracy)
    }

}
