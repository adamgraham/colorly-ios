//
//  UIColor+CIEUCSTest.swift
//  HueTests
//
//  Created by Adam Graham on 6/1/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_CIEUCSTest: XCTestCase {

    typealias CIEUCS = UIColor.CIEUCS

    private let accuracy: CGFloat = 0.0001

    func testCIEUCS() {
        assert(UIColor.white.ucs, CIEUCS(u: 0.197840, v: 0.312224))
        assert(UIColor.red.ucs, CIEUCS(u: 0.450704, v: 0.348592))
        assert(UIColor.green.ucs, CIEUCS(u: 0.125000, v: 0.375000))
        assert(UIColor.blue.ucs, CIEUCS(u: 0.175439, v: 0.105263))
        assert(UIColor.cyan.ucs, CIEUCS(u: 0.138339, v: 0.303667))
        assert(UIColor.magenta.ucs, CIEUCS(u: 0.305044, v: 0.219832))
        assert(UIColor.yellow.ucs, CIEUCS(u: 0.203942, v: 0.368599))
        assert(UIColor.black.ucs, CIEUCS(u: 0.000000, v: 0.000000))
        assert(UIColor.darkGray.ucs, CIEUCS(u: 0.197840, v: 0.312224))
        assert(UIColor.gray.ucs, CIEUCS(u: 0.197840, v: 0.312224))
        assert(UIColor.lightGray.ucs, CIEUCS(u: 0.197840, v: 0.312224))
        assert(UIColor.clear.ucs, CIEUCS(u: 0.000000, v: 0.000000))
    }

    func testCIEUCSInit() {
        assert(UIColor(CIEUCS(u: 0.197840, v: 0.312224), luminance: 1.0), .white)
        assert(UIColor(CIEUCS(u: 0.450704, v: 0.348592), luminance: 0.2126729), .red)
        assert(UIColor(CIEUCS(u: 0.125000, v: 0.375000), luminance: 0.7151522), .green)
        assert(UIColor(CIEUCS(u: 0.175439, v: 0.105263), luminance: 0.0721750), .blue)
        assert(UIColor(CIEUCS(u: 0.138339, v: 0.303667), luminance: 0.7873272), .cyan)
        assert(UIColor(CIEUCS(u: 0.305044, v: 0.219832), luminance: 0.2848479), .magenta)
        assert(UIColor(CIEUCS(u: 0.203942, v: 0.368599), luminance: 0.9278251), .yellow)
        assert(UIColor(CIEUCS(u: 0.000000, v: 0.000000), luminance: 0.00000), .black)
        assert(UIColor(CIEUCS(u: 0.197840, v: 0.312224), luminance: 0.0908417), .darkGray)
        assert(UIColor(CIEUCS(u: 0.197840, v: 0.312224), luminance: 0.2140412), .gray)
        assert(UIColor(CIEUCS(u: 0.197840, v: 0.312224), luminance: 0.4019778), .lightGray)
        assert(UIColor(CIEUCS(u: 0.000000, v: 0.000000), luminance: 0.00000, alpha: 0.0), .clear)
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

    private func assert(_ ucs: CIEUCS, _ expected: CIEUCS) {
        XCTAssertEqual(ucs.u, expected.u, accuracy: self.accuracy)
        XCTAssertEqual(ucs.v, expected.v, accuracy: self.accuracy)
    }

}
