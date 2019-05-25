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
        assert(UIColor(yPbPr: YPbPr(Y: 1.0, Pb: 0.0, Pr: 0.0), encoding: .standard), .white)
        assert(UIColor(yPbPr: YPbPr(Y: 0.299, Pb: -0.169, Pr: 0.5), encoding: .standard), .red)
        assert(UIColor(yPbPr: YPbPr(Y: 0.587, Pb: -0.331, Pr: -0.419), encoding: .standard), .green)
        assert(UIColor(yPbPr: YPbPr(Y: 0.114, Pb: 0.5, Pr: -0.081), encoding: .standard), .blue)
        assert(UIColor(yPbPr: YPbPr(Y: 0.701, Pb: 0.169, Pr: -0.5), encoding: .standard), .cyan)
        assert(UIColor(yPbPr: YPbPr(Y: 0.413, Pb: 0.331, Pr: 0.419), encoding: .standard), .magenta)
        assert(UIColor(yPbPr: YPbPr(Y: 0.886, Pb: -0.5, Pr: 0.081), encoding: .standard), .yellow)
        assert(UIColor(yPbPr: YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0), encoding: .standard), .black)
        assert(UIColor(yPbPr: YPbPr(Y: 1.0/3.0, Pb: 0.0, Pr: 0.0), encoding: .standard), .darkGray)
        assert(UIColor(yPbPr: YPbPr(Y: 0.5, Pb: 0.0, Pr: 0.0), encoding: .standard), .gray)
        assert(UIColor(yPbPr: YPbPr(Y: 2.0/3.0, Pb: 0.0, Pr: 0.0), encoding: .standard), .lightGray)
        assert(UIColor(yPbPr: YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0), encoding: .standard, alpha: 0.0), .clear)
    }

    func testYPbPrHDTV() {
        assert(UIColor.white.yPbPr(.hdtv), YPbPr(Y: 1.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.red.yPbPr(.hdtv), YPbPr(Y: 0.213, Pb: -0.115, Pr: 0.5))
        assert(UIColor.green.yPbPr(.hdtv), YPbPr(Y: 0.715, Pb: -0.385, Pr: -0.454))
        assert(UIColor.blue.yPbPr(.hdtv), YPbPr(Y: 0.072, Pb: 0.5, Pr: -0.046))
        assert(UIColor.cyan.yPbPr(.hdtv), YPbPr(Y: 0.787, Pb: 0.115, Pr: -0.5))
        assert(UIColor.magenta.yPbPr(.hdtv), YPbPr(Y: 0.285, Pb: 0.385, Pr: 0.454))
        assert(UIColor.yellow.yPbPr(.hdtv), YPbPr(Y: 0.928, Pb: -0.5, Pr: 0.046))
        assert(UIColor.black.yPbPr(.hdtv), YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.darkGray.yPbPr(.hdtv), YPbPr(Y: 1.0/3.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.gray.yPbPr(.hdtv), YPbPr(Y: 0.5, Pb: 0.0, Pr: 0.0))
        assert(UIColor.lightGray.yPbPr(.hdtv), YPbPr(Y: 2.0/3.0, Pb: 0.0, Pr: 0.0))
        assert(UIColor.clear.yPbPr(.hdtv), YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0))
    }

    func testYPbPrHDTVInit() {
        assert(UIColor(yPbPr: YPbPr(Y: 1.0, Pb: 0.0, Pr: 0.0), encoding: .hdtv), .white)
        assert(UIColor(yPbPr: YPbPr(Y: 0.213, Pb: -0.115, Pr: 0.5), encoding: .hdtv), .red)
        assert(UIColor(yPbPr: YPbPr(Y: 0.715, Pb: -0.385, Pr: -0.454), encoding: .hdtv), .green)
        assert(UIColor(yPbPr: YPbPr(Y: 0.072, Pb: 0.5, Pr: -0.046), encoding: .hdtv), .blue)
        assert(UIColor(yPbPr: YPbPr(Y: 0.787, Pb: 0.115, Pr: -0.5), encoding: .hdtv), .cyan)
        assert(UIColor(yPbPr: YPbPr(Y: 0.285, Pb: 0.385, Pr: 0.454), encoding: .hdtv), .magenta)
        assert(UIColor(yPbPr: YPbPr(Y: 0.928, Pb: -0.5, Pr: 0.046), encoding: .hdtv), .yellow)
        assert(UIColor(yPbPr: YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0), encoding: .hdtv), .black)
        assert(UIColor(yPbPr: YPbPr(Y: 1.0/3.0, Pb: 0.0, Pr: 0.0), encoding: .hdtv), .darkGray)
        assert(UIColor(yPbPr: YPbPr(Y: 0.5, Pb: 0.0, Pr: 0.0), encoding: .hdtv), .gray)
        assert(UIColor(yPbPr: YPbPr(Y: 2.0/3.0, Pb: 0.0, Pr: 0.0), encoding: .hdtv), .lightGray)
        assert(UIColor(yPbPr: YPbPr(Y: 0.0, Pb: 0.0, Pr: 0.0), encoding: .hdtv, alpha: 0.0), .clear)
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
