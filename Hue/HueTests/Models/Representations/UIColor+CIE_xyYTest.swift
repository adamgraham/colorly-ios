//
//  UIColor+CIE_xyYTest.swift
//  HueTests
//
//  Created by Adam Graham on 5/11/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_CIExyYTest: XCTestCase {

    typealias CIE_xyY = UIColor.CIE_xyY

    private let accuracy: CGFloat = 0.0001

    func testCIExyY() {
        assert(UIColor.white.xyY, CIE_xyY(x: 0.312727, y: 0.329023, Y: 100.000000))
        assert(UIColor.red.xyY, CIE_xyY(x: 0.640000, y: 0.330000, Y: 21.267290))
        assert(UIColor.green.xyY, CIE_xyY(x: 0.300000, y: 0.600000, Y: 71.515220))
        assert(UIColor.blue.xyY, CIE_xyY(x: 0.150000, y: 0.060000, Y: 7.217500))
        assert(UIColor.cyan.xyY, CIE_xyY(x: 0.224656, y: 0.328760, Y: 78.732720))
        assert(UIColor.magenta.xyY, CIE_xyY(x: 0.320938, y: 0.154190, Y: 28.484790))
        assert(UIColor.yellow.xyY, CIE_xyY(x: 0.419320, y: 0.505246, Y: 92.782510))
        assert(UIColor.black.xyY, CIE_xyY(x: 0.000000, y: 0.000000, Y: 0.000000))
        assert(UIColor.darkGray.xyY, CIE_xyY(x: 0.312727, y: 0.329023, Y: 9.084172))
        assert(UIColor.gray.xyY, CIE_xyY(x: 0.312727, y: 0.329023, Y: 21.404116))
        assert(UIColor.lightGray.xyY, CIE_xyY(x: 0.312727, y: 0.329023, Y: 40.197782))
        assert(UIColor.clear.xyY, CIE_xyY(x: 0.000000, y: 0.000000, Y: 0.000000))
    }

    func testCIExyYInit() {
        assert(UIColor(xyY: CIE_xyY(x: 0.312727, y: 0.329023, Y: 100.000000)), .white)
        assert(UIColor(xyY: CIE_xyY(x: 0.640000, y: 0.330000, Y: 21.267290)), .red)
        assert(UIColor(xyY: CIE_xyY(x: 0.300000, y: 0.600000, Y: 71.515220)), .green)
        assert(UIColor(xyY: CIE_xyY(x: 0.150000, y: 0.060000, Y: 7.217500)), .blue)
        assert(UIColor(xyY: CIE_xyY(x: 0.224656, y: 0.328760, Y: 78.732720)), .cyan)
        assert(UIColor(xyY: CIE_xyY(x: 0.320938, y: 0.154190, Y: 28.484790)), .magenta)
        assert(UIColor(xyY: CIE_xyY(x: 0.419320, y: 0.505246, Y: 92.782510)), .yellow)
        assert(UIColor(xyY: CIE_xyY(x: 0.000000, y: 0.000000, Y: 0.000000)), .black)
        assert(UIColor(xyY: CIE_xyY(x: 0.312727, y: 0.329023, Y: 9.084172)), .darkGray)
        assert(UIColor(xyY: CIE_xyY(x: 0.312727, y: 0.329023, Y: 21.404116)), .gray)
        assert(UIColor(xyY: CIE_xyY(x: 0.312727, y: 0.329023, Y: 40.197782)), .lightGray)
        assert(UIColor(xyY: CIE_xyY(x: 0.000000, y: 0.000000, Y: 0.000000), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ xyY: CIE_xyY, _ expected: CIE_xyY) {
        XCTAssertEqual(xyY.x, expected.x, accuracy: self.accuracy)
        XCTAssertEqual(xyY.y, expected.y, accuracy: self.accuracy)
        XCTAssertEqual(xyY.Y, expected.Y, accuracy: self.accuracy)
    }

}
