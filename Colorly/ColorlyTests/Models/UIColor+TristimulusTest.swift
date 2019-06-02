//
//  UIColor+TristimulusTest.swift
//  ColorlyTests
//
//  Created by Adam Graham on 5/6/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Colorly

class UIColor_TristimulusTest: XCTestCase {

    func test() {
        let XYZ = UIColor.Tristimulus(X: 1.0, Y: 2.0, Z: 3.0)
        XCTAssertEqual(XYZ.X, 1.0)
        XCTAssertEqual(XYZ.Y, 2.0)
        XCTAssertEqual(XYZ.Z, 3.0)
    }

}
