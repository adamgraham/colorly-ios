//
//  UIColor+CIE-XYZTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_CIE_XYZTest: XCTestCase {

    typealias XYZ = UIColor.CIE_XYZ

    private let accuracy: CGFloat = 0.0001

    func testXYZ() {
        assert(UIColor.white.XYZ, XYZ(X: 95.047, Y: 100.0, Z: 108.883))
        assert(UIColor.red.XYZ, XYZ(X: 41.24564, Y: 21.26729, Z: 1.93339))
        assert(UIColor.green.XYZ, XYZ(X: 35.75761, Y: 71.51522, Z: 11.9192))
        assert(UIColor.blue.XYZ, XYZ(X: 18.04375, Y: 7.2175, Z: 95.03041))
        assert(UIColor.cyan.XYZ, XYZ(X: 53.80136, Y: 78.73272, Z: 106.94961))
        assert(UIColor.magenta.XYZ, XYZ(X: 59.28939, Y: 28.48479, Z: 96.9638))
        assert(UIColor.yellow.XYZ, XYZ(X: 77.00325, Y: 92.78251, Z: 13.85259))
        assert(UIColor.black.XYZ, XYZ(X: 0.0, Y: 0.0, Z: 0.0))
        assert(UIColor.darkGray.XYZ, XYZ(X: 8.63423, Y: 9.08417, Z: 9.89112))
        assert(UIColor.gray.XYZ, XYZ(X: 20.34397, Y: 21.40412, Z: 23.30544))
        assert(UIColor.lightGray.XYZ, XYZ(X: 38.20678, Y: 40.19778, Z: 43.76855))
        assert(UIColor.clear.XYZ, XYZ(X: 0.0, Y: 0.0, Z: 0.0))
    }

    func testXYZInit() {
        assert(UIColor(XYZ: XYZ(X: 95.047, Y: 100.0, Z: 108.883)), .white)
        assert(UIColor(XYZ: XYZ(X: 41.24564, Y: 21.26729, Z: 1.93339)), .red)
        assert(UIColor(XYZ: XYZ(X: 35.75761, Y: 71.51522, Z: 11.9192)), .green)
        assert(UIColor(XYZ: XYZ(X: 18.04375, Y: 7.2175, Z: 95.03041)), .blue)
        assert(UIColor(XYZ: XYZ(X: 53.80136, Y: 78.73272, Z: 106.94961)), .cyan)
        assert(UIColor(XYZ: XYZ(X: 59.28939, Y: 28.48479, Z: 96.9638)), .magenta)
        assert(UIColor(XYZ: XYZ(X: 77.00325, Y: 92.78251, Z: 13.85259)), .yellow)
        assert(UIColor(XYZ: XYZ(X: 0.0, Y: 0.0, Z: 0.0)), .black)
        assert(UIColor(XYZ: XYZ(X: 8.63423, Y: 9.08417, Z: 9.89112)), .darkGray)
        assert(UIColor(XYZ: XYZ(X: 20.34397, Y: 21.40412, Z: 23.30544)), .gray)
        assert(UIColor(XYZ: XYZ(X: 38.20678, Y: 40.19778, Z: 43.76855)), .lightGray)
        assert(UIColor(XYZ: XYZ(X: 0.0, Y: 0.0, Z: 0.0), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ xyz: XYZ, _ expected: XYZ) {
        XCTAssertEqual(xyz.X, expected.X, accuracy: self.accuracy)
        XCTAssertEqual(xyz.Y, expected.Y, accuracy: self.accuracy)
        XCTAssertEqual(xyz.Z, expected.Z, accuracy: self.accuracy)
    }

}
