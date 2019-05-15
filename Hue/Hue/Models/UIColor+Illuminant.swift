//
//  UIColor+Illuminant.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to define standard illuminants.
public extension UIColor {

    /// A standard illuminant defined by the International Commission on Illumination (CIE)
    /// which provides a basis for comparing images or colors recorded under different
    /// lighting.
    enum Illuminant {

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

    }

}

/// An extension to define CIE color-mapping functions called standard observers.
public extension UIColor {

    /// A CIE color-mapping function called the standard observer which represents an
    /// average human's chromatic response while observing an object under an illuminant.
    enum StandardObserver {

        /// CIE 1931 2° Standard Observer
        case two
        /// CIE 1964 10° Standard Observer
        case ten

    }

}

/// An extension to add reference white XYZ tristimulus values.
public extension UIColor.Illuminant {

    /// The XYZ tristimulus values of the white point (often referred to as reference white)
    /// of the illuminant for a given standard observer.
    /// - parameter observer: The standard observer with which the illuminant is observed.
    /// - parameter scale: The numerical scale/multiplier of the tristimulus values. XYZ values are
    ///                    usually in the range [0, 100], so the default value is 100.
    func whitePoint(for observer: UIColor.StandardObserver = .two, scale: CGFloat = 100.0) -> UIColor.Tristimulus {
        switch observer {
        case .two:
            let ref = self.two
            return UIColor.Tristimulus(X: ref.X * scale, Y: ref.Y * scale, Z: ref.Z * scale)
        case .ten:
            let ref = self.ten
            return UIColor.Tristimulus(X: ref.X * scale, Y: ref.Y * scale, Z: ref.Z * scale)
        }
    }

    /// CIE 1931 2° Standard Observer
    private var two: (X: CGFloat, Y: CGFloat, Z: CGFloat) {
        switch self {
        case .a:
            return (1.09850, 1.00000, 0.35585)
        case .b:
            return (0.99093, 1.00000, 0.85313)
        case .c:
            return (0.98074, 1.00000, 1.18232)
        case .d50:
            return (0.96422, 1.00000, 0.82521)
        case .d55:
            return (0.95682, 1.00000, 0.92149)
        case .d65:
            return (0.95047, 1.00000, 1.08883)
        case .d75:
            return (0.94972, 1.00000, 1.22638)
        case .e:
            return (1.00000, 1.00000, 1.00000)
        case .f1:
            return (0.92834, 1.00000, 1.03665)
        case .f2:
            return (0.99187, 1.00000, 0.67395)
        case .f3:
            return (1.03754, 1.00000, 0.49861)
        case .f4:
            return (1.09147, 1.00000, 0.38813)
        case .f5:
            return (0.90872, 1.00000, 0.98723)
        case .f6:
            return (0.97309, 1.00000, 0.60191)
        case .f7:
            return (0.95044, 1.00000, 1.08755)
        case .f8:
            return (0.96413, 1.00000, 0.82333)
        case .f9:
            return (1.00365, 1.00000, 0.67868)
        case .f10:
            return (0.96174, 1.00000, 0.81712)
        case .f11:
            return (1.00966, 1.00000, 0.64370)
        case .f12:
            return (1.08046, 1.00000, 0.39228)
        }
    }

    /// CIE 1964 10° Standard Observer
    private var ten: (X: CGFloat, Y: CGFloat, Z: CGFloat) {
        switch self {
        case .a:
            return (1.11144, 1.00000, 0.35200)
        case .b:
            return (0.99178, 1.00000, 0.84349)
        case .c:
            return (0.97285, 1.00000, 1.16145)
        case .d50:
            return (0.96720, 1.00000, 0.81427)
        case .d55:
            return (0.95799, 1.00000, 0.90926)
        case .d65:
            return (0.94811, 1.00000, 1.07304)
        case .d75:
            return (0.94416, 1.00000, 1.20641)
        case .e:
            return (1.00000, 1.00000, 1.00000)
        case .f1:
            return (0.94791, 1.00000, 1.03191)
        case .f2:
            return (1.03280, 1.00000, 0.69026)
        case .f3:
            return (1.08968, 1.00000, 0.51965)
        case .f4:
            return (1.14961, 1.00000, 0.40963)
        case .f5:
            return (0.93369, 1.00000, 0.98636)
        case .f6:
            return (1.02148, 1.00000, 0.62074)
        case .f7:
            return (0.95792, 1.00000, 1.07687)
        case .f8:
            return (0.97115, 1.00000, 0.81135)
        case .f9:
            return (1.02116, 1.00000, 0.67826)
        case .f10:
            return (0.99001, 1.00000, 0.83134)
        case .f11:
            return (1.03866, 1.00000, 0.65627)
        case .f12:
            return (1.11428, 1.00000, 0.40353)
        }
    }

}
