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

    private let accuracy: CGFloat = 0.0001 // XYZ to RGB is not very accurate

    func testXYZ() {
        assert(UIColor.white.xyz, XYZ(x: 95.047, y: 100.0, z: 108.883))
        assert(UIColor.red.xyz, XYZ(x: 41.24564, y: 21.26729, z: 1.93339))
        assert(UIColor.green.xyz, XYZ(x: 35.75761, y: 71.51522, z: 11.9192))
        assert(UIColor.blue.xyz, XYZ(x: 18.04375, y: 7.2175, z: 95.03041))
        assert(UIColor.cyan.xyz, XYZ(x: 53.80136, y: 78.73272, z: 106.94961))
        assert(UIColor.magenta.xyz, XYZ(x: 59.28939, y: 28.48479, z: 96.9638))
        assert(UIColor.yellow.xyz, XYZ(x: 77.00325, y: 92.78251, z: 13.85259))
        assert(UIColor.black.xyz, XYZ(x: 0.0, y: 0.0, z: 0.0))
        assert(UIColor.darkGray.xyz, XYZ(x: 8.63423, y: 9.08417, z: 9.89112))
        assert(UIColor.gray.xyz, XYZ(x: 20.34397, y: 21.40412, z: 23.30544))
        assert(UIColor.lightGray.xyz, XYZ(x: 38.20678, y: 40.19778, z: 43.76855))
        assert(UIColor.clear.xyz, XYZ(x: 0.0, y: 0.0, z: 0.0))
    }

    func testXYZInit() {
        assert(UIColor(xyz: XYZ(x: 95.047, y: 100.0, z: 108.883)), .white)
        assert(UIColor(xyz: XYZ(x: 41.24564, y: 21.26729, z: 1.93339)), .red)
        assert(UIColor(xyz: XYZ(x: 35.75761, y: 71.51522, z: 11.9192)), .green)
        assert(UIColor(xyz: XYZ(x: 18.04375, y: 7.2175, z: 95.03041)), .blue)
        assert(UIColor(xyz: XYZ(x: 53.80136, y: 78.73272, z: 106.94961)), .cyan)
        assert(UIColor(xyz: XYZ(x: 59.28939, y: 28.48479, z: 96.9638)), .magenta)
        assert(UIColor(xyz: XYZ(x: 77.00325, y: 92.78251, z: 13.85259)), .yellow)
        assert(UIColor(xyz: XYZ(x: 0.0, y: 0.0, z: 0.0)), .black)
        assert(UIColor(xyz: XYZ(x: 8.63423, y: 9.08417, z: 9.89112)), .darkGray)
        assert(UIColor(xyz: XYZ(x: 20.34397, y: 21.40412, z: 23.30544)), .gray)
        assert(UIColor(xyz: XYZ(x: 38.20678, y: 40.19778, z: 43.76855)), .lightGray)
        assert(UIColor(xyz: XYZ(x: 0.0, y: 0.0, z: 0.0), alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ xyz: XYZ, _ expected: XYZ) {
        XCTAssertEqual(xyz.x, expected.x, accuracy: self.accuracy)
        XCTAssertEqual(xyz.y, expected.y, accuracy: self.accuracy)
        XCTAssertEqual(xyz.z, expected.z, accuracy: self.accuracy)
    }

}
