//
//  UIColor+HSBTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HSBTest: XCTestCase {

    typealias HSB = UIColor.HSB

    private let accuracy: CGFloat = .ulpOfOne * 100.0

    func testHSB() {
        assert(UIColor.white.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 100.0))
        assert(UIColor.red.hsb, HSB(hue: 0.0, saturation: 100.0, brightness: 100.0))
        assert(UIColor.green.hsb, HSB(hue: 120.0, saturation: 100.0, brightness: 100.0))
        assert(UIColor.blue.hsb, HSB(hue: 240.0, saturation: 100.0, brightness: 100.0))
        assert(UIColor.cyan.hsb, HSB(hue: 180.0, saturation: 100.0, brightness: 100.0))
        assert(UIColor.magenta.hsb, HSB(hue: 300.0, saturation: 100.0, brightness: 100.0))
        assert(UIColor.yellow.hsb, HSB(hue: 60.0, saturation: 100.0, brightness: 100.0))
        assert(UIColor.black.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 0.0))
        assert(UIColor.darkGray.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 100.0/3.0))
        assert(UIColor.gray.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 50.0))
        assert(UIColor.lightGray.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 200.0/3.0))
        assert(UIColor.clear.hsb, HSB(hue: 0.0, saturation: 0.0, brightness: 0.0))
    }

    func testHSBInit() {
        assert(UIColor(HSB(hue: 0.0, saturation: 0.0, brightness: 100.0)), .white)
        assert(UIColor(HSB(hue: 0.0, saturation: 100.0, brightness: 100.0)), .red)
        assert(UIColor(HSB(hue: 120.0, saturation: 100.0, brightness: 100.0)), .green)
        assert(UIColor(HSB(hue: 240.0, saturation: 100.0, brightness: 100.0)), .blue)
        assert(UIColor(HSB(hue: 180.0, saturation: 100.0, brightness: 100.0)), .cyan)
        assert(UIColor(HSB(hue: 300.0, saturation: 100.0, brightness: 100.0)), .magenta)
        assert(UIColor(HSB(hue: 60.0, saturation: 100.0, brightness: 100.0)), .yellow)
        assert(UIColor(HSB(hue: 0.0, saturation: 0.0, brightness: 0.0)), .black)
        assert(UIColor(HSB(hue: 0.0, saturation: 0.0, brightness: 100.0/3.0)), .darkGray)
        assert(UIColor(HSB(hue: 0.0, saturation: 0.0, brightness: 50.0)), .gray)
        assert(UIColor(HSB(hue: 0.0, saturation: 0.0, brightness: 200.0/3.0)), .lightGray)
        assert(UIColor(HSB(hue: 0.0, saturation: 0.0, brightness: 0.0), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ hsb: HSB, _ expected: HSB) {
        XCTAssertEqual(hsb.hue, expected.hue, accuracy: self.accuracy)
        XCTAssertEqual(hsb.saturation, expected.saturation, accuracy: self.accuracy)
        XCTAssertEqual(hsb.brightness, expected.brightness, accuracy: self.accuracy)
    }

}
