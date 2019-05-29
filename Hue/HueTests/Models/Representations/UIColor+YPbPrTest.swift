//
//  UIColor+YPbPrTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_YPbPrTest: XCTestCase {

    typealias YPbPr = UIColor.YPbPr

    private let accuracy: CGFloat = 0.001

    func testYPbPrStandard() {
        assert(UIColor.white.yPbPr, YPbPr(Y: 1.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.red.yPbPr, YPbPr(Y: 0.299, Pb: -0.169, Pr: 0.5))
        assert(UIColor.green.yPbPr, YPbPr(Y: 0.587, Pb: -0.331, Pr: -0.419))
        assert(UIColor.blue.yPbPr, YPbPr(Y: 0.114, Pb: 0.5, Pr: -0.081))
        assert(UIColor.cyan.yPbPr, YPbPr(Y: 0.701, Pb: 0.169, Pr: -0.5))
        assert(UIColor.magenta.yPbPr, YPbPr(Y: 0.413, Pb: 0.331, Pr: 0.419))
        assert(UIColor.yellow.yPbPr, YPbPr(Y: 0.886, Pb: -0.5, Pr: 0.081))
        assert(UIColor.black.yPbPr, YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.darkGray.yPbPr, YPbPr(Y: 1.0/3.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.gray.yPbPr, YPbPr(Y: 0.5, Pb: 0.0, Pr: 0.0))
        assert(UIColor.lightGray.yPbPr, YPbPr(Y: 2.0/3.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.clear.yPbPr, YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0))
    }

    func testYPbPrStandardInit() {
        assert(UIColor(YPbPr(Y: 1.0, Pb: 0.0, Pr: 0.0)), .white)
        assert(UIColor(YPbPr(Y: 0.299, Pb: -0.169, Pr: 0.5)), .red)
        assert(UIColor(YPbPr(Y: 0.587, Pb: -0.331, Pr: -0.419)), .green)
        assert(UIColor(YPbPr(Y: 0.114, Pb: 0.5, Pr: -0.081)), .blue)
        assert(UIColor(YPbPr(Y: 0.701, Pb: 0.169, Pr: -0.5)), .cyan)
        assert(UIColor(YPbPr(Y: 0.413, Pb: 0.331, Pr: 0.419)), .magenta)
        assert(UIColor(YPbPr(Y: 0.886, Pb: -0.5, Pr: 0.081)), .yellow)
        assert(UIColor(YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0)), .black)
        assert(UIColor(YPbPr(Y: 1.0/3.0, Pb: 0.0, Pr: 0.0)), .darkGray)
        assert(UIColor(YPbPr(Y: 0.5, Pb: 0.0, Pr: 0.0)), .gray)
        assert(UIColor(YPbPr(Y: 2.0/3.0, Pb: 0.0, Pr: 0.0)), .lightGray)
        assert(UIColor(YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0), alpha: 0.0), .clear)
    }

    func testYPbPrHDTV() {
        assert(UIColor.white.yPbPr(.rec709), YPbPr(Y: 1.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.red.yPbPr(.rec709), YPbPr(Y: 0.213, Pb: -0.115, Pr: 0.5))
        assert(UIColor.green.yPbPr(.rec709), YPbPr(Y: 0.715, Pb: -0.385, Pr: -0.454))
        assert(UIColor.blue.yPbPr(.rec709), YPbPr(Y: 0.072, Pb: 0.5, Pr: -0.046))
        assert(UIColor.cyan.yPbPr(.rec709), YPbPr(Y: 0.787, Pb: 0.115, Pr: -0.5))
        assert(UIColor.magenta.yPbPr(.rec709), YPbPr(Y: 0.285, Pb: 0.385, Pr: 0.454))
        assert(UIColor.yellow.yPbPr(.rec709), YPbPr(Y: 0.928, Pb: -0.5, Pr: 0.046))
        assert(UIColor.black.yPbPr(.rec709), YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.darkGray.yPbPr(.rec709), YPbPr(Y: 1.0/3.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.gray.yPbPr(.rec709), YPbPr(Y: 0.5, Pb: 0.0, Pr: 0.0))
        assert(UIColor.lightGray.yPbPr(.rec709), YPbPr(Y: 2.0/3.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.clear.yPbPr(.rec709), YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0))
    }

    func testYPbPrHDTVInit() {
        assert(UIColor(YPbPr(Y: 1.0, Pb: 0.0, Pr: 0.0), encoding: .rec709), .white)
        assert(UIColor(YPbPr(Y: 0.213, Pb: -0.115, Pr: 0.5), encoding: .rec709), .red)
        assert(UIColor(YPbPr(Y: 0.715, Pb: -0.385, Pr: -0.454), encoding: .rec709), .green)
        assert(UIColor(YPbPr(Y: 0.072, Pb: 0.5, Pr: -0.046), encoding: .rec709), .blue)
        assert(UIColor(YPbPr(Y: 0.787, Pb: 0.115, Pr: -0.5), encoding: .rec709), .cyan)
        assert(UIColor(YPbPr(Y: 0.285, Pb: 0.385, Pr: 0.454), encoding: .rec709), .magenta)
        assert(UIColor(YPbPr(Y: 0.928, Pb: -0.5, Pr: 0.046), encoding: .rec709), .yellow)
        assert(UIColor(YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0), encoding: .rec709), .black)
        assert(UIColor(YPbPr(Y: 1.0/3.0, Pb: 0.0, Pr: 0.0), encoding: .rec709), .darkGray)
        assert(UIColor(YPbPr(Y: 0.5, Pb: 0.0, Pr: 0.0), encoding: .rec709), .gray)
        assert(UIColor(YPbPr(Y: 2.0/3.0, Pb: 0.0, Pr: 0.0), encoding: .rec709), .lightGray)
        assert(UIColor(YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0), encoding: .rec709, alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ yPbPr: YPbPr, _ expected: YPbPr) {
        XCTAssertEqual(yPbPr.Y, expected.Y, accuracy: self.accuracy)
        XCTAssertEqual(yPbPr.Pb, expected.Pb, accuracy: self.accuracy)
        XCTAssertEqual(yPbPr.Pr, expected.Pr, accuracy: self.accuracy)
    }

}
