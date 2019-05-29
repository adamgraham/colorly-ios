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

    private let accuracy: CGFloat = 0.001

    func testYUVStandard() {
        assert(UIColor.white.yuv, YUV(Y: 1.0, U: 0.0, V: 0.0))
        assert(UIColor.red.yuv, YUV(Y: 0.299, U: -0.1471, V: 0.6150))
        assert(UIColor.green.yuv, YUV(Y: 0.587, U: -0.2889, V: -0.5150))
        assert(UIColor.blue.yuv, YUV(Y: 0.114, U: 0.4360, V: -0.1000))
        assert(UIColor.cyan.yuv, YUV(Y: 0.701, U: 0.1471, V: -0.6150))
        assert(UIColor.magenta.yuv, YUV(Y: 0.413, U: 0.2889, V: 0.5150))
        assert(UIColor.yellow.yuv, YUV(Y: 0.886, U: -0.4360, V: 0.1000))
        assert(UIColor.black.yuv, YUV(Y: 0.0, U: 0.0, V: 0.0))
        assert(UIColor.darkGray.yuv, YUV(Y: 1.0/3.0, U: 0.0, V: 0.0))
        assert(UIColor.gray.yuv, YUV(Y: 0.5, U: 0.0, V: 0.0))
        assert(UIColor.lightGray.yuv, YUV(Y: 2.0/3.0, U: 0.0, V: 0.0))
        assert(UIColor.clear.yuv, YUV(Y: 0.0, U: 0.0, V: 0.0))
    }

    func testYUVStandardInit() {
        assert(UIColor(YUV(Y: 1.0, U: 0.0, V: 0.0)), .white)
        assert(UIColor(YUV(Y: 0.299, U: -0.1471, V: 0.6150)), .red)
        assert(UIColor(YUV(Y: 0.587, U: -0.2889, V: -0.5150)), .green)
        assert(UIColor(YUV(Y: 0.114, U: 0.4360, V: -0.1000)), .blue)
        assert(UIColor(YUV(Y: 0.701, U: 0.1471, V: -0.6150)), .cyan)
        assert(UIColor(YUV(Y: 0.413, U: 0.2889, V: 0.5150)), .magenta)
        assert(UIColor(YUV(Y: 0.886, U: -0.4360, V: 0.1000)), .yellow)
        assert(UIColor(YUV(Y: 0.0, U: 0.0, V: 0.0)), .black)
        assert(UIColor(YUV(Y: 1.0/3.0, U: 0.0, V: 0.0)), .darkGray)
        assert(UIColor(YUV(Y: 0.5, U: 0.0, V: 0.0)), .gray)
        assert(UIColor(YUV(Y: 2.0/3.0, U: 0.0, V: 0.0)), .lightGray)
        assert(UIColor(YUV(Y: 0.0, U: 0.0, V: 0.0), alpha: 0.0), .clear)
    }

    func testYUVHDTV() {
        assert(UIColor.white.yuv(.rec709), YUV(Y: 1.0, U: 0.0, V: 0.0))
        assert(UIColor.red.yuv(.rec709), YUV(Y: 0.2126, U: -0.0999, V: 0.6150))
        assert(UIColor.green.yuv(.rec709), YUV(Y: 0.7152, U: -0.3361, V: -0.5586))
        assert(UIColor.blue.yuv(.rec709), YUV(Y: 0.0722, U: 0.4360, V: -0.0564))
        assert(UIColor.cyan.yuv(.rec709), YUV(Y: 0.7874, U: 0.0999, V: -0.6150))
        assert(UIColor.magenta.yuv(.rec709), YUV(Y: 0.2848, U: 0.3361, V: 0.5586))
        assert(UIColor.yellow.yuv(.rec709), YUV(Y: 0.9278, U: -0.4360, V: 0.0564))
        assert(UIColor.black.yuv(.rec709), YUV(Y: 0.0, U: 0.0, V: 0.0))
        assert(UIColor.darkGray.yuv(.rec709), YUV(Y: 1.0/3.0, U: 0.0, V: 0.0))
        assert(UIColor.gray.yuv(.rec709), YUV(Y: 0.5, U: 0.0, V: 0.0))
        assert(UIColor.lightGray.yuv(.rec709), YUV(Y: 2.0/3.0, U: 0.0, V: 0.0))
        assert(UIColor.clear.yuv(.rec709), YUV(Y: 0.0, U: 0.0, V: 0.0))
    }

    func testYUVHDTVInit() {
        assert(UIColor(YUV(Y: 1.0, U: 0.0, V: 0.0), encoding: .rec709), .white)
        assert(UIColor(YUV(Y: 0.2126, U: -0.0999, V: 0.6150), encoding: .rec709), .red)
        assert(UIColor(YUV(Y: 0.7152, U: -0.3361, V: -0.5586), encoding: .rec709), .green)
        assert(UIColor(YUV(Y: 0.0722, U: 0.4360, V: -0.0564), encoding: .rec709), .blue)
        assert(UIColor(YUV(Y: 0.7874, U: 0.0999, V: -0.6150), encoding: .rec709), .cyan)
        assert(UIColor(YUV(Y: 0.2848, U: 0.3361, V: 0.5586), encoding: .rec709), .magenta)
        assert(UIColor(YUV(Y: 0.9278, U: -0.4360, V: 0.0564), encoding: .rec709), .yellow)
        assert(UIColor(YUV(Y: 0.0, U: 0.0, V: 0.0), encoding: .rec709), .black)
        assert(UIColor(YUV(Y: 1.0/3.0, U: 0.0, V: 0.0), encoding: .rec709), .darkGray)
        assert(UIColor(YUV(Y: 0.5, U: 0.0, V: 0.0), encoding: .rec709), .gray)
        assert(UIColor(YUV(Y: 2.0/3.0, U: 0.0, V: 0.0), encoding: .rec709), .lightGray)
        assert(UIColor(YUV(Y: 0.0, U: 0.0, V: 0.0), encoding: .rec709, alpha: 0.0), .clear)
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
