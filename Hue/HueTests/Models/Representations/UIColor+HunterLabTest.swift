//
//  UIColor+HunterLabTest.swift
//  HueTests
//
//  Created by Adam Graham on 5/12/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HunterLabTest: XCTestCase {

    typealias HunterLab = UIColor.HunterLab

    private let accuracy: CGFloat = 0.0001

    func testHunterLab() {
        assert(UIColor.white.hunterLab, HunterLab(L: 100.00000, a: 0.00000, b: 0.00000))
        assert(UIColor.red.hunterLab, HunterLab(L: 46.11647, a: 82.69984, b: 28.33464))
        assert(UIColor.green.hunterLab, HunterLab(L: 84.56667, a: -69.07981, b: 48.01452))
        assert(UIColor.blue.hunterLab, HunterLab(L: 26.86541, a: 75.48825, b: -199.77815))
        assert(UIColor.cyan.hunterLab, HunterLab(L: 88.73146, a: -42.98167, b: -14.72638))
        assert(UIColor.magenta.hunterLab, HunterLab(L: 53.37114, a: 109.45704, b: -76.07908))
        assert(UIColor.yellow.hunterLab, HunterLab(L: 96.32368, a: -21.05426, b: 55.71965))
        assert(UIColor.black.hunterLab, HunterLab(L: 0.00000, a: 0.00000, b: 0.00000))
        assert(UIColor.darkGray.hunterLab, HunterLab(L: 30.13996, a: 0.00000, b: 0.00000))
        assert(UIColor.gray.hunterLab, HunterLab(L: 46.26458, a: 0.00000, b: 0.00000))
        assert(UIColor.lightGray.hunterLab, HunterLab(L: 63.40172, a: 0.00000, b: 0.00000))
        assert(UIColor.clear.hunterLab, HunterLab(L: 0.00000, a: 0.00000, b: 0.00000))
    }

    func testHunterLabInit() {
        assert(UIColor(hunterLab: HunterLab(L: 100.00000, a: 0.00000, b: 0.00000)), .white)
        assert(UIColor(hunterLab: HunterLab(L: 46.11647, a: 82.69984, b: 28.33464)), .red)
        assert(UIColor(hunterLab: HunterLab(L: 84.56667, a: -69.07981, b: 48.01452)), .green)
        assert(UIColor(hunterLab: HunterLab(L: 26.86541, a: 75.48825, b: -199.77815)), .blue)
        assert(UIColor(hunterLab: HunterLab(L: 88.73146, a: -42.98167, b: -14.72638)), .cyan)
        assert(UIColor(hunterLab: HunterLab(L: 53.37114, a: 109.45704, b: -76.07908)), .magenta)
        assert(UIColor(hunterLab: HunterLab(L: 96.32368, a: -21.05426, b: 55.71965)), .yellow)
        assert(UIColor(hunterLab: HunterLab(L: 0.00000, a: 0.00000, b: 0.00000)), .black)
        assert(UIColor(hunterLab: HunterLab(L: 30.13996, a: 0.00000, b: 0.00000)), .darkGray)
        assert(UIColor(hunterLab: HunterLab(L: 46.26458, a: 0.00000, b: 0.00000)), .gray)
        assert(UIColor(hunterLab: HunterLab(L: 63.40172, a: 0.00000, b: 0.00000)), .lightGray)
        assert(UIColor(hunterLab: HunterLab(L: 0.00000, a: 0.00000, b: 0.00000), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ Lab: HunterLab, _ expected: HunterLab) {
        XCTAssertEqual(Lab.L, expected.L, accuracy: self.accuracy)
        XCTAssertEqual(Lab.a, expected.a, accuracy: self.accuracy)
        XCTAssertEqual(Lab.b, expected.b, accuracy: self.accuracy)
    }

}
