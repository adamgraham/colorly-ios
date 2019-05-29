//
//  UIColor+YIQTest.swift
//  HueTests
//
//  Created by Adam Graham on 5/25/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_YIQTest: XCTestCase {

    typealias YIQ = UIColor.YIQ

    private let accuracy: CGFloat = 0.001

    func testYIQStandard() {
        assert(UIColor.white.yiq, YIQ(Y: 1.0, I: 0.0, Q: 0.0))
        assert(UIColor.red.yiq, YIQ(Y: 0.299, I: 0.5959, Q: 0.2115))
        assert(UIColor.green.yiq, YIQ(Y: 0.587, I: -0.2746, Q: -0.5227))
        assert(UIColor.blue.yiq, YIQ(Y: 0.114, I: -0.3213, Q: 0.3112))
        assert(UIColor.cyan.yiq, YIQ(Y: 0.701, I: -0.5959, Q: -0.2115))
        assert(UIColor.magenta.yiq, YIQ(Y: 0.413, I: 0.2746, Q: 0.5227))
        assert(UIColor.yellow.yiq, YIQ(Y: 0.886, I: 0.3213, Q: -0.3112))
        assert(UIColor.black.yiq, YIQ(Y: 0.0, I: 0.0, Q: 0.0))
        assert(UIColor.darkGray.yiq, YIQ(Y: 1.0/3.0, I: 0.0, Q: 0.0))
        assert(UIColor.gray.yiq, YIQ(Y: 0.5, I: 0.0, Q: 0.0))
        assert(UIColor.lightGray.yiq, YIQ(Y: 2.0/3.0, I: 0.0, Q: 0.0))
        assert(UIColor.clear.yiq, YIQ(Y: 0.0, I: 0.0, Q: 0.0))
    }

    func testYIQStandardInit() {
        assert(UIColor(YIQ(Y: 1.0, I: 0.0, Q: 0.0)), .white)
        assert(UIColor(YIQ(Y: 0.299, I: 0.5959, Q: 0.2115)), .red)
        assert(UIColor(YIQ(Y: 0.587, I: -0.2746, Q: -0.5227)), .green)
        assert(UIColor(YIQ(Y: 0.114, I: -0.3213, Q: 0.3112)), .blue)
        assert(UIColor(YIQ(Y: 0.701, I: -0.5959, Q: -0.2115)), .cyan)
        assert(UIColor(YIQ(Y: 0.413, I: 0.2746, Q: 0.5227)), .magenta)
        assert(UIColor(YIQ(Y: 0.886, I: 0.3213, Q: -0.3112)), .yellow)
        assert(UIColor(YIQ(Y: 0.0, I: 0.0, Q: 0.0)), .black)
        assert(UIColor(YIQ(Y: 1.0/3.0, I: 0.0, Q: 0.0)), .darkGray)
        assert(UIColor(YIQ(Y: 0.5, I: 0.0, Q: 0.0)), .gray)
        assert(UIColor(YIQ(Y: 2.0/3.0, I: 0.0, Q: 0.0)), .lightGray)
        assert(UIColor(YIQ(Y: 0.0, I: 0.0, Q: 0.0), alpha: 0.0), .clear)
    }

    func testYIQHDTV() {
        assert(UIColor.white.yiq(.hdtv), YIQ(Y: 1.0, I: 0.0, Q: 0.0))
        assert(UIColor.red.yiq(.hdtv), YIQ(Y: 0.2126, I: 0.5702, Q: 0.2512))
        assert(UIColor.green.yiq(.hdtv), YIQ(Y: 0.7152, I: -0.2854, Q: -0.5861))
        assert(UIColor.blue.yiq(.hdtv), YIQ(Y: 0.0722, I: -0.2848, Q: 0.3349))
        assert(UIColor.cyan.yiq(.hdtv), YIQ(Y: 0.7874, I: -0.5702, Q: -0.2512))
        assert(UIColor.magenta.yiq(.hdtv), YIQ(Y: 0.2848, I: 0.2854, Q: 0.5861))
        assert(UIColor.yellow.yiq(.hdtv), YIQ(Y: 0.9278, I: 0.2848, Q: -0.3349))
        assert(UIColor.black.yiq(.hdtv), YIQ(Y: 0.0, I: 0.0, Q: 0.0))
        assert(UIColor.darkGray.yiq(.hdtv), YIQ(Y: 1.0/3.0, I: 0.0, Q: 0.0))
        assert(UIColor.gray.yiq(.hdtv), YIQ(Y: 0.5, I: 0.0, Q: 0.0))
        assert(UIColor.lightGray.yiq(.hdtv), YIQ(Y: 2.0/3.0, I: 0.0, Q: 0.0))
        assert(UIColor.clear.yiq(.hdtv), YIQ(Y: 0.0, I: 0.0, Q: 0.0))
    }

    func testYIQHDTVInit() {
        assert(UIColor(YIQ(Y: 1.0, I: 0.0, Q: 0.0), encoding: .hdtv), .white)
        assert(UIColor(YIQ(Y: 0.2126, I: 0.5702, Q: 0.2512), encoding: .hdtv), .red)
        assert(UIColor(YIQ(Y: 0.7152, I: -0.2854, Q: -0.5861), encoding: .hdtv), .green)
        assert(UIColor(YIQ(Y: 0.0722, I: -0.2848, Q: 0.3349), encoding: .hdtv), .blue)
        assert(UIColor(YIQ(Y: 0.7874, I: -0.5702, Q: -0.2512), encoding: .hdtv), .cyan)
        assert(UIColor(YIQ(Y: 0.2848, I: 0.2854, Q: 0.5861), encoding: .hdtv), .magenta)
        assert(UIColor(YIQ(Y: 0.9278, I: 0.2848, Q: -0.3349), encoding: .hdtv), .yellow)
        assert(UIColor(YIQ(Y: 0.0, I: 0.0, Q: 0.0), encoding: .hdtv), .black)
        assert(UIColor(YIQ(Y: 1.0/3.0, I: 0.0, Q: 0.0), encoding: .hdtv), .darkGray)
        assert(UIColor(YIQ(Y: 0.5, I: 0.0, Q: 0.0), encoding: .hdtv), .gray)
        assert(UIColor(YIQ(Y: 2.0/3.0, I: 0.0, Q: 0.0), encoding: .hdtv), .lightGray)
        assert(UIColor(YIQ(Y: 0.0, I: 0.0, Q: 0.0), encoding: .hdtv, alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ yiq: YIQ, _ expected: YIQ) {
        XCTAssertEqual(yiq.Y, expected.Y, accuracy: self.accuracy)
        XCTAssertEqual(yiq.I, expected.I, accuracy: self.accuracy)
        XCTAssertEqual(yiq.Q, expected.Q, accuracy: self.accuracy)
    }

}
