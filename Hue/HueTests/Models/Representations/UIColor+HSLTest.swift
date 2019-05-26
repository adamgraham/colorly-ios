//
//  UIColor+HSLTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HSLTest: XCTestCase {

    typealias HSL = UIColor.HSL

    private let accuracy: CGFloat = .ulpOfOne * 100.0

    func testHSL() {
        assert(UIColor.white.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 100.0))
        assert(UIColor.red.hsl, HSL(hue: 0.0, saturation: 100.0, lightness: 50.0))
        assert(UIColor.green.hsl, HSL(hue: 120.0, saturation: 100.0, lightness: 50.0))
        assert(UIColor.blue.hsl, HSL(hue: 240.0, saturation: 100.0, lightness: 50.0))
        assert(UIColor.cyan.hsl, HSL(hue: 180.0, saturation: 100.0, lightness: 50.0))
        assert(UIColor.magenta.hsl, HSL(hue: 300.0, saturation: 100.0, lightness: 50.0))
        assert(UIColor.yellow.hsl, HSL(hue: 60.0, saturation: 100.0, lightness: 50.0))
        assert(UIColor.black.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 0.0))
        assert(UIColor.darkGray.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 100.0/3.0))
        assert(UIColor.gray.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 50.0))
        assert(UIColor.lightGray.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 200.0/3.0))
        assert(UIColor.clear.hsl, HSL(hue: 0.0, saturation: 0.0, lightness: 0.0))
    }

    func testHSLInit() {
        assert(UIColor(HSL(hue: 0.0, saturation: 0.0, lightness: 100.0)), .white)
        assert(UIColor(HSL(hue: 0.0, saturation: 100.0, lightness: 50.0)), .red)
        assert(UIColor(HSL(hue: 120.0, saturation: 100.0, lightness: 50.0)), .green)
        assert(UIColor(HSL(hue: 240.0, saturation: 100.0, lightness: 50.0)), .blue)
        assert(UIColor(HSL(hue: 180.0, saturation: 100.0, lightness: 50.0)), .cyan)
        assert(UIColor(HSL(hue: 300.0, saturation: 100.0, lightness: 50.0)), .magenta)
        assert(UIColor(HSL(hue: 60.0, saturation: 100.0, lightness: 50.0)), .yellow)
        assert(UIColor(HSL(hue: 0.0, saturation: 0.0, lightness: 0.0)), .black)
        assert(UIColor(HSL(hue: 0.0, saturation: 0.0, lightness: 100.0/3.0)), .darkGray)
        assert(UIColor(HSL(hue: 0.0, saturation: 0.0, lightness: 50.0)), .gray)
        assert(UIColor(HSL(hue: 0.0, saturation: 0.0, lightness: 200.0/3.0)), .lightGray)
        assert(UIColor(HSL(hue: 0.0, saturation: 0.0, lightness: 0.0), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ hsl: HSL, _ expected: HSL) {
        XCTAssertEqual(hsl.hue, expected.hue, accuracy: self.accuracy)
        XCTAssertEqual(hsl.saturation, expected.saturation, accuracy: self.accuracy)
        XCTAssertEqual(hsl.lightness, expected.lightness, accuracy: self.accuracy)
    }

}
