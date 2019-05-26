//
//  UIColor+CIELChTest.swift
//  HueTests
//
//  Created by Adam Graham on 5/18/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_CIELChTest: XCTestCase {

    typealias CIELCh = UIColor.CIELCh

    private let accuracy: CGFloat = 0.0001

    func testCIELCh_ab() {
        assert(UIColor.white.LCh_ab, CIELCh(L: 100.00000, C: 0.00000, h: 0.00000))
        assert(UIColor.red.LCh_ab, CIELCh(L: 53.24079, C: 104.55177, h: 39.99901))
        assert(UIColor.green.LCh_ab, CIELCh(L: 87.73472, C: 119.77587, h: 136.01595))
        assert(UIColor.blue.LCh_ab, CIELCh(L: 32.29701, C: 133.80761, h: 306.28494))
        assert(UIColor.cyan.LCh_ab, CIELCh(L: 91.11322, C: 50.12086, h: 196.37616))
        assert(UIColor.magenta.LCh_ab, CIELCh(L: 60.32421, C: 115.54067, h: 328.23496))
        assert(UIColor.yellow.LCh_ab, CIELCh(L: 97.13927, C: 96.90538, h: 102.85124))
        assert(UIColor.black.LCh_ab, CIELCh(L: 0.00000, C: 0.00000, h: 0.00000))
        assert(UIColor.darkGray.LCh_ab, CIELCh(L: 36.14585, C: 0.00000, h: 0.00000))
        assert(UIColor.gray.LCh_ab, CIELCh(L: 53.38897, C: 0.00000, h: 0.00000))
        assert(UIColor.lightGray.LCh_ab, CIELCh(L: 69.61017, C: 0.00000, h: 0.00000))
        assert(UIColor.clear.LCh_ab, CIELCh(L: 0.00000, C: 0.00000, h: 0.00000))
    }

    func testCIELCh_ab_Init() {
        assert(UIColor(ab: CIELCh(L: 100.00000, C: 0.00000, h: 0.00000)), .white)
        assert(UIColor(ab: CIELCh(L: 53.24079, C: 104.55177, h: 39.99901)), .red)
        assert(UIColor(ab: CIELCh(L: 87.73472, C: 119.77587, h: 136.01595)), .green)
        assert(UIColor(ab: CIELCh(L: 32.29701, C: 133.80761, h: 306.28494)), .blue)
        assert(UIColor(ab: CIELCh(L: 91.11322, C: 50.12086, h: 196.37616)), .cyan)
        assert(UIColor(ab: CIELCh(L: 60.32421, C: 115.54067, h: 328.23496)), .magenta)
        assert(UIColor(ab: CIELCh(L: 97.13927, C: 96.90538, h: 102.85124)), .yellow)
        assert(UIColor(ab: CIELCh(L: 0.00000, C: 0.00000, h: 0.00000)), .black)
        assert(UIColor(ab: CIELCh(L: 36.14585, C: 0.00000, h: 0.00000)), .darkGray)
        assert(UIColor(ab: CIELCh(L: 53.38897, C: 0.00000, h: 0.00000)), .gray)
        assert(UIColor(ab: CIELCh(L: 69.61017, C: 0.00000, h: 0.00000)), .lightGray)
        assert(UIColor(ab: CIELCh(L: 0.00000, C: 0.00000, h: 0.00000), alpha: 0.0), .clear)
    }

    func testCIELCh_uv() {
        assert(UIColor.white.LCh_uv, CIELCh(L: 100.00000, C: 0.00000, h: 0.00000))
        assert(UIColor.red.LCh_uv, CIELCh(L: 53.24079, C: 179.04136, h: 12.17399))
        assert(UIColor.green.LCh_uv, CIELCh(L: 87.73472, C: 135.78044, h: 127.72355))
        assert(UIColor.blue.LCh_uv, CIELCh(L: 32.29701, C: 130.68125, h: 265.87273))
        assert(UIColor.cyan.LCh_uv, CIELCh(L: 91.11322, C: 72.09871, h: 192.17397))
        assert(UIColor.magenta.LCh_uv, CIELCh(L: 60.32421, C: 137.40476, h: 307.72355))
        assert(UIColor.yellow.LCh_uv, CIELCh(L: 97.13927, C: 107.06428, h: 85.87275))
        assert(UIColor.black.LCh_uv, CIELCh(L: 0.00000, C: 0.00000, h: 0.00000))
        assert(UIColor.darkGray.LCh_uv, CIELCh(L: 36.14585, C: 0.00000, h: 0.00000))
        assert(UIColor.gray.LCh_uv, CIELCh(L: 53.38897, C: 0.00000, h: 0.00000))
        assert(UIColor.lightGray.LCh_uv, CIELCh(L: 69.61017, C: 0.00000, h: 0.00000))
        assert(UIColor.clear.LCh_uv, CIELCh(L: 0.00000, C: 0.00000, h: 0.00000))
    }

    func testCIELCh_uv_Init() {
        assert(UIColor(uv: CIELCh(L: 100.00000, C: 0.00000, h: 247.099)), .white)
        assert(UIColor(uv: CIELCh(L: 53.24079, C: 179.04136, h: 12.17399)), .red)
        assert(UIColor(uv: CIELCh(L: 87.73472, C: 135.78044, h: 127.72355)), .green)
        assert(UIColor(uv: CIELCh(L: 32.29701, C: 130.68125, h: 265.87273)), .blue)
        assert(UIColor(uv: CIELCh(L: 91.11322, C: 72.09871, h: 192.17397)), .cyan)
        assert(UIColor(uv: CIELCh(L: 60.32421, C: 137.40476, h: 307.72355)), .magenta)
        assert(UIColor(uv: CIELCh(L: 97.13927, C: 107.06428, h: 85.87275)), .yellow)
        assert(UIColor(uv: CIELCh(L: 0.00000, C: 0.00000, h: 0.00000)), .black)
        assert(UIColor(uv: CIELCh(L: 36.14585, C: 0.00000, h: 0.00000)), .darkGray)
        assert(UIColor(uv: CIELCh(L: 53.38897, C: 0.00000, h: 0.00000)), .gray)
        assert(UIColor(uv: CIELCh(L: 69.61017, C: 0.00000, h: 0.00000)), .lightGray)
        assert(UIColor(uv: CIELCh(L: 0.00000, C: 0.00000, h: 0.00000), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ LCh: CIELCh, _ expected: CIELCh) {
        XCTAssertEqual(LCh.L, expected.L, accuracy: self.accuracy)
        XCTAssertEqual(LCh.C, expected.C, accuracy: self.accuracy)
        XCTAssertEqual(LCh.h, expected.h, accuracy: self.accuracy)
    }

}
