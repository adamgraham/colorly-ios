//
//  UIColor+CIE-LABTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_CIE_LABTest: XCTestCase {

    typealias LAB = UIColor.CIE_LAB

    private let accuracy: CGFloat = 0.0001

    func testLAB() {
        assert(UIColor.white.lab, LAB(L: 100.0, a: 0.0, b: 0.0))
        assert(UIColor.red.lab, LAB(L: 53.24079, a: 80.09246, b: 67.2032))
        assert(UIColor.green.lab, LAB(L: 87.73472, a: -86.18272, b: 83.17932))
        assert(UIColor.blue.lab, LAB(L: 32.29701, a: 79.18752, b: -107.86016))
        assert(UIColor.cyan.lab, LAB(L: 91.11322, a: -48.08753, b: -14.13119))
        assert(UIColor.magenta.lab, LAB(L: 60.32421, a: 98.23431, b: -60.82489))
        assert(UIColor.yellow.lab, LAB(L: 97.13927, a: -21.55375, b: 94.47798))
        assert(UIColor.black.lab, LAB(L: 0.0, a: 0.0, b: 0.0))
        assert(UIColor.darkGray.lab, LAB(L: 36.14585, a: 0.0, b: 0.0))
        assert(UIColor.gray.lab, LAB(L: 53.38897, a: 0.0, b: 0.0))
        assert(UIColor.lightGray.lab, LAB(L: 69.61017, a: 0.0, b: 0.0))
        assert(UIColor.clear.lab, LAB(L: 0.0, a: 0.0, b: 0.0))
    }

    func testLABInit() {
        assert(UIColor(lab: LAB(L: 100.0, a: 0.0, b: 0.0)), .white)
        assert(UIColor(lab: LAB(L: 53.24079, a: 80.09246, b: 67.2032)), .red)
        assert(UIColor(lab: LAB(L: 87.73472, a: -86.18272, b: 83.17932)), .green)
        assert(UIColor(lab: LAB(L: 32.29701, a: 79.18752, b: -107.86016)), .blue)
        assert(UIColor(lab: LAB(L: 91.11322, a: -48.08753, b: -14.13119)), .cyan)
        assert(UIColor(lab: LAB(L: 60.32421, a: 98.23431, b: -60.82489)), .magenta)
        assert(UIColor(lab: LAB(L: 97.13927, a: -21.55375, b: 94.47798)), .yellow)
        assert(UIColor(lab: LAB(L: 0.0, a: 0.0, b: 0.0)), .black)
        assert(UIColor(lab: LAB(L: 36.14585, a: 0.0, b: 0.0)), .darkGray)
        assert(UIColor(lab: LAB(L: 53.38897, a: 0.0, b: 0.0)), .gray)
        assert(UIColor(lab: LAB(L: 69.61017, a: 0.0, b: 0.0)), .lightGray)
        assert(UIColor(lab: LAB(L: 0.0, a: 0.0, b: 0.0), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ lab: LAB, _ expected: LAB) {
        XCTAssertEqual(lab.L, expected.L, accuracy: self.accuracy)
        XCTAssertEqual(lab.a, expected.a, accuracy: self.accuracy)
        XCTAssertEqual(lab.b, expected.b, accuracy: self.accuracy)
    }

}
