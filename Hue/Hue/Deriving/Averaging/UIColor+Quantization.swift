//
//  UIColor+Quantization.swift
//  Hue
//
//  Created by Adam Graham on 4/11/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to perform color quantization processing.
public extension UIColor {

    /// A cache of all computed cluster ranges.
    private static var cachedClusters: [Int: [CGFloat]] = [:]

    /**
     Computes quantization cluster ranges.

     - parameter amount: The amount of clusters to generate, clamped in the range [1, 256].
                         This value determines the size/range of each cluster. For example,
                         4 clusters returns [0, 0.25, 0.5, 0.75, 1].

     - returns: An array of ordered floats between [0, 1] that define the cluster ranges.
     */
    private static func generateClusters(amount: Int) -> [CGFloat] {
        let size = clamp(amount, 1, 256)

        if let clusters = self.cachedClusters[size] {
            return clusters
        }

        let delta = 1.0 / CGFloat(size)

        var clusters = [CGFloat]()
        clusters.append(0.0)

        for i in 1...size {
            clusters.append(CGFloat(i) * delta)
        }

        self.cachedClusters[size] = clusters

        return clusters
    }

    /**
     Returns a new color after performing color quantization.

     - parameter clusters: The size of each cluster range to which the RGB components of the
                           color are reduced. For example, 4 clusters indicates each RGB
                           component can have a value of 0, 64, 128, 192, or 255.

     - returns: The quantized color.
     */
    func quantized(clusters: Int = 16) -> UIColor {
        let clusters = UIColor.generateClusters(amount: clusters)

        func quantize(_ component: CGFloat) -> CGFloat {
            return clusters.min(by: { abs($0 - component) < abs($1 - component) })!
        }

        var rgba = self.rgbaComponents
        rgba.r = quantize(rgba.r)
        rgba.g = quantize(rgba.g)
        rgba.b = quantize(rgba.b)

        return UIColor(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
    }

}
