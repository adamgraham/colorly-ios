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

    private let accuracy: CGFloat = 0.0000000000001

    func testTwoDegreeObserver() {
        assert(UIColor.Illuminant.a.whitePoint(for: .two), (109.850, 100.000, 35.585))
        assert(UIColor.Illuminant.b.whitePoint(for: .two), (99.093, 100.000, 85.313))
        assert(UIColor.Illuminant.c.whitePoint(for: .two), (98.074, 100.000, 118.232))
        assert(UIColor.Illuminant.d50.whitePoint(for: .two), (96.422, 100.000, 82.521))
        assert(UIColor.Illuminant.d55.whitePoint(for: .two), (95.682, 100.000, 92.149))
        assert(UIColor.Illuminant.d65.whitePoint(for: .two), (95.047, 100.000, 108.883))
        assert(UIColor.Illuminant.d75.whitePoint(for: .two), (94.972, 100.000, 122.638))
        assert(UIColor.Illuminant.e.whitePoint(for: .two), (100.000, 100.000, 100.000))
        assert(UIColor.Illuminant.f1.whitePoint(for: .two), (92.834, 100.000, 103.665))
        assert(UIColor.Illuminant.f2.whitePoint(for: .two), (99.187, 100.000, 67.395))
        assert(UIColor.Illuminant.f3.whitePoint(for: .two), (103.754, 100.000, 49.861))
        assert(UIColor.Illuminant.f4.whitePoint(for: .two), (109.147, 100.000, 38.813))
        assert(UIColor.Illuminant.f5.whitePoint(for: .two), (90.872, 100.000, 98.723))
        assert(UIColor.Illuminant.f6.whitePoint(for: .two), (97.309, 100.000, 60.191))
        assert(UIColor.Illuminant.f7.whitePoint(for: .two), (95.044, 100.000, 108.755))
        assert(UIColor.Illuminant.f8.whitePoint(for: .two), (96.413, 100.000, 82.333))
        assert(UIColor.Illuminant.f9.whitePoint(for: .two), (100.365, 100.000, 67.868))
        assert(UIColor.Illuminant.f10.whitePoint(for: .two), (96.174, 100.000, 81.712))
        assert(UIColor.Illuminant.f11.whitePoint(for: .two), (100.966, 100.000, 64.370))
        assert(UIColor.Illuminant.f12.whitePoint(for: .two), (108.046, 100.000, 39.228))
    }

    func testTenDegreeObserver() {
        assert(UIColor.Illuminant.a.whitePoint(for: .ten), (111.144, 100.000, 35.200))
        assert(UIColor.Illuminant.b.whitePoint(for: .ten), (99.178, 100.000, 84.349))
        assert(UIColor.Illuminant.c.whitePoint(for: .ten), (97.285, 100.000, 116.145))
        assert(UIColor.Illuminant.d50.whitePoint(for: .ten), (96.720, 100.000, 81.427))
        assert(UIColor.Illuminant.d55.whitePoint(for: .ten), (95.799, 100.000, 90.926))
        assert(UIColor.Illuminant.d65.whitePoint(for: .ten), (94.811, 100.000, 107.304))
        assert(UIColor.Illuminant.d75.whitePoint(for: .ten), (94.416, 100.000, 120.641))
        assert(UIColor.Illuminant.e.whitePoint(for: .ten), (100.000, 100.000, 100.000))
        assert(UIColor.Illuminant.f1.whitePoint(for: .ten), (94.791, 100.000, 103.191))
        assert(UIColor.Illuminant.f2.whitePoint(for: .ten), (103.280, 100.000, 69.026))
        assert(UIColor.Illuminant.f3.whitePoint(for: .ten), (108.968, 100.000, 51.965))
        assert(UIColor.Illuminant.f4.whitePoint(for: .ten), (114.961, 100.000, 40.963))
        assert(UIColor.Illuminant.f5.whitePoint(for: .ten), (93.369, 100.000, 98.636))
        assert(UIColor.Illuminant.f6.whitePoint(for: .ten), (102.148, 100.000, 62.074))
        assert(UIColor.Illuminant.f7.whitePoint(for: .ten), (95.792, 100.000, 107.687))
        assert(UIColor.Illuminant.f8.whitePoint(for: .ten), (97.115, 100.000, 81.135))
        assert(UIColor.Illuminant.f9.whitePoint(for: .ten), (102.116, 100.000, 67.826))
        assert(UIColor.Illuminant.f10.whitePoint(for: .ten), (99.001, 100.000, 83.134))
        assert(UIColor.Illuminant.f11.whitePoint(for: .ten), (103.866, 100.000, 65.627))
        assert(UIColor.Illuminant.f12.whitePoint(for: .ten), (111.428, 100.000, 40.353))
    }

    private func assert(_ reference: UIColor.Tristimulus, _ expected: (X: CGFloat, Y: CGFloat, Z: CGFloat)) {
        XCTAssertEqual(reference.X, expected.X, accuracy: self.accuracy)
        XCTAssertEqual(reference.Y, expected.Y, accuracy: self.accuracy)
        XCTAssertEqual(reference.Z, expected.Z, accuracy: self.accuracy)
    }

}
