//
//  UIColor+PantoneTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 5/19/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_PantoneTest: XCTestCase {

    private let accuracy: CGFloat = 0.0001

    func testPalette() {
        XCTAssertNotNil(UIColor.Pantone()) // needed for code coverage
        assert(UIColor.Pantone.cerulean, UIColor(red: 0.60784, green: 0.71765, blue: 0.83137, alpha: 1.0))
        assert(UIColor.Pantone.fuchsiaRose, UIColor(red: 0.78039, green: 0.26275, blue: 0.45882, alpha: 1.0))
        assert(UIColor.Pantone.trueRed, UIColor(red: 0.74902, green: 0.09804, blue: 0.19608, alpha: 1.0))
        assert(UIColor.Pantone.aquaSky, UIColor(red: 0.48235, green: 0.76863, blue: 0.76863, alpha: 1.0))
        assert(UIColor.Pantone.tigerlily, UIColor(red: 0.88627, green: 0.34510, blue: 0.24314, alpha: 1.0))
        assert(UIColor.Pantone.blueTurquoise, UIColor(red: 0.32549, green: 0.69020, blue: 0.68235, alpha: 1.0))
        assert(UIColor.Pantone.sandDollar, UIColor(red: 0.87059, green: 0.80392, blue: 0.74510, alpha: 1.0))
        assert(UIColor.Pantone.chiliPepper, UIColor(red: 0.60784, green: 0.10588, blue: 0.18824, alpha: 1.0))
        assert(UIColor.Pantone.blueIris, UIColor(red: 0.35294, green: 0.35686, blue: 0.62353, alpha: 1.0))
        assert(UIColor.Pantone.mimosa, UIColor(red: 0.94118, green: 0.75294, blue: 0.35294, alpha: 1.0))
        assert(UIColor.Pantone.turquoise, UIColor(red: 0.27059, green: 0.70980, blue: 0.66667, alpha: 1.0))
        assert(UIColor.Pantone.honeysuckle, UIColor(red: 0.85098, green: 0.30980, blue: 0.43922, alpha: 1.0))
        assert(UIColor.Pantone.tangerineTango, UIColor(red: 0.86667, green: 0.25490, blue: 0.14118, alpha: 1.0))
        assert(UIColor.Pantone.emerald, UIColor(red: 0.00000, green: 0.58039, blue: 0.45098, alpha: 1.0))
        assert(UIColor.Pantone.radiantOrchid, UIColor(red: 0.69412, green: 0.38824, blue: 0.63922, alpha: 1.0))
        assert(UIColor.Pantone.marsala, UIColor(red: 0.58431, green: 0.32157, blue: 0.31765, alpha: 1.0))
        assert(UIColor.Pantone.roseQuartz, UIColor(red: 0.96863, green: 0.79216, blue: 0.78824, alpha: 1.0))
        assert(UIColor.Pantone.serenity, UIColor(red: 0.57255, green: 0.65882, blue: 0.81961, alpha: 1.0))
        assert(UIColor.Pantone.greenery, UIColor(red: 0.53333, green: 0.69020, blue: 0.29412, alpha: 1.0))
        assert(UIColor.Pantone.ultraViolet, UIColor(red: 0.37255, green: 0.29412, blue: 0.54510, alpha: 1.0))
        assert(UIColor.Pantone.livingCoral, UIColor(red: 1.00000, green: 0.43529, blue: 0.38039, alpha: 1.0))
    }

    private func assert(_ color: UIColor, _ expected: UIColor) {
        XCTAssertEqual(color, expected, accuracy: self.accuracy)
    }

}
