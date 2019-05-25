//
//  UIColor+YCbCrTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_YCbCrTest: XCTestCase {

    typealias YCbCr = UIColor.YCbCr

    private let accuracy: CGFloat = 0.001

    func testYCbCrStandard() {
        assert(UIColor.white.yCbCr, YCbCr(Y: 1.0, Cb: 0.0, Cr: 0.0))
        assert(UIColor.red.yCbCr, YCbCr(Y: 0.299, Cb: -0.169, Cr: 0.5))
        assert(UIColor.green.yCbCr, YCbCr(Y: 0.587, Cb: -0.331, Cr: -0.419))
        assert(UIColor.blue.yCbCr, YCbCr(Y: 0.114, Cb: 0.5, Cr: -0.081))
        assert(UIColor.cyan.yCbCr, YCbCr(Y: 0.701, Cb: 0.169, Cr: -0.5))
        assert(UIColor.magenta.yCbCr, YCbCr(Y: 0.413, Cb: 0.331, Cr: 0.419))
        assert(UIColor.yellow.yCbCr, YCbCr(Y: 0.886, Cb: -0.5, Cr: 0.081))
        assert(UIColor.black.yCbCr, YCbCr(Y: 0.0, Cb: 0.0, Cr: 0.0))
        assert(UIColor.darkGray.yCbCr, YCbCr(Y: 1.0/3.0, Cb: 0.0, Cr: 0.0))
        assert(UIColor.gray.yCbCr, YCbCr(Y: 0.5, Cb: 0.0, Cr: 0.0))
        assert(UIColor.lightGray.yCbCr, YCbCr(Y: 2.0/3.0, Cb: 0.0, Cr: 0.0))
        assert(UIColor.clear.yCbCr, YCbCr(Y: 0.0, Cb: 0.0, Cr: 0.0))
    }

    func testYCbCrStandardInit() {
        assert(UIColor(yCbCr: YCbCr(Y: 1.0, Cb: 0.0, Cr: 0.0), encoding: .standard), .white)
        assert(UIColor(yCbCr: YCbCr(Y: 0.299, Cb: -0.169, Cr: 0.5), encoding: .standard), .red)
        assert(UIColor(yCbCr: YCbCr(Y: 0.587, Cb: -0.331, Cr: -0.419), encoding: .standard), .green)
        assert(UIColor(yCbCr: YCbCr(Y: 0.114, Cb: 0.5, Cr: -0.081), encoding: .standard), .blue)
        assert(UIColor(yCbCr: YCbCr(Y: 0.701, Cb: 0.169, Cr: -0.5), encoding: .standard), .cyan)
        assert(UIColor(yCbCr: YCbCr(Y: 0.413, Cb: 0.331, Cr: 0.419), encoding: .standard), .magenta)
        assert(UIColor(yCbCr: YCbCr(Y: 0.886, Cb: -0.5, Cr: 0.081), encoding: .standard), .yellow)
        assert(UIColor(yCbCr: YCbCr(Y: 0.0, Cb: 0.0, Cr: 0.0), encoding: .standard), .black)
        assert(UIColor(yCbCr: YCbCr(Y: 1.0/3.0, Cb: 0.0, Cr: 0.0), encoding: .standard), .darkGray)
        assert(UIColor(yCbCr: YCbCr(Y: 0.5, Cb: 0.0, Cr: 0.0), encoding: .standard), .gray)
        assert(UIColor(yCbCr: YCbCr(Y: 2.0/3.0, Cb: 0.0, Cr: 0.0), encoding: .standard), .lightGray)
        assert(UIColor(yCbCr: YCbCr(Y: 0.0, Cb: 0.0, Cr: 0.0), encoding: .standard, alpha: 0.0), .clear)
    }

    func testYCbCrHDTV() {
        assert(UIColor.white.yCbCr(.hdtv), YCbCr(Y: 1.0, Cb: 0.0, Cr: 0.0))
        assert(UIColor.red.yCbCr(.hdtv), YCbCr(Y: 0.213, Cb: -0.115, Cr: 0.5))
        assert(UIColor.green.yCbCr(.hdtv), YCbCr(Y: 0.715, Cb: -0.385, Cr: -0.454))
        assert(UIColor.blue.yCbCr(.hdtv), YCbCr(Y: 0.072, Cb: 0.5, Cr: -0.046))
        assert(UIColor.cyan.yCbCr(.hdtv), YCbCr(Y: 0.787, Cb: 0.115, Cr: -0.5))
        assert(UIColor.magenta.yCbCr(.hdtv), YCbCr(Y: 0.285, Cb: 0.385, Cr: 0.454))
        assert(UIColor.yellow.yCbCr(.hdtv), YCbCr(Y: 0.928, Cb: -0.5, Cr: 0.046))
        assert(UIColor.black.yCbCr(.hdtv), YCbCr(Y: 0.0, Cb: 0.0, Cr: 0.0))
        assert(UIColor.darkGray.yCbCr(.hdtv), YCbCr(Y: 1.0/3.0, Cb: 0.0, Cr: 0.0))
        assert(UIColor.gray.yCbCr(.hdtv), YCbCr(Y: 0.5, Cb: 0.0, Cr: 0.0))
        assert(UIColor.lightGray.yCbCr(.hdtv), YCbCr(Y: 2.0/3.0, Cb: 0.0, Cr: 0.0))
        assert(UIColor.clear.yCbCr(.hdtv), YCbCr(Y: 0.0, Cb: 0.0, Cr: 0.0))
    }

    func testYCbCrHDTVInit() {
        assert(UIColor(yCbCr: YCbCr(Y: 1.0, Cb: 0.0, Cr: 0.0), encoding: .hdtv), .white)
        assert(UIColor(yCbCr: YCbCr(Y: 0.213, Cb: -0.115, Cr: 0.5), encoding: .hdtv), .red)
        assert(UIColor(yCbCr: YCbCr(Y: 0.715, Cb: -0.385, Cr: -0.454), encoding: .hdtv), .green)
        assert(UIColor(yCbCr: YCbCr(Y: 0.072, Cb: 0.5, Cr: -0.046), encoding: .hdtv), .blue)
        assert(UIColor(yCbCr: YCbCr(Y: 0.787, Cb: 0.115, Cr: -0.5), encoding: .hdtv), .cyan)
        assert(UIColor(yCbCr: YCbCr(Y: 0.285, Cb: 0.385, Cr: 0.454), encoding: .hdtv), .magenta)
        assert(UIColor(yCbCr: YCbCr(Y: 0.928, Cb: -0.5, Cr: 0.046), encoding: .hdtv), .yellow)
        assert(UIColor(yCbCr: YCbCr(Y: 0.0, Cb: 0.0, Cr: 0.0), encoding: .hdtv), .black)
        assert(UIColor(yCbCr: YCbCr(Y: 1.0/3.0, Cb: 0.0, Cr: 0.0), encoding: .hdtv), .darkGray)
        assert(UIColor(yCbCr: YCbCr(Y: 0.5, Cb: 0.0, Cr: 0.0), encoding: .hdtv), .gray)
        assert(UIColor(yCbCr: YCbCr(Y: 2.0/3.0, Cb: 0.0, Cr: 0.0), encoding: .hdtv), .lightGray)
        assert(UIColor(yCbCr: YCbCr(Y: 0.0, Cb: 0.0, Cr: 0.0), encoding: .hdtv, alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ yCbCr: YCbCr, _ expected: YCbCr) {
        XCTAssertEqual(yCbCr.Y, expected.Y, accuracy: self.accuracy)
        XCTAssertEqual(yCbCr.Cb, expected.Cb, accuracy: self.accuracy)
        XCTAssertEqual(yCbCr.Cr, expected.Cr, accuracy: self.accuracy)
    }

}
