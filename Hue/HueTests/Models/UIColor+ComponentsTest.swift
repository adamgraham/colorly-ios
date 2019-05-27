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

    // MARK: RGB Tests

    func testRedComponent() {
        XCTAssertEqual(UIColor.white.redComponent, 1.0)
        XCTAssertEqual(UIColor.red.redComponent, 1.0)
        XCTAssertEqual(UIColor.green.redComponent, 0.0)
        XCTAssertEqual(UIColor.blue.redComponent, 0.0)
        XCTAssertEqual(UIColor.cyan.redComponent, 0.0)
        XCTAssertEqual(UIColor.magenta.redComponent, 1.0)
        XCTAssertEqual(UIColor.yellow.redComponent, 1.0)
        XCTAssertEqual(UIColor.black.redComponent, 0.0)
        XCTAssertEqual(UIColor.clear.redComponent, 0.0)
    }

    func testGreenComponent() {
        XCTAssertEqual(UIColor.white.greenComponent, 1.0)
        XCTAssertEqual(UIColor.red.greenComponent, 0.0)
        XCTAssertEqual(UIColor.green.greenComponent, 1.0)
        XCTAssertEqual(UIColor.blue.greenComponent, 0.0)
        XCTAssertEqual(UIColor.cyan.greenComponent, 1.0)
        XCTAssertEqual(UIColor.magenta.greenComponent, 0.0)
        XCTAssertEqual(UIColor.yellow.greenComponent, 1.0)
        XCTAssertEqual(UIColor.black.greenComponent, 0.0)
        XCTAssertEqual(UIColor.clear.greenComponent, 0.0)
    }

    func testBlueComponent() {
        XCTAssertEqual(UIColor.white.blueComponent, 1.0)
        XCTAssertEqual(UIColor.red.blueComponent, 0.0)
        XCTAssertEqual(UIColor.green.blueComponent, 0.0)
        XCTAssertEqual(UIColor.blue.blueComponent, 1.0)
        XCTAssertEqual(UIColor.cyan.blueComponent, 1.0)
        XCTAssertEqual(UIColor.magenta.blueComponent, 1.0)
        XCTAssertEqual(UIColor.yellow.blueComponent, 0.0)
        XCTAssertEqual(UIColor.black.blueComponent, 0.0)
        XCTAssertEqual(UIColor.clear.blueComponent, 0.0)
    }

    func testAlphaComponent() {
        XCTAssertEqual(UIColor.white.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.red.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.green.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.blue.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.cyan.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.magenta.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.yellow.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.black.alphaComponent, 1.0)
        XCTAssertEqual(UIColor.clear.alphaComponent, 0.0)
    }

    func testRGBComponents() {
        assert(rgb: UIColor.white.rgbComponents, (1.0, 1.0, 1.0))
        assert(rgb: UIColor.red.rgbComponents, (1.0, 0.0, 0.0))
        assert(rgb: UIColor.green.rgbComponents, (0.0, 1.0, 0.0))
        assert(rgb: UIColor.blue.rgbComponents, (0.0, 0.0, 1.0))
        assert(rgb: UIColor.cyan.rgbComponents, (0.0, 1.0, 1.0))
        assert(rgb: UIColor.magenta.rgbComponents, (1.0, 0.0, 1.0))
        assert(rgb: UIColor.yellow.rgbComponents, (1.0, 1.0, 0.0))
        assert(rgb: UIColor.black.rgbComponents, (0.0, 0.0, 0.0))
        assert(rgb: UIColor.clear.rgbComponents, (0.0, 0.0, 0.0))
    }

    func testRGBInit() {
        XCTAssertEqual(UIColor(rgb: (r: 1.0, g: 1.0, b: 1.0)), .white)
        XCTAssertEqual(UIColor(rgb: (r: 1.0, g: 0.0, b: 0.0)), .red)
        XCTAssertEqual(UIColor(rgb: (r: 0.0, g: 1.0, b: 0.0)), .green)
        XCTAssertEqual(UIColor(rgb: (r: 0.0, g: 0.0, b: 1.0)), .blue)
        XCTAssertEqual(UIColor(rgb: (r: 0.0, g: 1.0, b: 1.0)), .cyan)
        XCTAssertEqual(UIColor(rgb: (r: 1.0, g: 0.0, b: 1.0)), .magenta)
        XCTAssertEqual(UIColor(rgb: (r: 1.0, g: 1.0, b: 0.0)), .yellow)
        XCTAssertEqual(UIColor(rgb: (r: 0.0, g: 0.0, b: 0.0)), .black)
        XCTAssertEqual(UIColor(rgb: (r: 0.0, g: 0.0, b: 0.0), alpha: 0.0), .clear)
    }

    func testRGBAComponents() {
        assert(rgba: UIColor.white.rgbaComponents, (1.0, 1.0, 1.0, 1.0))
        assert(rgba: UIColor.red.rgbaComponents, (1.0, 0.0, 0.0, 1.0))
        assert(rgba: UIColor.green.rgbaComponents, (0.0, 1.0, 0.0, 1.0))
        assert(rgba: UIColor.blue.rgbaComponents, (0.0, 0.0, 1.0, 1.0))
        assert(rgba: UIColor.cyan.rgbaComponents, (0.0, 1.0, 1.0, 1.0))
        assert(rgba: UIColor.magenta.rgbaComponents, (1.0, 0.0, 1.0, 1.0))
        assert(rgba: UIColor.yellow.rgbaComponents, (1.0, 1.0, 0.0, 1.0))
        assert(rgba: UIColor.black.rgbaComponents, (0.0, 0.0, 0.0, 1.0))
        assert(rgba: UIColor.clear.rgbaComponents, (0.0, 0.0, 0.0, 0.0))
    }

    func testRGBAInit() {
        XCTAssertEqual(UIColor(rgba: (r: 1.0, g: 1.0, b: 1.0, a: 1.0)), .white)
        XCTAssertEqual(UIColor(rgba: (r: 1.0, g: 0.0, b: 0.0, a: 1.0)), .red)
        XCTAssertEqual(UIColor(rgba: (r: 0.0, g: 1.0, b: 0.0, a: 1.0)), .green)
        XCTAssertEqual(UIColor(rgba: (r: 0.0, g: 0.0, b: 1.0, a: 1.0)), .blue)
        XCTAssertEqual(UIColor(rgba: (r: 0.0, g: 1.0, b: 1.0, a: 1.0)), .cyan)
        XCTAssertEqual(UIColor(rgba: (r: 1.0, g: 0.0, b: 1.0, a: 1.0)), .magenta)
        XCTAssertEqual(UIColor(rgba: (r: 1.0, g: 1.0, b: 0.0, a: 1.0)), .yellow)
        XCTAssertEqual(UIColor(rgba: (r: 0.0, g: 0.0, b: 0.0, a: 1.0)), .black)
        XCTAssertEqual(UIColor(rgba: (r: 0.0, g: 0.0, b: 0.0, a: 0.0)), .clear)
    }

    func testARGBComponents() {
        assert(argb: UIColor.white.argbComponents, (1.0, 1.0, 1.0, 1.0))
        assert(argb: UIColor.red.argbComponents, (1.0, 1.0, 0.0, 0.0))
        assert(argb: UIColor.green.argbComponents, (1.0, 0.0, 1.0, 0.0))
        assert(argb: UIColor.blue.argbComponents, (1.0, 0.0, 0.0, 1.0))
        assert(argb: UIColor.cyan.argbComponents, (1.0, 0.0, 1.0, 1.0))
        assert(argb: UIColor.magenta.argbComponents, (1.0, 1.0, 0.0, 1.0))
        assert(argb: UIColor.yellow.argbComponents, (1.0, 1.0, 1.0, 0.0))
        assert(argb: UIColor.black.argbComponents, (1.0, 0.0, 0.0, 0.0))
        assert(argb: UIColor.clear.argbComponents, (0.0, 0.0, 0.0, 0.0))
    }

    func testARGBInit() {
        XCTAssertEqual(UIColor(argb: (a: 1.0, r: 1.0, g: 1.0, b: 1.0)), .white)
        XCTAssertEqual(UIColor(argb: (a: 1.0, r: 1.0, g: 0.0, b: 0.0)), .red)
        XCTAssertEqual(UIColor(argb: (a: 1.0, r: 0.0, g: 1.0, b: 0.0)), .green)
        XCTAssertEqual(UIColor(argb: (a: 1.0, r: 0.0, g: 0.0, b: 1.0)), .blue)
        XCTAssertEqual(UIColor(argb: (a: 1.0, r: 0.0, g: 1.0, b: 1.0)), .cyan)
        XCTAssertEqual(UIColor(argb: (a: 1.0, r: 1.0, g: 0.0, b: 1.0)), .magenta)
        XCTAssertEqual(UIColor(argb: (a: 1.0, r: 1.0, g: 1.0, b: 0.0)), .yellow)
        XCTAssertEqual(UIColor(argb: (a: 1.0, r: 0.0, g: 0.0, b: 0.0)), .black)
        XCTAssertEqual(UIColor(argb: (a: 0.0, r: 0.0, g: 0.0, b: 0.0)), .clear)
    }

    private func assert(rgb: (r: CGFloat, g: CGFloat, b: CGFloat), _ expected: (r: CGFloat, g: CGFloat, b: CGFloat)) {
        XCTAssertEqual(rgb.r, expected.r)
        XCTAssertEqual(rgb.g, expected.g)
        XCTAssertEqual(rgb.b, expected.b)
    }

    private func assert(rgba: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat), _ expected: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)) {
        XCTAssertEqual(rgba.r, expected.r)
        XCTAssertEqual(rgba.g, expected.g)
        XCTAssertEqual(rgba.b, expected.b)
        XCTAssertEqual(rgba.a, expected.a)
    }

    private func assert(argb: (a: CGFloat, r: CGFloat, g: CGFloat, b: CGFloat), _ expected: (a: CGFloat, r: CGFloat, g: CGFloat, b: CGFloat)) {
        XCTAssertEqual(argb.a, expected.a)
        XCTAssertEqual(argb.r, expected.r)
        XCTAssertEqual(argb.g, expected.g)
        XCTAssertEqual(argb.b, expected.b)
    }

    // MARK: HSB Tests

    func testHueComponent() {
        XCTAssertEqual(UIColor.white.hueComponent, 0.0)
        XCTAssertEqual(UIColor.red.hueComponent, 0.0 / 360.0)
        XCTAssertEqual(UIColor.green.hueComponent, 120.0 / 360.0)
        XCTAssertEqual(UIColor.blue.hueComponent, 240.0 / 360.0)
        XCTAssertEqual(UIColor.cyan.hueComponent, 180.0 / 360.0)
        XCTAssertEqual(UIColor.magenta.hueComponent, 300.0 / 360.0)
        XCTAssertEqual(UIColor.yellow.hueComponent, 60.0 / 360.0)
        XCTAssertEqual(UIColor.black.hueComponent, 0.0)
        XCTAssertEqual(UIColor.clear.hueComponent, 0.0)
    }

    func testSaturationComponent() {
        XCTAssertEqual(UIColor.white.saturationComponent, 0.0)
        XCTAssertEqual(UIColor.red.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.green.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.blue.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.cyan.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.magenta.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.yellow.saturationComponent, 1.0)
        XCTAssertEqual(UIColor.black.saturationComponent, 0.0)
        XCTAssertEqual(UIColor.clear.saturationComponent, 0.0)
    }

    func testBrightnessComponent() {
        XCTAssertEqual(UIColor.white.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.red.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.green.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.blue.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.cyan.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.magenta.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.yellow.brightnessComponent, 1.0)
        XCTAssertEqual(UIColor.black.brightnessComponent, 0.0)
        XCTAssertEqual(UIColor.clear.brightnessComponent, 0.0)
    }

    func testHSBComponents() {
        assert(hsb: UIColor.white.hsbComponents, (0.0, 0.0, 1.0))
        assert(hsb: UIColor.red.hsbComponents, (0.0 / 360.0, 1.0, 1.0))
        assert(hsb: UIColor.green.hsbComponents, (120.0 / 360.0, 1.0, 1.0))
        assert(hsb: UIColor.blue.hsbComponents, (240.0 / 360.0, 1.0, 1.0))
        assert(hsb: UIColor.cyan.hsbComponents, (180.0 / 360.0, 1.0, 1.0))
        assert(hsb: UIColor.magenta.hsbComponents, (300.0 / 360.0, 1.0, 1.0))
        assert(hsb: UIColor.yellow.hsbComponents, (60.0 / 360.0, 1.0, 1.0))
        assert(hsb: UIColor.black.hsbComponents, (0.0, 0.0, 0.0))
        assert(hsb: UIColor.clear.hsbComponents, (0.0, 0.0, 0.0))
    }

    func testHSBInit() {
        XCTAssertEqual(UIColor(hsb: (h: 0.0, s: 0.0, b: 1.0)), .white)
        XCTAssertEqual(UIColor(hsb: (h: 0.0 / 360.0, s: 1.0, b: 1.0)), .red)
        XCTAssertEqual(UIColor(hsb: (h: 120.0 / 360.0, s: 1.0, b: 1.0)), .green)
        XCTAssertEqual(UIColor(hsb: (h: 240.0 / 360.0, s: 1.0, b: 1.0)), .blue)
        XCTAssertEqual(UIColor(hsb: (h: 180.0 / 360.0, s: 1.0, b: 1.0)), .cyan)
        XCTAssertEqual(UIColor(hsb: (h: 300.0 / 360.0, s: 1.0, b: 1.0)), .magenta)
        XCTAssertEqual(UIColor(hsb: (h: 60.0 / 360.0, s: 1.0, b: 1.0)), .yellow)
        XCTAssertEqual(UIColor(hsb: (h: 0.0, s: 0.0, b: 0.0)), .black)
        XCTAssertEqual(UIColor(hsb: (h: 0.0, s: 0.0, b: 0.0), alpha: 0.0), .clear)
    }

    private func assert(hsb: (h: CGFloat, s: CGFloat, b: CGFloat), _ expected: (h: CGFloat, s: CGFloat, b: CGFloat)) {
        XCTAssertEqual(hsb.h, expected.h)
        XCTAssertEqual(hsb.s, expected.s)
        XCTAssertEqual(hsb.b, expected.b)
    }

    // MARK: Grayscale Tests

    func testWhiteComponent() {
        XCTAssertEqual(UIColor.white.whiteComponent, 1.0)
        XCTAssertEqual(UIColor.red.whiteComponent, 0.5090234875679016)
        XCTAssertEqual(UIColor.green.whiteComponent, 0.8633751273155212)
        XCTAssertEqual(UIColor.blue.whiteComponent, 0.2730749249458313)
        XCTAssertEqual(UIColor.cyan.whiteComponent, 0.894962728023529)
        XCTAssertEqual(UIColor.magenta.whiteComponent, 0.568579375743866)
        XCTAssertEqual(UIColor.yellow.whiteComponent, 0.9728571772575378)
        XCTAssertEqual(UIColor.black.whiteComponent, 0.0)
        XCTAssertEqual(UIColor.clear.whiteComponent, 0.0)
    }

}
