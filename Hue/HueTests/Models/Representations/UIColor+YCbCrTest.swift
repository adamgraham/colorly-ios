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
        assert(UIColor.white.yCbCr, YCbCr(Y: 255.0, Cb: 127.5, Cr: 127.5))
        assert(UIColor.red.yCbCr, YCbCr(Y: 76.245, Cb: 84.405, Cr: 255.0))
        assert(UIColor.green.yCbCr, YCbCr(Y: 149.685, Cb: 43.095, Cr: 20.655))
        assert(UIColor.blue.yCbCr, YCbCr(Y: 29.07, Cb: 255.0, Cr: 106.845))
        assert(UIColor.cyan.yCbCr, YCbCr(Y: 178.755, Cb: 170.595, Cr: 0.0))
        assert(UIColor.magenta.yCbCr, YCbCr(Y: 105.315, Cb: 211.905, Cr: 234.345))
        assert(UIColor.yellow.yCbCr, YCbCr(Y: 225.93, Cb: 0.0, Cr: 148.155))
        assert(UIColor.black.yCbCr, YCbCr(Y: 0.0, Cb: 127.5, Cr: 127.5))
        assert(UIColor.darkGray.yCbCr, YCbCr(Y: 85.0, Cb: 127.5, Cr: 127.5))
        assert(UIColor.gray.yCbCr, YCbCr(Y: 127.5, Cb: 127.5, Cr: 127.5))
        assert(UIColor.lightGray.yCbCr, YCbCr(Y: 170.0, Cb: 127.5, Cr: 127.5))
        assert(UIColor.clear.yCbCr, YCbCr(Y: 0.0, Cb: 127.5, Cr: 127.5))
    }

    func testYCbCrStandardInit() {
        assert(UIColor(yCbCr: YCbCr(Y: 255.0, Cb: 127.5, Cr: 127.5), encoding: .standard), .white)
        assert(UIColor(yCbCr: YCbCr(Y: 76.245, Cb: 84.405, Cr: 255.0), encoding: .standard), .red)
        assert(UIColor(yCbCr: YCbCr(Y: 149.685, Cb: 43.095, Cr: 20.655), encoding: .standard), .green)
        assert(UIColor(yCbCr: YCbCr(Y: 29.07, Cb: 255.0, Cr: 106.845), encoding: .standard), .blue)
        assert(UIColor(yCbCr: YCbCr(Y: 178.755, Cb: 170.595, Cr: 0.0), encoding: .standard), .cyan)
        assert(UIColor(yCbCr: YCbCr(Y: 105.315, Cb: 211.905, Cr: 234.345), encoding: .standard), .magenta)
        assert(UIColor(yCbCr: YCbCr(Y: 225.93, Cb: 0.0, Cr: 148.155), encoding: .standard), .yellow)
        assert(UIColor(yCbCr: YCbCr(Y: 0.0, Cb: 127.5, Cr: 127.5), encoding: .standard), .black)
        assert(UIColor(yCbCr: YCbCr(Y: 85.0, Cb: 127.5, Cr: 127.5), encoding: .standard), .darkGray)
        assert(UIColor(yCbCr: YCbCr(Y: 127.5, Cb: 127.5, Cr: 127.5), encoding: .standard), .gray)
        assert(UIColor(yCbCr: YCbCr(Y: 170.0, Cb: 127.5, Cr: 127.5), encoding: .standard), .lightGray)
        assert(UIColor(yCbCr: YCbCr(Y: 0.0, Cb: 127.5, Cr: 127.5), encoding: .standard, alpha: 0.0), .clear)
    }

    func testYCbCrHDTV() {
        assert(UIColor.white.yCbCr(.hdtv), YCbCr(Y: 255.0, Cb: 127.5, Cr: 127.5))
        assert(UIColor.red.yCbCr(.hdtv), YCbCr(Y: 54.315, Cb: 98.175, Cr: 255.0))
        assert(UIColor.green.yCbCr(.hdtv), YCbCr(Y: 182.325, Cb: 29.325, Cr: 11.73))
        assert(UIColor.blue.yCbCr(.hdtv), YCbCr(Y: 18.36, Cb: 255.0, Cr: 115.77))
        assert(UIColor.cyan.yCbCr(.hdtv), YCbCr(Y: 200.685, Cb: 156.825, Cr: 0.0))
        assert(UIColor.magenta.yCbCr(.hdtv), YCbCr(Y: 72.675, Cb: 225.675, Cr: 243.27))
        assert(UIColor.yellow.yCbCr(.hdtv), YCbCr(Y: 236.64, Cb: 0.0, Cr: 139.23))
        assert(UIColor.black.yCbCr(.hdtv), YCbCr(Y: 0.0, Cb: 127.5, Cr: 127.5))
        assert(UIColor.darkGray.yCbCr(.hdtv), YCbCr(Y: 85.0, Cb: 127.5, Cr: 127.5))
        assert(UIColor.gray.yCbCr(.hdtv), YCbCr(Y: 127.5, Cb: 127.5, Cr: 127.5))
        assert(UIColor.lightGray.yCbCr(.hdtv), YCbCr(Y: 170.0, Cb: 127.5, Cr: 127.5))
        assert(UIColor.clear.yCbCr(.hdtv), YCbCr(Y: 0.0, Cb: 127.5, Cr: 127.5))
    }

    func testYCbCrHDTVInit() {
        assert(UIColor(yCbCr: YCbCr(Y: 255.0, Cb: 127.5, Cr: 127.5), encoding: .hdtv), .white)
        assert(UIColor(yCbCr: YCbCr(Y: 54.315, Cb: 98.175, Cr: 255.0), encoding: .hdtv), .red)
        assert(UIColor(yCbCr: YCbCr(Y: 182.325, Cb: 29.325, Cr: 11.73), encoding: .hdtv), .green)
        assert(UIColor(yCbCr: YCbCr(Y: 18.36, Cb: 255.0, Cr: 115.77), encoding: .hdtv), .blue)
        assert(UIColor(yCbCr: YCbCr(Y: 200.685, Cb: 156.825, Cr: 0.0), encoding: .hdtv), .cyan)
        assert(UIColor(yCbCr: YCbCr(Y: 72.675, Cb: 225.675, Cr: 243.27), encoding: .hdtv), .magenta)
        assert(UIColor(yCbCr: YCbCr(Y: 236.64, Cb: 0.0, Cr: 139.23), encoding: .hdtv), .yellow)
        assert(UIColor(yCbCr: YCbCr(Y: 0.0, Cb: 127.5, Cr: 127.5), encoding: .hdtv), .black)
        assert(UIColor(yCbCr: YCbCr(Y: 85.0, Cb: 127.5, Cr: 127.5), encoding: .hdtv), .darkGray)
        assert(UIColor(yCbCr: YCbCr(Y: 127.5, Cb: 127.5, Cr: 127.5), encoding: .hdtv), .gray)
        assert(UIColor(yCbCr: YCbCr(Y: 170.0, Cb: 127.5, Cr: 127.5), encoding: .hdtv), .lightGray)
        assert(UIColor(yCbCr: YCbCr(Y: 0.0, Cb: 127.5, Cr: 127.5), encoding: .hdtv, alpha: 0.0), .clear)
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
