//
//  UIColor+CIELABTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_CIELABTest: XCTestCase {

    typealias CIELAB = UIColor.CIELAB

    private let accuracy: CGFloat = 0.0001

    func testCIELAB() {
        assert(UIColor.white.Lab, CIELAB(L: 100.00000, a: 0.00000, b: 0.00000))
        assert(UIColor.red.Lab, CIELAB(L: 53.24079, a: 80.09246, b: 67.2032))
        assert(UIColor.green.Lab, CIELAB(L: 87.73472, a: -86.18272, b: 83.17932))
        assert(UIColor.blue.Lab, CIELAB(L: 32.29701, a: 79.18752, b: -107.86016))
        assert(UIColor.cyan.Lab, CIELAB(L: 91.11322, a: -48.08753, b: -14.13119))
        assert(UIColor.magenta.Lab, CIELAB(L: 60.32421, a: 98.23431, b: -60.82489))
        assert(UIColor.yellow.Lab, CIELAB(L: 97.13927, a: -21.55375, b: 94.47798))
        assert(UIColor.black.Lab, CIELAB(L: 0.00000, a: 0.00000, b: 0.00000))
        assert(UIColor.darkGray.Lab, CIELAB(L: 36.14585, a: 0.00000, b: 0.00000))
        assert(UIColor.gray.Lab, CIELAB(L: 53.38897, a: 0.00000, b: 0.00000))
        assert(UIColor.lightGray.Lab, CIELAB(L: 69.61017, a: 0.00000, b: 0.00000))
        assert(UIColor.clear.Lab, CIELAB(L: 0.00000, a: 0.00000, b: 0.00000))
    }

    func testCIELABInit() {
        assert(UIColor(CIELAB(L: 100.00000, a: 0.00000, b: 0.00000)), .white)
        assert(UIColor(CIELAB(L: 53.24079, a: 80.09246, b: 67.2032)), .red)
        assert(UIColor(CIELAB(L: 87.73472, a: -86.18272, b: 83.17932)), .green)
        assert(UIColor(CIELAB(L: 32.29701, a: 79.18752, b: -107.86016)), .blue)
        assert(UIColor(CIELAB(L: 91.11322, a: -48.08753, b: -14.13119)), .cyan)
        assert(UIColor(CIELAB(L: 60.32421, a: 98.23431, b: -60.82489)), .magenta)
        assert(UIColor(CIELAB(L: 97.13927, a: -21.55375, b: 94.47798)), .yellow)
        assert(UIColor(CIELAB(L: 0.00000, a: 0.00000, b: 0.00000)), .black)
        assert(UIColor(CIELAB(L: 36.14585, a: 0.00000, b: 0.00000)), .darkGray)
        assert(UIColor(CIELAB(L: 53.38897, a: 0.00000, b: 0.00000)), .gray)
        assert(UIColor(CIELAB(L: 69.61017, a: 0.00000, b: 0.00000)), .lightGray)
        assert(UIColor(CIELAB(L: 0.00000, a: 0.00000, b: 0.00000), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ Lab: CIELAB, _ expected: CIELAB) {
        XCTAssertEqual(Lab.L, expected.L, accuracy: self.accuracy)
        XCTAssertEqual(Lab.a, expected.a, accuracy: self.accuracy)
        XCTAssertEqual(Lab.b, expected.b, accuracy: self.accuracy)
    }

}
