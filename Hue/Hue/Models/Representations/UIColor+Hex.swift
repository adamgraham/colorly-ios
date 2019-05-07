//
//  UIColor+Hex.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to instantiate and represent RGB colors with hexadecimal values.
public extension UIColor {

    /// Initializes a color using a hexadecimal integer in the RGB format (RRGGBB), e.g., 0xffff00.
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let components = (
            red:   CGFloat((hex >> 16) & 0xff) / 0xff,
            green: CGFloat((hex >> 08) & 0xff) / 0xff,
            blue:  CGFloat((hex >> 00) & 0xff) / 0xff
        )

        self.init(red: components.red, green: components.green, blue: components.blue, alpha: alpha)
    }

    /// Initializes a color using a hexadecimal string in the RGB format (RRGGBB), e.g., "#ffff00".
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        guard let value = Int(hex: hex) else { return nil }
        self.init(hex: value, alpha: alpha)
    }

    /// The hexadecimal integer value of the color in the RGB format (RRGGBB), e.g., 0xffff00.
    var hex: Int {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0

        getRed(&red, green: &green, blue: &blue, alpha: nil)

        return (Int(round(red   * 0xff)) << 16) |
               (Int(round(green * 0xff)) << 08) |
               (Int(round(blue  * 0xff)) << 00)
    }

    /// The hexadecimal string value of the color in the RGB format (RRGGBB), e.g., "#ffff00".
    var hexString: String {
        return "#\(String(format: "%06x", self.hex))"
    }

}

public extension UIColor {

    /// Initializes a color using a hexadecimal integer in the ARGB format (AARRGGBB), e.g., 0x80ffff00.
    convenience init(hex_ARGB hex: Int) {
        let components = (
            alpha: CGFloat((hex >> 24) & 0xff) / 0xff,
            red:   CGFloat((hex >> 16) & 0xff) / 0xff,
            green: CGFloat((hex >> 08) & 0xff) / 0xff,
            blue:  CGFloat((hex >> 00) & 0xff) / 0xff
        )

        self.init(red: components.red, green: components.green, blue: components.blue, alpha: components.alpha)
    }

    /// Initializes a color using a hexadecimal string in the ARGB format (AARRGGBB), e.g., "#80ffff00".
    convenience init?(hex_ARGB hex: String) {
        guard let value = Int(hex: hex) else { return nil }
        self.init(hex_ARGB: value)
    }

    /// The hexadecimal integer value of the color in the ARGB format (AARRGGBB), e.g., 0x80ffff00.
    var hex_ARGB: Int {
        var alpha: CGFloat = 1.0
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (Int(round(alpha * 0xff)) << 24) |
               (Int(round(red   * 0xff)) << 16) |
               (Int(round(green * 0xff)) << 08) |
               (Int(round(blue  * 0xff)) << 00)
    }

    /// The hexadecimal string value of the color in the ARGB format (AARRGGBB), e.g., "#80ffff00".
    var hexString_ARGB: String {
        return "#\(String(format: "%08x", self.hex_ARGB))"
    }

}

public extension UIColor {

    /// Initializes a color using a hexadecimal integer in the RGBA format (RRGGBBAA), e.g., 0xffff0080.
    convenience init(hex_RGBA hex: Int) {
        let components = (
            red:   CGFloat((hex >> 24) & 0xff) / 0xff,
            green: CGFloat((hex >> 16) & 0xff) / 0xff,
            blue:  CGFloat((hex >> 08) & 0xff) / 0xff,
            alpha: CGFloat((hex >> 00) & 0xff) / 0xff
        )

        self.init(red: components.red, green: components.green, blue: components.blue, alpha: components.alpha)
    }

    /// Initializes a color using a hexadecimal string in the RGBA format (RRGGBBAA), e.g., "#ffff0080".
    convenience init?(hex_RGBA hex: String) {
        guard let value = Int(hex: hex) else { return nil }
        self.init(hex_RGBA: value)
    }

    /// The hexadecimal integer value of the color in the RGBA format (RRGGBBAA), e.g., 0xffff0080.
    var hex_RGBA: Int {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (Int(round(red   * 0xff)) << 24) |
               (Int(round(green * 0xff)) << 16) |
               (Int(round(blue  * 0xff)) << 08) |
               (Int(round(alpha * 0xff)) << 00)
    }

    /// The hexadecimal string value of the color in the RGBA format (RRGGBBAA), e.g., "#ffff0080".
    var hexString_RGBA: String {
        return "#\(String(format: "%08x", self.hex_RGBA))"
    }

}

private extension Int {

    init?(hex: String) {
        let str = hex.replacingOccurrences(of: "0x", with: "").replacingOccurrences(of: "#", with: "")
        self.init(str, radix: 16)
    }

}
