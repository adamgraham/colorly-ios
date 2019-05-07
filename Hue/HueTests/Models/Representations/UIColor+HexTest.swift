//
//  UIColor+HexTest.swift
//  HueTests
//
//  Created by Adam Graham on 4/17/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HexTest: XCTestCase {

    func testHexInt() {
        XCTAssertEqual(UIColor.white.hex, 0xffffff)
        XCTAssertEqual(UIColor.red.hex, 0xff0000)
        XCTAssertEqual(UIColor.green.hex, 0x00ff00)
        XCTAssertEqual(UIColor.blue.hex, 0x0000ff)
        XCTAssertEqual(UIColor.cyan.hex, 0x00ffff)
        XCTAssertEqual(UIColor.magenta.hex, 0xff00ff)
        XCTAssertEqual(UIColor.yellow.hex, 0xffff00)
        XCTAssertEqual(UIColor.black.hex, 0x000000)
        XCTAssertEqual(UIColor.darkGray.hex, 0x555555)
        XCTAssertEqual(UIColor.gray.hex, 0x808080)
        XCTAssertEqual(UIColor.lightGray.hex, 0xaaaaaa)
        XCTAssertEqual(UIColor.clear.hex, 0x000000)
    }

    func testHexIntInit() {
        XCTAssertEqual(UIColor(hex: 0xffffff), .white)
        XCTAssertEqual(UIColor(hex: 0xff0000), .red)
        XCTAssertEqual(UIColor(hex: 0x00ff00), .green)
        XCTAssertEqual(UIColor(hex: 0x0000ff), .blue)
        XCTAssertEqual(UIColor(hex: 0x00ffff), .cyan)
        XCTAssertEqual(UIColor(hex: 0xff00ff), .magenta)
        XCTAssertEqual(UIColor(hex: 0xffff00), .yellow)
        XCTAssertEqual(UIColor(hex: 0x000000), .black)
        XCTAssertEqual(UIColor(hex: 0x555555), .darkGray)
        XCTAssertEqual(UIColor(hex: 0x808080), .gray, accuracy: 0.01)
        XCTAssertEqual(UIColor(hex: 0xaaaaaa), .lightGray)
        XCTAssertEqual(UIColor(hex: 0x000000, alpha: 0.0), .clear)
    }

    func testHexString() {
        XCTAssertEqual(UIColor.white.hexString, "#ffffff")
        XCTAssertEqual(UIColor.red.hexString, "#ff0000")
        XCTAssertEqual(UIColor.green.hexString, "#00ff00")
        XCTAssertEqual(UIColor.blue.hexString, "#0000ff")
        XCTAssertEqual(UIColor.cyan.hexString, "#00ffff")
        XCTAssertEqual(UIColor.magenta.hexString, "#ff00ff")
        XCTAssertEqual(UIColor.yellow.hexString, "#ffff00")
        XCTAssertEqual(UIColor.black.hexString, "#000000")
        XCTAssertEqual(UIColor.darkGray.hexString, "#555555")
        XCTAssertEqual(UIColor.gray.hexString, "#808080")
        XCTAssertEqual(UIColor.lightGray.hexString, "#aaaaaa")
        XCTAssertEqual(UIColor.clear.hexString, "#000000")
    }

    func testHexStringInit() {
        XCTAssertEqual(UIColor(hex: "#ffffff")!, .white)
        XCTAssertEqual(UIColor(hex: "#ff0000")!, .red)
        XCTAssertEqual(UIColor(hex: "#00ff00")!, .green)
        XCTAssertEqual(UIColor(hex: "#0000ff")!, .blue)
        XCTAssertEqual(UIColor(hex: "#00ffff")!, .cyan)
        XCTAssertEqual(UIColor(hex: "#ff00ff")!, .magenta)
        XCTAssertEqual(UIColor(hex: "#ffff00")!, .yellow)
        XCTAssertEqual(UIColor(hex: "#000000")!, .black)
        XCTAssertEqual(UIColor(hex: "#555555")!, .darkGray)
        XCTAssertEqual(UIColor(hex: "#808080")!, .gray, accuracy: 0.01)
        XCTAssertEqual(UIColor(hex: "#aaaaaa")!, .lightGray)
        XCTAssertEqual(UIColor(hex: "#000000", alpha: 0.0)!, .clear)
        XCTAssertNil(UIColor(hex: "xyz"))
    }

    // MARK: ARGB Tests

    func testHexARGBInt() {
        XCTAssertEqual(UIColor.white.hex_ARGB, 0xffffffff)
        XCTAssertEqual(UIColor.red.hex_ARGB, 0xffff0000)
        XCTAssertEqual(UIColor.green.hex_ARGB, 0xff00ff00)
        XCTAssertEqual(UIColor.blue.hex_ARGB, 0xff0000ff)
        XCTAssertEqual(UIColor.cyan.hex_ARGB, 0xff00ffff)
        XCTAssertEqual(UIColor.magenta.hex_ARGB, 0xffff00ff)
        XCTAssertEqual(UIColor.yellow.hex_ARGB, 0xffffff00)
        XCTAssertEqual(UIColor.black.hex_ARGB, 0xff000000)
        XCTAssertEqual(UIColor.darkGray.hex_ARGB, 0xff555555)
        XCTAssertEqual(UIColor.gray.hex_ARGB, 0xff808080)
        XCTAssertEqual(UIColor.lightGray.hex_ARGB, 0xffaaaaaa)
        XCTAssertEqual(UIColor.clear.hex_ARGB, 0x00000000)
    }

    func testHexARGBIntInit() {
        XCTAssertEqual(UIColor(hex_ARGB: 0xffffffff), .white)
        XCTAssertEqual(UIColor(hex_ARGB: 0xffff0000), .red)
        XCTAssertEqual(UIColor(hex_ARGB: 0xff00ff00), .green)
        XCTAssertEqual(UIColor(hex_ARGB: 0xff0000ff), .blue)
        XCTAssertEqual(UIColor(hex_ARGB: 0xff00ffff), .cyan)
        XCTAssertEqual(UIColor(hex_ARGB: 0xffff00ff), .magenta)
        XCTAssertEqual(UIColor(hex_ARGB: 0xffffff00), .yellow)
        XCTAssertEqual(UIColor(hex_ARGB: 0xff000000), .black)
        XCTAssertEqual(UIColor(hex_ARGB: 0xff555555), .darkGray)
        XCTAssertEqual(UIColor(hex_ARGB: 0xff808080), .gray, accuracy: 0.01)
        XCTAssertEqual(UIColor(hex_ARGB: 0xffaaaaaa), .lightGray)
        XCTAssertEqual(UIColor(hex_ARGB: 0x00000000), .clear)
    }

    func testHexARGBString() {
        XCTAssertEqual(UIColor.white.hexString_ARGB, "#ffffffff")
        XCTAssertEqual(UIColor.red.hexString_ARGB, "#ffff0000")
        XCTAssertEqual(UIColor.green.hexString_ARGB, "#ff00ff00")
        XCTAssertEqual(UIColor.blue.hexString_ARGB, "#ff0000ff")
        XCTAssertEqual(UIColor.cyan.hexString_ARGB, "#ff00ffff")
        XCTAssertEqual(UIColor.magenta.hexString_ARGB, "#ffff00ff")
        XCTAssertEqual(UIColor.yellow.hexString_ARGB, "#ffffff00")
        XCTAssertEqual(UIColor.black.hexString_ARGB, "#ff000000")
        XCTAssertEqual(UIColor.darkGray.hexString_ARGB, "#ff555555")
        XCTAssertEqual(UIColor.gray.hexString_ARGB, "#ff808080")
        XCTAssertEqual(UIColor.lightGray.hexString_ARGB, "#ffaaaaaa")
        XCTAssertEqual(UIColor.clear.hexString_ARGB, "#00000000")
    }

    func testHexARGBStringInit() {
        XCTAssertEqual(UIColor(hex_ARGB: "#ffffffff")!, .white)
        XCTAssertEqual(UIColor(hex_ARGB: "#ffff0000")!, .red)
        XCTAssertEqual(UIColor(hex_ARGB: "#ff00ff00")!, .green)
        XCTAssertEqual(UIColor(hex_ARGB: "#ff0000ff")!, .blue)
        XCTAssertEqual(UIColor(hex_ARGB: "#ff00ffff")!, .cyan)
        XCTAssertEqual(UIColor(hex_ARGB: "#ffff00ff")!, .magenta)
        XCTAssertEqual(UIColor(hex_ARGB: "#ffffff00")!, .yellow)
        XCTAssertEqual(UIColor(hex_ARGB: "#ff000000")!, .black)
        XCTAssertEqual(UIColor(hex_ARGB: "#ff555555")!, .darkGray)
        XCTAssertEqual(UIColor(hex_ARGB: "#ff808080")!, .gray, accuracy: 0.01)
        XCTAssertEqual(UIColor(hex_ARGB: "#ffaaaaaa")!, .lightGray)
        XCTAssertEqual(UIColor(hex_ARGB: "#00000000")!, .clear)
        XCTAssertNil(UIColor(hex_ARGB: "xyz"))
    }

    // MARK: RGBA Tests

    func testHexRGBAInt() {
        XCTAssertEqual(UIColor.white.hex_RGBA, 0xffffffff)
        XCTAssertEqual(UIColor.red.hex_RGBA, 0xff0000ff)
        XCTAssertEqual(UIColor.green.hex_RGBA, 0x00ff00ff)
        XCTAssertEqual(UIColor.blue.hex_RGBA, 0x0000ffff)
        XCTAssertEqual(UIColor.cyan.hex_RGBA, 0x00ffffff)
        XCTAssertEqual(UIColor.magenta.hex_RGBA, 0xff00ffff)
        XCTAssertEqual(UIColor.yellow.hex_RGBA, 0xffff00ff)
        XCTAssertEqual(UIColor.black.hex_RGBA, 0x000000ff)
        XCTAssertEqual(UIColor.darkGray.hex_RGBA, 0x555555ff)
        XCTAssertEqual(UIColor.gray.hex_RGBA, 0x808080ff)
        XCTAssertEqual(UIColor.lightGray.hex_RGBA, 0xaaaaaaff)
        XCTAssertEqual(UIColor.clear.hex_RGBA, 0x00000000)
    }

    func testHexRGBAIntInit() {
        XCTAssertEqual(UIColor(hex_RGBA: 0xffffffff), .white)
        XCTAssertEqual(UIColor(hex_RGBA: 0xff0000ff), .red)
        XCTAssertEqual(UIColor(hex_RGBA: 0x00ff00ff), .green)
        XCTAssertEqual(UIColor(hex_RGBA: 0x0000ffff), .blue)
        XCTAssertEqual(UIColor(hex_RGBA: 0x00ffffff), .cyan)
        XCTAssertEqual(UIColor(hex_RGBA: 0xff00ffff), .magenta)
        XCTAssertEqual(UIColor(hex_RGBA: 0xffff00ff), .yellow)
        XCTAssertEqual(UIColor(hex_RGBA: 0x000000ff), .black)
        XCTAssertEqual(UIColor(hex_RGBA: 0x555555ff), .darkGray)
        XCTAssertEqual(UIColor(hex_RGBA: 0x808080ff), .gray, accuracy: 0.01)
        XCTAssertEqual(UIColor(hex_RGBA: 0xaaaaaaff), .lightGray)
        XCTAssertEqual(UIColor(hex_RGBA: 0x00000000), .clear)
    }

    func testHexRGBAString() {
        XCTAssertEqual(UIColor.white.hexString_RGBA, "#ffffffff")
        XCTAssertEqual(UIColor.red.hexString_RGBA, "#ff0000ff")
        XCTAssertEqual(UIColor.green.hexString_RGBA, "#00ff00ff")
        XCTAssertEqual(UIColor.blue.hexString_RGBA, "#0000ffff")
        XCTAssertEqual(UIColor.cyan.hexString_RGBA, "#00ffffff")
        XCTAssertEqual(UIColor.magenta.hexString_RGBA, "#ff00ffff")
        XCTAssertEqual(UIColor.yellow.hexString_RGBA, "#ffff00ff")
        XCTAssertEqual(UIColor.black.hexString_RGBA, "#000000ff")
        XCTAssertEqual(UIColor.darkGray.hexString_RGBA, "#555555ff")
        XCTAssertEqual(UIColor.gray.hexString_RGBA, "#808080ff")
        XCTAssertEqual(UIColor.lightGray.hexString_RGBA, "#aaaaaaff")
        XCTAssertEqual(UIColor.clear.hexString_RGBA, "#00000000")
    }

    func testHexRGBAStringInit() {
        XCTAssertEqual(UIColor(hex_RGBA: "#ffffffff")!, .white)
        XCTAssertEqual(UIColor(hex_RGBA: "#ff0000ff")!, .red)
        XCTAssertEqual(UIColor(hex_RGBA: "#00ff00ff")!, .green)
        XCTAssertEqual(UIColor(hex_RGBA: "#0000ffff")!, .blue)
        XCTAssertEqual(UIColor(hex_RGBA: "#00ffffff")!, .cyan)
        XCTAssertEqual(UIColor(hex_RGBA: "#ff00ffff")!, .magenta)
        XCTAssertEqual(UIColor(hex_RGBA: "#ffff00ff")!, .yellow)
        XCTAssertEqual(UIColor(hex_RGBA: "#000000ff")!, .black)
        XCTAssertEqual(UIColor(hex_RGBA: "#555555ff")!, .darkGray)
        XCTAssertEqual(UIColor(hex_RGBA: "#808080ff")!, .gray, accuracy: 0.01)
        XCTAssertEqual(UIColor(hex_RGBA: "#aaaaaaff")!, .lightGray)
        XCTAssertEqual(UIColor(hex_RGBA: "#00000000")!, .clear)
        XCTAssertNil(UIColor(hex_RGBA: "xyz"))
    }

}
