//
//  UIColor+QuantizationTest.swift
//  HueTests
//
//  Created by Adam Graham on 5/21/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_QuantizationTest: XCTestCase {

    func test5Clusters() {
        var color = UIColor(red: 0.0, green: 0.12, blue: 0.23, alpha: 1.0)
        XCTAssertEqual(color.quantized(clusters: 5),UIColor(red: 0.0, green: 0.2, blue: 0.2, alpha: 1.0))

        color = UIColor(red: 0.34, green: 0.45, blue: 0.56, alpha: 1.0)
        XCTAssertEqual(color.quantized(clusters: 5), UIColor(red: 0.4, green: 0.4, blue: 0.6, alpha: 1.0))

        color = UIColor(red: 0.67, green: 0.78, blue: 0.89, alpha: 1.0)
        XCTAssertEqual(color.quantized(clusters: 5), UIColor(red: 0.6, green: 0.8, blue: 0.8, alpha: 1.0))

        color = UIColor(red: 0.90, green: 1.0, blue: 0.0, alpha: 1.0)
        XCTAssertEqual(color.quantized(clusters: 5), UIColor(red: 0.8, green: 1.0, blue: 0.0, alpha: 1.0))
    }

    func test1Cluster() {
        var color = UIColor(red: 0.0, green: 0.12, blue: 0.23, alpha: 1.0)
        XCTAssertEqual(color.quantized(clusters: 1),UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))

        color = UIColor(red: 0.34, green: 0.45, blue: 0.56, alpha: 1.0)
        XCTAssertEqual(color.quantized(clusters: 1), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0))

        color = UIColor(red: 0.67, green: 0.78, blue: 0.89, alpha: 1.0)
        XCTAssertEqual(color.quantized(clusters: 1), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }

}
