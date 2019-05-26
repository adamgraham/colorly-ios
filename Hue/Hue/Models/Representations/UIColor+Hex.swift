//
//  UIColor+Hex.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to instantiate and represent RGB colors as hexadecimal values.
public extension UIColor {

    /// Initializes a color from a hexadecimal integer in the RGB format (RRGGBB), e.g., 0xffff00.
    /// - parameter hex: The hexadecimal value of the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let rgb = (
            r: CGFloat((hex >> 16) & 0xff) / 0xff,
            g: CGFloat((hex >> 08) & 0xff) / 0xff,
            b: CGFloat((hex >> 00) & 0xff) / 0xff
        )

        self.init(red: rgb.r, green: rgb.g, blue: rgb.b, alpha: alpha)
    }

    /// Initializes a color from a hexadecimal string in the RGB format (RRGGBB), e.g., "#ffff00".
    /// - parameter hex: The hexadecimal string value of the color.
    /// - parameter alpha: The alpha value of the color.
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        guard let value = Int(hex: hex) else { return nil }
        self.init(hex: value, alpha: alpha)
    }

    /// The hexadecimal integer value of the color in the RGB format (RRGGBB), e.g., 0xffff00.
    var hex: Int {
        var (r, g, b) = (CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: nil)

        return (Int(round(r * 0xff)) << 16) |
               (Int(round(g * 0xff)) << 08) |
               (Int(round(b * 0xff)) << 00)
    }

    /// The hexadecimal string value of the color in the RGB format (RRGGBB), e.g., "#ffff00".
    var hexString: String {
        return "#\(String(format: "%06x", self.hex))"
    }

}

/// An extension to instantiate and represent ARGB colors as hexadecimal values.
public extension UIColor {

    /// Initializes a color from a hexadecimal integer in the ARGB format (AARRGGBB), e.g., 0x80ffff00.
    /// - parameter hex: The hexadecimal value of the color.
    convenience init(hex_ARGB hex: Int) {
        let argb = (
            a: CGFloat((hex >> 24) & 0xff) / 0xff,
            r: CGFloat((hex >> 16) & 0xff) / 0xff,
            g: CGFloat((hex >> 08) & 0xff) / 0xff,
            b: CGFloat((hex >> 00) & 0xff) / 0xff
        )

        self.init(red: argb.r, green: argb.g, blue: argb.b, alpha: argb.a)
    }

    /// Initializes a color from a hexadecimal string in the ARGB format (AARRGGBB), e.g., "#80ffff00".
    /// - parameter hex: The hexadecimal string value of the color.
    convenience init?(hex_ARGB hex: String) {
        guard let value = Int(hex: hex) else { return nil }
        self.init(hex_ARGB: value)
    }

    /// The hexadecimal integer value of the color in the ARGB format (AARRGGBB), e.g., 0x80ffff00.
    var hex_ARGB: Int {
        var (a, r, g, b) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: &a)

        return (Int(round(a * 0xff)) << 24) |
               (Int(round(r * 0xff)) << 16) |
               (Int(round(g * 0xff)) << 08) |
               (Int(round(b * 0xff)) << 00)
    }

    /// The hexadecimal string value of the color in the ARGB format (AARRGGBB), e.g., "#80ffff00".
    var hexString_ARGB: String {
        return "#\(String(format: "%08x", self.hex_ARGB))"
    }

}

/// An extension to instantiate and represent RGBA colors as hexadecimal values.
public extension UIColor {

    /// Initializes a color from a hexadecimal integer in the RGBA format (RRGGBBAA), e.g., 0xffff0080.
    /// - parameter hex: The hexadecimal value of the color.
    convenience init(hex_RGBA hex: Int) {
        let rgba = (
            r: CGFloat((hex >> 24) & 0xff) / 0xff,
            g: CGFloat((hex >> 16) & 0xff) / 0xff,
            b: CGFloat((hex >> 08) & 0xff) / 0xff,
            a: CGFloat((hex >> 00) & 0xff) / 0xff
        )

        self.init(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
    }

    /// Initializes a color from a hexadecimal string in the RGBA format (RRGGBBAA), e.g., "#ffff0080".
    /// - parameter hex: The hexadecimal string value of the color.
    convenience init?(hex_RGBA hex: String) {
        guard let value = Int(hex: hex) else { return nil }
        self.init(hex_RGBA: value)
    }

    /// The hexadecimal integer value of the color in the RGBA format (RRGGBBAA), e.g., 0xffff0080.
    var hex_RGBA: Int {
        var (r, g, b, a) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: &a)

        return (Int(round(r * 0xff)) << 24) |
               (Int(round(g * 0xff)) << 16) |
               (Int(round(b * 0xff)) << 08) |
               (Int(round(a * 0xff)) << 00)
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
