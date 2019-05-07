//
//  UIColor+IlluminantTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_IlluminantTest: XCTestCase {

    func testTwoDegrees() {
        assert(UIColor.Illuminant.a.twoDegrees, (1.09850, 1.00000, 0.35585))
        assert(UIColor.Illuminant.b.twoDegrees, (0.99093, 1.00000, 0.85313))
        assert(UIColor.Illuminant.c.twoDegrees, (0.98074, 1.00000, 1.18232))
        assert(UIColor.Illuminant.d50.twoDegrees, (0.96422, 1.00000, 0.82521))
        assert(UIColor.Illuminant.d55.twoDegrees, (0.95682, 1.00000, 0.92149))
        assert(UIColor.Illuminant.d65.twoDegrees, (0.95047, 1.00000, 1.08883))
        assert(UIColor.Illuminant.d75.twoDegrees, (0.94972, 1.00000, 1.22638))
        assert(UIColor.Illuminant.e.twoDegrees, (1.00000, 1.00000, 1.00000))
        assert(UIColor.Illuminant.f1.twoDegrees, (0.92834, 1.00000, 1.03665))
        assert(UIColor.Illuminant.f2.twoDegrees, (0.99187, 1.00000, 0.67395))
        assert(UIColor.Illuminant.f3.twoDegrees, (1.03754, 1.00000, 0.49861))
        assert(UIColor.Illuminant.f4.twoDegrees, (1.09147, 1.00000, 0.38813))
        assert(UIColor.Illuminant.f5.twoDegrees, (0.90872, 1.00000, 0.98723))
        assert(UIColor.Illuminant.f6.twoDegrees, (0.97309, 1.00000, 0.60191))
        assert(UIColor.Illuminant.f7.twoDegrees, (0.95044, 1.00000, 1.08755))
        assert(UIColor.Illuminant.f8.twoDegrees, (0.96413, 1.00000, 0.82333))
        assert(UIColor.Illuminant.f9.twoDegrees, (1.00365, 1.00000, 0.67868))
        assert(UIColor.Illuminant.f10.twoDegrees, (0.96174, 1.00000, 0.81712))
        assert(UIColor.Illuminant.f11.twoDegrees, (1.00966, 1.00000, 0.64370))
        assert(UIColor.Illuminant.f12.twoDegrees, (1.08046, 1.00000, 0.39228))
    }

    func testTenDegrees() {
        assert(UIColor.Illuminant.a.tenDegrees, (1.11144, 1.00000, 0.35200))
        assert(UIColor.Illuminant.b.tenDegrees, (0.99178, 1.00000, 0.84349))
        assert(UIColor.Illuminant.c.tenDegrees, (0.97285, 1.00000, 1.16145))
        assert(UIColor.Illuminant.d50.tenDegrees, (0.96720, 1.00000, 0.81427))
        assert(UIColor.Illuminant.d55.tenDegrees, (0.95799, 1.00000, 0.90926))
        assert(UIColor.Illuminant.d65.tenDegrees, (0.94811, 1.00000, 1.07304))
        assert(UIColor.Illuminant.d75.tenDegrees, (0.94416, 1.00000, 1.20641))
        assert(UIColor.Illuminant.e.tenDegrees, (1.00000, 1.00000, 1.00000))
        assert(UIColor.Illuminant.f1.tenDegrees, (0.94791, 1.00000, 1.03191))
        assert(UIColor.Illuminant.f2.tenDegrees, (1.03280, 1.00000, 0.69026))
        assert(UIColor.Illuminant.f3.tenDegrees, (1.08968, 1.00000, 0.51965))
        assert(UIColor.Illuminant.f4.tenDegrees, (1.14961, 1.00000, 0.40963))
        assert(UIColor.Illuminant.f5.tenDegrees, (0.93369, 1.00000, 0.98636))
        assert(UIColor.Illuminant.f6.tenDegrees, (1.02148, 1.00000, 0.62074))
        assert(UIColor.Illuminant.f7.tenDegrees, (0.95792, 1.00000, 1.07687))
        assert(UIColor.Illuminant.f8.tenDegrees, (0.97115, 1.00000, 0.81135))
        assert(UIColor.Illuminant.f9.tenDegrees, (1.02116, 1.00000, 0.67826))
        assert(UIColor.Illuminant.f10.tenDegrees, (0.99001, 1.00000, 0.83134))
        assert(UIColor.Illuminant.f11.tenDegrees, (1.03866, 1.00000, 0.65627))
        assert(UIColor.Illuminant.f12.tenDegrees, (1.11428, 1.00000, 0.40353))
    }

    private func assert(_ xyz: (x: CGFloat, y: CGFloat, z: CGFloat), _ expected: (x: CGFloat, y: CGFloat, z: CGFloat)) {
        XCTAssertEqual(xyz.x, expected.x)
        XCTAssertEqual(xyz.y, expected.y)
        XCTAssertEqual(xyz.z, expected.z)
    }

}
