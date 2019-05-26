//
//  UIColor+HSVTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HSVTest: XCTestCase {

    typealias HSV = UIColor.HSV

    private let accuracy: CGFloat = .ulpOfOne * 100.0

    func testHSV() {
        assert(UIColor.white.hsv, HSV(hue: 0.0, saturation: 0.0, value: 100.0))
        assert(UIColor.red.hsv, HSV(hue: 0.0, saturation: 100.0, value: 100.0))
        assert(UIColor.green.hsv, HSV(hue: 120.0, saturation: 100.0, value: 100.0))
        assert(UIColor.blue.hsv, HSV(hue: 240.0, saturation: 100.0, value: 100.0))
        assert(UIColor.cyan.hsv, HSV(hue: 180.0, saturation: 100.0, value: 100.0))
        assert(UIColor.magenta.hsv, HSV(hue: 300.0, saturation: 100.0, value: 100.0))
        assert(UIColor.yellow.hsv, HSV(hue: 60.0, saturation: 100.0, value: 100.0))
        assert(UIColor.black.hsv, HSV(hue: 0.0, saturation: 0.0, value: 0.0))
        assert(UIColor.darkGray.hsv, HSV(hue: 0.0, saturation: 0.0, value: 100.0/3.0))
        assert(UIColor.gray.hsv, HSV(hue: 0.0, saturation: 0.0, value: 50.0))
        assert(UIColor.lightGray.hsv, HSV(hue: 0.0, saturation: 0.0, value: 200.0/3.0))
        assert(UIColor.clear.hsv, HSV(hue: 0.0, saturation: 0.0, value: 0.0))
    }

    func testHSVInit() {
        assert(UIColor(HSV(hue: 0.0, saturation: 0.0, value: 100.0)), .white)
        assert(UIColor(HSV(hue: 0.0, saturation: 100.0, value: 100.0)), .red)
        assert(UIColor(HSV(hue: 120.0, saturation: 100.0, value: 100.0)), .green)
        assert(UIColor(HSV(hue: 240.0, saturation: 100.0, value: 100.0)), .blue)
        assert(UIColor(HSV(hue: 180.0, saturation: 100.0, value: 100.0)), .cyan)
        assert(UIColor(HSV(hue: 300.0, saturation: 100.0, value: 100.0)), .magenta)
        assert(UIColor(HSV(hue: 60.0, saturation: 100.0, value: 100.0)), .yellow)
        assert(UIColor(HSV(hue: 0.0, saturation: 0.0, value: 0.0)), .black)
        assert(UIColor(HSV(hue: 0.0, saturation: 0.0, value: 100.0/3.0)), .darkGray)
        assert(UIColor(HSV(hue: 0.0, saturation: 0.0, value: 50.0)), .gray)
        assert(UIColor(HSV(hue: 0.0, saturation: 0.0, value: 200.0/3.0)), .lightGray)
        assert(UIColor(HSV(hue: 0.0, saturation: 0.0, value: 0.0), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ hsv: HSV, _ expected: HSV) {
        XCTAssertEqual(hsv.hue, expected.hue, accuracy: self.accuracy)
        XCTAssertEqual(hsv.saturation, expected.saturation, accuracy: self.accuracy)
        XCTAssertEqual(hsv.value, expected.value, accuracy: self.accuracy)
    }

}
