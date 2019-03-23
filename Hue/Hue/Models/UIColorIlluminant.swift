//
//  UIColorIlluminant.swift
//  ColorPalette
//
//  Created by Adam Graham on 12/20/18.
//  Copyright © 2018 Adam Graham. All rights reserved.
//

import UIKit

public extension UIColor {

    public enum Illuminant {

        /// Incandescent/Tungsten
        case a
        /// Old Direct Sunlight at Noon
        case b
        /// Old Daylight
        case c
        /// ICC Profile PCS
        case d50
        /// Mid-morning Daylight
        case d55
        /// Daylight, sRGB, Adobe-RGB
        case d65
        /// North Sky Daylight
        case d75
        /// Equal Energy
        case e
        /// Daylight Fluorescent
        case f1
        /// Cool Fluorescent
        case f2
        /// White Fluorescent
        case f3
        /// Warm White Fluorescent
        case f4
        /// Daylight Fluorescent
        case f5
        /// Lite White Fluorescent
        case f6
        /// Daylight Fluorescent, D65 Simulator
        case f7
        /// Sylvania F40, D50 Simulator
        case f8
        /// Cool White Fluorescent
        case f9
        /// Ultralume 50, Philips TL85
        case f10
        /// Ultralume 40, Philips TL84
        case f11
        /// Ultralume 30, Philips TL83
        case f12

        /// 2° (CIE 1931)
        var twoDegrees: (x: CGFloat, y: CGFloat, z: CGFloat) {
            switch self {
            case .a:
                return (109.850, 100.000, 35.585)
            case .b:
                return (99.0927, 100.000, 85.313)
            case .c:
                return (98.074,  100.000, 118.232)
            case .d50:
                return (96.422,  100.000, 82.521)
            case .d55:
                return (95.682,  100.000, 92.149)
            case .d65:
                return (95.047,  100.000, 108.883)
            case .d75:
                return (94.972,  100.000, 122.638)
            case .e:
                return (100.000, 100.000, 100.000)
            case .f1:
                return (92.834,  100.000, 103.665)
            case .f2:
                return (99.187,  100.000, 67.395)
            case .f3:
                return (103.754, 100.000, 49.861)
            case .f4:
                return (109.147, 100.000, 38.813)
            case .f5:
                return (90.872,  100.000, 98.723)
            case .f6:
                return (97.309,  100.000, 60.191)
            case .f7:
                return (95.044,  100.000, 108.755)
            case .f8:
                return (96.413,  100.000, 82.333)
            case .f9:
                return (100.365, 100.000, 67.868)
            case .f10:
                return (96.174,  100.000, 81.712)
            case .f11:
                return (100.966, 100.000, 64.370)
            case .f12:
                return (108.046, 100.000, 39.228)
            }
        }

        /// 10° (CIE 1964)
        var tenDegrees: (x: CGFloat, y: CGFloat, z: CGFloat) {
            switch self {
            case .a:
                return (111.144, 100.000, 35.200)
            case .b:
                return (99.178, 100.000, 84.3493)
            case .c:
                return (97.285, 100.000, 116.145)
            case .d50:
                return (96.720, 100.000, 81.427)
            case .d55:
                return (95.799, 100.000, 90.926)
            case .d65:
                return (94.811, 100.000, 107.304)
            case .d75:
                return (94.416, 100.000, 120.641)
            case .e:
                return (100.000, 100.000, 100.000)
            case .f1:
                return (94.791, 100.000, 103.191)
            case .f2:
                return (103.280, 100.000, 69.026)
            case .f3:
                return (108.968, 100.000, 51.965)
            case .f4:
                return (114.961, 100.000, 40.963)
            case .f5:
                return (93.369, 100.000, 98.636)
            case .f6:
                return (102.148, 100.000, 62.074)
            case .f7:
                return (95.792, 100.000, 107.687)
            case .f8:
                return (97.115, 100.000, 81.135)
            case .f9:
                return (102.116, 100.000, 67.826)
            case .f10:
                return (99.001, 100.000, 83.134)
            case .f11:
                return (103.866, 100.000, 65.627)
            case .f12:
                return (111.428, 100.000, 40.353)
            }
        }

    }

}
