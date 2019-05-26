//
//  UIColor+HSITest.swift
//  HueTests
//
//  Created by Adam Graham on 5/26/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HSITest: XCTestCase {

    typealias HSI = UIColor.HSI

    private let accuracy: CGFloat = .ulpOfOne * 100.0

    func testHSI() {
        assert(UIColor.white.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 100.0))
        assert(UIColor.red.hsi, HSI(hue: 0.0, saturation: 100.0, intensity: 100.0/3.0))
        assert(UIColor.green.hsi, HSI(hue: 120.0, saturation: 100.0, intensity: 100.0/3.0))
        assert(UIColor.blue.hsi, HSI(hue: 240.0, saturation: 100.0, intensity: 100.0/3.0))
        assert(UIColor.cyan.hsi, HSI(hue: 180.0, saturation: 100.0, intensity: 200.0/3.0))
        assert(UIColor.magenta.hsi, HSI(hue: 300.0, saturation: 100.0, intensity: 200.0/3.0))
        assert(UIColor.yellow.hsi, HSI(hue: 60.0, saturation: 100.0, intensity: 200.0/3.0))
        assert(UIColor.black.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 0.0))
        assert(UIColor.darkGray.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 100.0/3.0))
        assert(UIColor.gray.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 50.0))
        assert(UIColor.lightGray.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 200.0/3.0))
        assert(UIColor.clear.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 0.0))
    }

    func testHSIInit() {
        assert(UIColor(HSI(hue: 0.0, saturation: 0.0, intensity: 100.0)), .white)
        assert(UIColor(HSI(hue: 0.0, saturation: 100.0, intensity: 100.0/3.0)), .red)
        assert(UIColor(HSI(hue: 120.0, saturation: 100.0, intensity: 100.0/3.0)), .green)
        assert(UIColor(HSI(hue: 240.0, saturation: 100.0, intensity: 100.0/3.0)), .blue)
        assert(UIColor(HSI(hue: 180.0, saturation: 100.0, intensity: 200.0/3.0)), .cyan)
        assert(UIColor(HSI(hue: 300.0, saturation: 100.0, intensity: 200.0/3.0)), .magenta)
        assert(UIColor(HSI(hue: 60.0, saturation: 100.0, intensity: 200.0/3.0)), .yellow)
        assert(UIColor(HSI(hue: 0.0, saturation: 0.0, intensity: 0.0)), .black)
        assert(UIColor(HSI(hue: 0.0, saturation: 0.0, intensity: 100.0/3.0)), .darkGray)
        assert(UIColor(HSI(hue: 0.0, saturation: 0.0, intensity: 50.0)), .gray)
        assert(UIColor(HSI(hue: 0.0, saturation: 0.0, intensity: 200.0/3.0)), .lightGray)
        assert(UIColor(HSI(hue: 0.0, saturation: 0.0, intensity: 0.0), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ hsi: HSI, _ expected: HSI) {
        XCTAssertEqual(hsi.hue, expected.hue, accuracy: self.accuracy)
        XCTAssertEqual(hsi.saturation, expected.saturation, accuracy: self.accuracy)
        XCTAssertEqual(hsi.intensity, expected.intensity, accuracy: self.accuracy)
    }

}
