//
//  UIColor+Image.swift
//  Colorly
//
//  Created by Adam Graham on 5/27/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to extract pixel color data from an image.
public extension UIImage {

    /// The color data of a pixel - red, green, blue, and alpha.
    struct PixelColor: Hashable {

        /// The red component value of the pixel.
        let r: UInt8
        /// The green component value of the pixel.
        let g: UInt8
        /// The blue component value of the pixel.
        let b: UInt8
        /// The alpha component value of the pixel.
        let a: UInt8

    }

    /// Creates an image from an array of pixel color data.
    convenience init?(pixels: [PixelColor], width: Int, height: Int) {
        guard pixels.count > 0 && pixels.count == width * height else { return nil }

        var pixels = pixels
        let data = NSData(bytes: &pixels, length: pixels.count * MemoryLayout<PixelColor>.size)
        guard let provider = CGDataProvider(data: data) else { return nil }

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let image = CGImage(width: width,
                            height: height,
                            bitsPerComponent: 8,
                            bitsPerPixel: 32,
                            bytesPerRow: width * MemoryLayout<PixelColor>.size,
                            space: colorSpace,
                            bitmapInfo: bitmapInfo,
                            provider: provider,
                            decode: nil,
                            shouldInterpolate: false,
                            intent: .defaultIntent)

        guard let cgImage = image else { return nil }
        self.init(cgImage: cgImage)
    }

    /// Returns the color data of a single pixel in the image.
    subscript(x: Int, y: Int) -> PixelColor? {
        let width = Int(self.size.width)
        let height = Int(self.size.height)

        // ensure the coordinates are within range
        guard x >= 0 && x < width && y >= 0 && y < height else { return nil }

        // retrieve the image byte data
        guard let imageData = self.imageData else { return nil }

        // retrieve the rgba values from the pixel data
        let pixelData = ((width * y) + x) * 4
        let b = imageData[pixelData]
        let g = imageData[pixelData+1]
        let r = imageData[pixelData+2]
        let a = imageData[pixelData+3]

        return PixelColor(r: r, g: g, b: b, a: a)
    }

    /// Returns an array of the color data for every pixel in the image.
    func pixelColors() -> [PixelColor] {
        guard let imageData = self.imageData else { return [] }

        let width = Int(self.size.width)
        let height = Int(self.size.height)

        var colors = [PixelColor]()
        var pixelData: Int
        var r,g,b,a: UInt8

        for y in 0..<height {
            for x in 0..<width {
                pixelData = ((width * y) + x) * 4
                b = imageData[pixelData]
                g = imageData[pixelData+1]
                r = imageData[pixelData+2]
                a = imageData[pixelData+3]
                colors.append(PixelColor(r: r, g: g, b: b, a: a))
            }
        }

        return colors
    }

    /// Returns a unique set of the color data for every pixel in the image.
    func pixelColorSet() -> Set<PixelColor> {
        return Set(pixelColors())
    }

    // MARK: Helpers

    private var imageData: UnsafePointer<UInt8>? {
        guard let imageData = self.cgImage?.dataProvider?.data else { return nil }
        return CFDataGetBytePtr(imageData)
    }

}
