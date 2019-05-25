//
//  UIColor+YUVTest.swift
//  HueTests
//
//  Created by Adam Graham on 5/25/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_YUVTest: XCTestCase {

    typealias YUV = UIColor.YUV

    private let accuracy: CGFloat = 0.0001

    func testYUVStandard() {
        assert(UIColor.white.yuv, YUV(Y: 1.0, U: 0.0, V: 0.0))
        assert(UIColor.red.yuv, YUV(Y: 0.299, U: -0.14713, V: 0.615))
        assert(UIColor.green.yuv, YUV(Y: 0.587, U: -0.28886, V: -0.51499))
        assert(UIColor.blue.yuv, YUV(Y: 0.114, U: 0.436, V: -0.10001))
        assert(UIColor.cyan.yuv, YUV(Y: 0.701, U: 0.14714, V: -0.615))
        assert(UIColor.magenta.yuv, YUV(Y: 0.413, U: 0.28887, V: 0.51499))
        assert(UIColor.yellow.yuv, YUV(Y: 0.886, U: -0.43599, V: 0.10001))
        assert(UIColor.black.yuv, YUV(Y: 0.0, U: 0.0, V: 0.0))
        assert(UIColor.darkGray.yuv, YUV(Y: 1.0/3.0, U: 0.0, V: 0.0))
        assert(UIColor.gray.yuv, YUV(Y: 0.5, U: 0.0, V: 0.0))
        assert(UIColor.lightGray.yuv, YUV(Y: 2.0/3.0, U: 0.0, V: 0.0))
        assert(UIColor.clear.yuv, YUV(Y: 0.0, U: 0.0, V: 0.0))
    }

    func testYUVStandardInit() {
        assert(UIColor(yuv: YUV(Y: 1.0, U: 0.0, V: 0.0), encoding: .standard), .white)
        assert(UIColor(yuv: YUV(Y: 0.299, U: -0.14713, V: 0.615), encoding: .standard), .red)
        assert(UIColor(yuv: YUV(Y: 0.587, U: -0.28886, V: -0.51499), encoding: .standard), .green)
        assert(UIColor(yuv: YUV(Y: 0.114, U: 0.436, V: -0.10001), encoding: .standard), .blue)
        assert(UIColor(yuv: YUV(Y: 0.701, U: 0.14714, V: -0.615), encoding: .standard), .cyan)
        assert(UIColor(yuv: YUV(Y: 0.413, U: 0.28887, V: 0.51499), encoding: .standard), .magenta)
        assert(UIColor(yuv: YUV(Y: 0.886, U: -0.43599, V: 0.10001), encoding: .standard), .yellow)
        assert(UIColor(yuv: YUV(Y: 0.0, U: 0.0, V: 0.0), encoding: .standard), .black)
        assert(UIColor(yuv: YUV(Y: 1.0/3.0, U: 0.0, V: 0.0), encoding: .standard), .darkGray)
        assert(UIColor(yuv: YUV(Y: 0.5, U: 0.0, V: 0.0), encoding: .standard), .gray)
        assert(UIColor(yuv: YUV(Y: 2.0/3.0, U: 0.0, V: 0.0), encoding: .standard), .lightGray)
        assert(UIColor(yuv: YUV(Y: 0.0, U: 0.0, V: 0.0), encoding: .standard, alpha: 0.0), .clear)
    }

    func testYUVHDTV() {
        assert(UIColor.white.yuv(.hdtv), YUV(Y: 1.0, U: 0.0, V: 0.0))
        assert(UIColor.red.yuv(.hdtv), YUV(Y: 0.2126, U: -0.09991, V: 0.615))
        assert(UIColor.green.yuv(.hdtv), YUV(Y: 0.7152, U: -0.33609, V: -0.55861))
        assert(UIColor.blue.yuv(.hdtv), YUV(Y: 0.0722, U: 0.436, V: -0.05639))
        assert(UIColor.cyan.yuv(.hdtv), YUV(Y: 0.7874, U: 0.09991, V: -0.615))
        assert(UIColor.magenta.yuv(.hdtv), YUV(Y: 0.2848, U: 0.33609, V: 0.55861))
        assert(UIColor.yellow.yuv(.hdtv), YUV(Y: 0.9278, U: -0.436, V: 0.05639))
        assert(UIColor.black.yuv(.hdtv), YUV(Y: 0.0, U: 0.0, V: 0.0))
        assert(UIColor.darkGray.yuv(.hdtv), YUV(Y: 1.0/3.0, U: 0.0, V: 0.0))
        assert(UIColor.gray.yuv(.hdtv), YUV(Y: 0.5, U: 0.0, V: 0.0))
        assert(UIColor.lightGray.yuv(.hdtv), YUV(Y: 2.0/3.0, U: 0.0, V: 0.0))
        assert(UIColor.clear.yuv(.hdtv), YUV(Y: 0.0, U: 0.0, V: 0.0))
    }

    func testYUVHDTVInit() {
        assert(UIColor(yuv: YUV(Y: 1.0, U: 0.0, V: 0.0), encoding: .hdtv), .white)
        assert(UIColor(yuv: YUV(Y: 0.2126, U: -0.09991, V: 0.615), encoding: .hdtv), .red)
        assert(UIColor(yuv: YUV(Y: 0.7152, U: -0.33609, V: -0.55861), encoding: .hdtv), .green)
        assert(UIColor(yuv: YUV(Y: 0.0722, U: 0.436, V: -0.05639), encoding: .hdtv), .blue)
        assert(UIColor(yuv: YUV(Y: 0.7874, U: 0.09991, V: -0.615), encoding: .hdtv), .cyan)
        assert(UIColor(yuv: YUV(Y: 0.2848, U: 0.33609, V: 0.55861), encoding: .hdtv), .magenta)
        assert(UIColor(yuv: YUV(Y: 0.9278, U: -0.436, V: 0.05639), encoding: .hdtv), .yellow)
        assert(UIColor(yuv: YUV(Y: 0.0, U: 0.0, V: 0.0), encoding: .hdtv), .black)
        assert(UIColor(yuv: YUV(Y: 1.0/3.0, U: 0.0, V: 0.0), encoding: .hdtv), .darkGray)
        assert(UIColor(yuv: YUV(Y: 0.5, U: 0.0, V: 0.0), encoding: .hdtv), .gray)
        assert(UIColor(yuv: YUV(Y: 2.0/3.0, U: 0.0, V: 0.0), encoding: .hdtv), .lightGray)
        assert(UIColor(yuv: YUV(Y: 0.0, U: 0.0, V: 0.0), encoding: .hdtv, alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ yuv: YUV, _ expected: YUV) {
        XCTAssertEqual(yuv.Y, expected.Y, accuracy: self.accuracy)
        XCTAssertEqual(yuv.U, expected.U, accuracy: self.accuracy)
        XCTAssertEqual(yuv.V, expected.V, accuracy: self.accuracy)
    }

}
