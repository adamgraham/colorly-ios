//
//  UIColor+HSITest.swift
//  HueTests
//
//  Created by Adam Graham on 5/26/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_HSITest: XCTestCase {

    typealias HSI = UIColor.HSI

    func testHSI() {
        XCTAssertEqual(UIColor.white.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 1.0))
        XCTAssertEqual(UIColor.red.hsi, HSI(hue: 0.0, saturation: 1.0, intensity: 1.0/3.0))
        XCTAssertEqual(UIColor.green.hsi, HSI(hue: 120.0, saturation: 1.0, intensity: 1.0/3.0))
        XCTAssertEqual(UIColor.blue.hsi, HSI(hue: 240.0, saturation: 1.0, intensity: 1.0/3.0))
        XCTAssertEqual(UIColor.cyan.hsi, HSI(hue: 180.0, saturation: 1.0, intensity: 2.0/3.0))
        XCTAssertEqual(UIColor.magenta.hsi, HSI(hue: 300.0, saturation: 1.0, intensity: 2.0/3.0))
        XCTAssertEqual(UIColor.yellow.hsi, HSI(hue: 60.0, saturation: 1.0, intensity: 2.0/3.0))
        XCTAssertEqual(UIColor.black.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 0.0))
        XCTAssertEqual(UIColor.darkGray.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 1.0/3.0))
        XCTAssertEqual(UIColor.gray.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 0.5))
        XCTAssertEqual(UIColor.lightGray.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 2.0/3.0))
        XCTAssertEqual(UIColor.clear.hsi, HSI(hue: 0.0, saturation: 0.0, intensity: 0.0))
    }

    func testHSIInit() {
        XCTAssertEqual(UIColor(hsi: HSI(hue: 0.0, saturation: 0.0, intensity: 1.0)), .white)
        XCTAssertEqual(UIColor(hsi: HSI(hue: 0.0, saturation: 1.0, intensity: 1.0/3.0)), .red)
        XCTAssertEqual(UIColor(hsi: HSI(hue: 120.0, saturation: 1.0, intensity: 1.0/3.0)), .green)
        XCTAssertEqual(UIColor(hsi: HSI(hue: 240.0, saturation: 1.0, intensity: 1.0/3.0)), .blue)
        XCTAssertEqual(UIColor(hsi: HSI(hue: 180.0, saturation: 1.0, intensity: 2.0/3.0)), .cyan)
        XCTAssertEqual(UIColor(hsi: HSI(hue: 300.0, saturation: 1.0, intensity: 2.0/3.0)), .magenta)
        XCTAssertEqual(UIColor(hsi: HSI(hue: 60.0, saturation: 1.0, intensity: 2.0/3.0)), .yellow)
        XCTAssertEqual(UIColor(hsi: HSI(hue: 0.0, saturation: 0.0, intensity: 0.0)), .black)
        XCTAssertEqual(UIColor(hsi: HSI(hue: 0.0, saturation: 0.0, intensity: 1.0/3.0)), .darkGray)
        XCTAssertEqual(UIColor(hsi: HSI(hue: 0.0, saturation: 0.0, intensity: 0.5)), .gray)
        XCTAssertEqual(UIColor(hsi: HSI(hue: 0.0, saturation: 0.0, intensity: 2.0/3.0)), .lightGray)
        XCTAssertEqual(UIColor(hsi: HSI(hue: 0.0, saturation: 0.0, intensity: 0.0), alpha: 0.0), .clear)
    }

}
