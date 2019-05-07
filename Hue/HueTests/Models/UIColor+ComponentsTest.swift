//
//  UIColor+ComponentsTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_ComponentsTest: XCTestCase {
    
    func testRedComponent() {
        XCTAssertEqual(UIColor.red.redComponent, 1.0)
        XCTAssertEqual(UIColor.green.redComponent, 0.0)
        XCTAssertEqual(UIColor.blue.redComponent, 0.0)
        XCTAssertEqual(UIColor.cyan.redComponent, 0.0)
        XCTAssertEqual(UIColor.magenta.redComponent, 1.0)
        XCTAssertEqual(UIColor.yellow.redComponent, 1.0)
        XCTAssertEqual(UIColor.black.redComponent, 0.0)
        XCTAssertEqual(UIColor.white.redComponent, 1.0)
        XCTAssertEqual(UIColor.clear.redComponent, 0.0)
    }

    func testGreenComponent() {
        XCTAssertEqual(UIColor.red.greenComponent, 0.0)
        XCTAssertEqual(UIColor.green.greenComponent, 1.0)
        XCTAssertEqual(UIColor.blue.greenComponent, 0.0)
        XCTAssertEqual(UIColor.cyan.greenComponent, 1.0)
        XCTAssertEqual(UIColor.magenta.greenComponent, 0.0)
        XCTAssertEqual(UIColor.yellow.greenComponent, 1.0)
        XCTAssertEqual(UIColor.black.greenComponent, 0.0)
        XCTAssertEqual(UIColor.white.greenComponent, 1.0)
        XCTAssertEqual(UIColor.clear.greenComponent, 0.0)
    }

    func testBlueComponent() {
        XCTAssertEqual(UIColor.red.blueComponent, 0.0)
        XCTAssertEqual(UIColor.green.blueComponent, 0.0)
        XCTAssertEqual(UIColor.blue.blueComponent, 1.0)
        XCTAssertEqual(UIColor.cyan.blueComponent, 1.0)
        XCTAssertEqual(UIColor.magenta.blueComponent, 1.0)
        XCTAssertEqual(UIColor.yellow.blueComponent, 0.0)
        XCTAssertEqual(UIColor.black.blueComponent, 0.0)
        XCTAssertEqual(UIColor.white.blueComponent, 1.0)
        XCTAssertEqual(UIColor.clear.blueComponent, 0.0)
    }

    func testAlphaComponent() {
        XCTAssertEqual(UIColor.red.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.green.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.blue.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.cyan.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.magenta.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.yellow.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.black.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.white.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.clear.alphaComponent, 0.0)
    }

    func testHueComponent() {
        XCTAssertEqual(UIColor.red.hueComponent, 0.0 / 360.0)
        XCTAssertEqual(UIColor.green.hueComponent, 120.0 / 360.0)
        XCTAssertEqual(UIColor.blue.hueComponent, 240.0 / 360.0)
        XCTAssertEqual(UIColor.cyan.hueComponent, 180.0 / 360.0)
        XCTAssertEqual(UIColor.magenta.hueComponent, 300.0 / 360.0)
        XCTAssertEqual(UIColor.yellow.hueComponent, 60.0 / 360.0)
        XCTAssertEqual(UIColor.black.hueComponent, 0.0)
        XCTAssertEqual(UIColor.white.hueComponent, 0.0)
        XCTAssertEqual(UIColor.clear.hueComponent, 0.0)
    }

    func testSaturationComponent() {
        XCTAssertEqual(UIColor.red.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.green.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.blue.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.cyan.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.magenta.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.yellow.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.black.saturationComponent, 0.0)
        XCTAssertEqual(UIColor.white.saturationComponent, 0.0)
        XCTAssertEqual(UIColor.clear.saturationComponent, 0.0)
    }

    func testBrightnessComponent() {
        XCTAssertEqual(UIColor.red.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.green.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.blue.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.cyan.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.magenta.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.yellow.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.black.brightnessComponent, 0.0)
        XCTAssertEqual(UIColor.white.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.clear.brightnessComponent, 0.0)
    }

    func testWhiteComponent() {
        XCTAssertEqual(UIColor.red.whiteComponent, 0.5090234875679016)
        XCTAssertEqual(UIColor.green.whiteComponent, 0.8633751273155212)
        XCTAssertEqual(UIColor.blue.whiteComponent, 0.2730749249458313)
        XCTAssertEqual(UIColor.cyan.whiteComponent, 0.894962728023529)
        XCTAssertEqual(UIColor.magenta.whiteComponent, 0.568579375743866)
        XCTAssertEqual(UIColor.yellow.whiteComponent, 0.9728571772575378)
        XCTAssertEqual(UIColor.black.whiteComponent, 0.0)
        XCTAssertEqual(UIColor.white.whiteComponent, 1.0)
        XCTAssertEqual(UIColor.clear.whiteComponent, 0.0)
    }

}
