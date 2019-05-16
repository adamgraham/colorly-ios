//
//  UIColor+CIE_LUVTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_CIELUVTest: XCTestCase {

    typealias CIE_LUV = UIColor.CIE_LUV

    private let accuracy: CGFloat = 0.0001

    func testCIELUV() {
        assert(UIColor.white.Luv, CIE_LUV(L: 100.00000, u: 0.00000, v: 0.00000))
        assert(UIColor.red.Luv, CIE_LUV(L: 53.24079, u: 175.01503, v: 37.75643))
        assert(UIColor.green.Luv, CIE_LUV(L: 87.73472, u: -83.07756, v: 107.39854))
        assert(UIColor.blue.Luv, CIE_LUV(L: 32.29701, u: -9.40540, v: -130.34235))
        assert(UIColor.cyan.Luv, CIE_LUV(L: 91.11322, u: -70.47734, v: -15.20423))
        assert(UIColor.magenta.Luv, CIE_LUV(L: 60.32421, u: 84.07140, v: -108.68334))
        assert(UIColor.yellow.Luv, CIE_LUV(L: 97.13927, u: 7.70561, v: 106.78663))
        assert(UIColor.black.Luv, CIE_LUV(L: 0.00000, u: 0.00000, v: 0.00000))
        assert(UIColor.darkGray.Luv, CIE_LUV(L: 36.14585, u: 0.00000, v: 0.00000))
        assert(UIColor.gray.Luv, CIE_LUV(L: 53.38897, u: 0.00000, v: 0.00000))
        assert(UIColor.lightGray.Luv, CIE_LUV(L: 69.61017, u: 0.00000, v: 0.00000))
        assert(UIColor.clear.Luv, CIE_LUV(L: 0.00000, u: 0.00000, v: 0.00000))
    }

    func testCIELUVInit() {
        assert(UIColor(Luv: CIE_LUV(L: 100.00000, u: 0.00000, v: 0.00000)), .white)
        assert(UIColor(Luv: CIE_LUV(L: 53.24079, u: 175.01503, v: 37.75643)), .red)
        assert(UIColor(Luv: CIE_LUV(L: 87.73472, u: -83.07756, v: 107.39854)), .green)
        assert(UIColor(Luv: CIE_LUV(L: 32.29701, u: -9.40540, v: -130.34235)), .blue)
        assert(UIColor(Luv: CIE_LUV(L: 91.11322, u: -70.47734, v: -15.20423)), .cyan)
        assert(UIColor(Luv: CIE_LUV(L: 60.32421, u: 84.07140, v: -108.68334)), .magenta)
        assert(UIColor(Luv: CIE_LUV(L: 97.13927, u: 7.70561, v: 106.78663)), .yellow)
        assert(UIColor(Luv: CIE_LUV(L: 0.00000, u: 0.00000, v: 0.00000)), .black)
        assert(UIColor(Luv: CIE_LUV(L: 36.14585, u: 0.00000, v: 0.00000)), .darkGray)
        assert(UIColor(Luv: CIE_LUV(L: 53.38897, u: 0.00000, v: 0.00000)), .gray)
        assert(UIColor(Luv: CIE_LUV(L: 69.61017, u: 0.00000, v: 0.00000)), .lightGray)
        assert(UIColor(Luv: CIE_LUV(L: 0.00000, u: 0.00000, v: 0.00000), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ Lab: CIE_LUV, _ expected: CIE_LUV) {
        XCTAssertEqual(Lab.L, expected.L, accuracy: self.accuracy)
        XCTAssertEqual(Lab.u, expected.u, accuracy: self.accuracy)
        XCTAssertEqual(Lab.v, expected.v, accuracy: self.accuracy)
    }

}
