//
//  UIColor+CIE-xyYTest.swift
//  HueTests
//
//  Created by Adam Graham on 5/11/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_CIE_xyYTest: XCTestCase {

    typealias xyY = UIColor.CIE_xyY

    private let accuracy: CGFloat = 0.0001

    func testxyY() {
        assert(UIColor.white.xyY, xyY(x: 0.312727, y: 0.329023, Y: 100.000000))
        assert(UIColor.red.xyY, xyY(x: 0.640000, y: 0.330000, Y: 21.267290))
        assert(UIColor.green.xyY, xyY(x: 0.300000, y: 0.600000, Y: 71.515220))
        assert(UIColor.blue.xyY, xyY(x: 0.150000, y: 0.060000, Y: 7.217500))
        assert(UIColor.cyan.xyY, xyY(x: 0.224656, y: 0.328760, Y: 78.732720))
        assert(UIColor.magenta.xyY, xyY(x: 0.320938, y: 0.154190, Y: 28.484790))
        assert(UIColor.yellow.xyY, xyY(x: 0.419320, y: 0.505246, Y: 92.782510))
        assert(UIColor.black.xyY, xyY(x: 0.000000, y: 0.000000, Y: 0.000000))
        assert(UIColor.darkGray.xyY, xyY(x: 0.312727, y: 0.329023, Y: 9.084172))
        assert(UIColor.gray.xyY, xyY(x: 0.312727, y: 0.329023, Y: 21.404116))
        assert(UIColor.lightGray.xyY, xyY(x: 0.312727, y: 0.329023, Y: 40.197782))
        assert(UIColor.clear.xyY, xyY(x: 0.000000, y: 0.000000, Y: 0.000000))
    }

    func testxyYInit() {
        assert(UIColor(xyY: xyY(x: 0.312727, y: 0.329023, Y: 100.000000)), .white)
        assert(UIColor(xyY: xyY(x: 0.640000, y: 0.330000, Y: 21.267290)), .red)
        assert(UIColor(xyY: xyY(x: 0.300000, y: 0.600000, Y: 71.515220)), .green)
        assert(UIColor(xyY: xyY(x: 0.150000, y: 0.060000, Y: 7.217500)), .blue)
        assert(UIColor(xyY: xyY(x: 0.224656, y: 0.328760, Y: 78.732720)), .cyan)
        assert(UIColor(xyY: xyY(x: 0.320938, y: 0.154190, Y: 28.484790)), .magenta)
        assert(UIColor(xyY: xyY(x: 0.419320, y: 0.505246, Y: 92.782510)), .yellow)
        assert(UIColor(xyY: xyY(x: 0.000000, y: 0.000000, Y: 0.000000)), .black)
        assert(UIColor(xyY: xyY(x: 0.312727, y: 0.329023, Y: 9.084172)), .darkGray)
        assert(UIColor(xyY: xyY(x: 0.312727, y: 0.329023, Y: 21.404116)), .gray)
        assert(UIColor(xyY: xyY(x: 0.312727, y: 0.329023, Y: 40.197782)), .lightGray)
        assert(UIColor(xyY: xyY(x: 0.000000, y: 0.000000, Y: 0.000000), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ xyz: xyY, _ expected: xyY) {
        XCTAssertEqual(xyz.x, expected.x, accuracy: self.accuracy)
        XCTAssertEqual(xyz.y, expected.y, accuracy: self.accuracy)
        XCTAssertEqual(xyz.Y, expected.Y, accuracy: self.accuracy)
    }

}
