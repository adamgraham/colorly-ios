//
//  UIColor+TintAndShade.swift
//  Hue
//
//  Created by Adam Graham on 3/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

public extension UIColor {

    func shade(percent: CGFloat = 0.1) -> UIColor {
        return mixed(with: .black, weight: percent)
    }

    func tint(percent: CGFloat = 0.1) -> UIColor {
        return mixed(with: .white, weight: percent)
    }

    func tone(percent: CGFloat = 0.1) -> UIColor {
        return mixed(with: .gray, weight: percent)
    }

}
