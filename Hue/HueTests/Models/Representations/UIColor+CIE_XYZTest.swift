//
//  UIColor+CIE_XYZTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_CIEXYZTest: XCTestCase {

    typealias CIE_XYZ = UIColor.CIE_XYZ

    private let accuracy: CGFloat = 0.0001

    func testCIEXYZ() {
        assert(UIColor.white.XYZ, CIE_XYZ(X: 95.04700, Y: 100.00000, Z: 108.88300))
        assert(UIColor.red.XYZ, CIE_XYZ(X: 41.24564, Y: 21.26729, Z: 1.93339))
        assert(UIColor.green.XYZ, CIE_XYZ(X: 35.75761, Y: 71.51522, Z: 11.91920))
        assert(UIColor.blue.XYZ, CIE_XYZ(X: 18.04375, Y: 7.21750, Z: 95.03041))
        assert(UIColor.cyan.XYZ, CIE_XYZ(X: 53.80136, Y: 78.73272, Z: 106.94961))
        assert(UIColor.magenta.XYZ, CIE_XYZ(X: 59.28939, Y: 28.48479, Z: 96.96380))
        assert(UIColor.yellow.XYZ, CIE_XYZ(X: 77.00325, Y: 92.78251, Z: 13.85259))
        assert(UIColor.black.XYZ, CIE_XYZ(X: 0.00000, Y: 0.00000, Z: 0.00000))
        assert(UIColor.darkGray.XYZ, CIE_XYZ(X: 8.63423, Y: 9.08417, Z: 9.89112))
        assert(UIColor.gray.XYZ, CIE_XYZ(X: 20.34397, Y: 21.40412, Z: 23.30544))
        assert(UIColor.lightGray.XYZ, CIE_XYZ(X: 38.20678, Y: 40.19778, Z: 43.76855))
        assert(UIColor.clear.XYZ, CIE_XYZ(X: 0.00000, Y: 0.00000, Z: 0.00000))
    }

    func testCIEXYZInit() {
        assert(UIColor(XYZ: CIE_XYZ(X: 95.04700, Y: 100.00000, Z: 108.88300)), .white)
        assert(UIColor(XYZ: CIE_XYZ(X: 41.24564, Y: 21.26729, Z: 1.93339)), .red)
        assert(UIColor(XYZ: CIE_XYZ(X: 35.75761, Y: 71.51522, Z: 11.91920)), .green)
        assert(UIColor(XYZ: CIE_XYZ(X: 18.04375, Y: 7.21750, Z: 95.03041)), .blue)
        assert(UIColor(XYZ: CIE_XYZ(X: 53.80136, Y: 78.73272, Z: 106.94961)), .cyan)
        assert(UIColor(XYZ: CIE_XYZ(X: 59.28939, Y: 28.48479, Z: 96.96380)), .magenta)
        assert(UIColor(XYZ: CIE_XYZ(X: 77.00325, Y: 92.78251, Z: 13.85259)), .yellow)
        assert(UIColor(XYZ: CIE_XYZ(X: 0.00000, Y: 0.00000, Z: 0.00000)), .black)
        assert(UIColor(XYZ: CIE_XYZ(X: 8.63423, Y: 9.08417, Z: 9.89112)), .darkGray)
        assert(UIColor(XYZ: CIE_XYZ(X: 20.34397, Y: 21.40412, Z: 23.30544)), .gray)
        assert(UIColor(XYZ: CIE_XYZ(X: 38.20678, Y: 40.19778, Z: 43.76855)), .lightGray)
        assert(UIColor(XYZ: CIE_XYZ(X: 0.00000, Y: 0.00000, Z: 0.00000), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ XYZ: CIE_XYZ, _ expected: CIE_XYZ) {
        XCTAssertEqual(XYZ.X, expected.X, accuracy: self.accuracy)
        XCTAssertEqual(XYZ.Y, expected.Y, accuracy: self.accuracy)
        XCTAssertEqual(XYZ.Z, expected.Z, accuracy: self.accuracy)
    }

}
