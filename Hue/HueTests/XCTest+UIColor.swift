//
//  XCTest+UIColor.swift
//  HueTests
//
//  Created by Adam Graham on 4/23/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest
import UIKit

func XCTAssertEqual(_ lhs: UIColor, _ rhs: UIColor, accuracy: CGFloat = .ulpOfOne) {
    var (r1, g1, b1, a1) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
    lhs.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)

    var (r2, g2, b2, a2) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
    rhs.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

    XCTAssertEqual(r1, r2, accuracy: accuracy)
    XCTAssertEqual(g1, g2, accuracy: accuracy)
    XCTAssertEqual(b1, b2, accuracy: accuracy)
    XCTAssertEqual(a1, a2, accuracy: accuracy)
}
