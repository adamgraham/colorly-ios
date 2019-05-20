//
//  UIColor+ColorModel.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to describe various color models.
public extension UIColor {

    /// An abstract mathematical model describing the ways colors can be represented as
    /// tuples of numbers, typically as three or four values or color components.
    enum ColorModel {

        /// A representation of the RGB color model using hexadecimal numbers, i.e., `#0080ff`.
        case Hex

        /// The RGB (red, green, blue) color model, an additive color mixing, device-dependent
        /// model used mainly for the representation and display of images in digital formats.
        case RGB

        /// The RYB (red, yellow, blue) color model, a traditional model used in a standard artist's
        /// color wheel, particularly in painting.
        case RYB

        /// The CMYK (cyan, magenta, yellow, black) color model, a subtractive color mixing model
        /// used in color printing.
        case CMYK

        /// The HSB (hue, saturation, brightness) color model is an alternative representation to
        /// the RGB color model designed to more closely align with the way human vision
        /// perceives color-making attributes. HSB is the same as HSV.
        ///
        /// The HSB representation models the way paints of different colors mix together, with the
        /// saturation dimension resembling various shades of brightly colored paint, and the
        /// brightness dimension resembling the mixture of those paints with varying amounts of
        /// black or white paint
        case HSB

        /// The HSV (hue, saturation, value) color model is an alternative representation to the
        /// RGB color model designed to more closely align with the way human vision perceives
        /// color-making attributes. HSV is the same as HSB.
        ///
        /// The HSV representation models the way paints of different colors mix together, with the
        /// saturation dimension resembling various shades of brightly colored paint, and the
        /// value dimension resembling the mixture of those paints with varying amounts of
        /// black or white paint
        case HSV

        /// The HSL (hue, saturation, lightness) color model is an alternative representation to the
        /// RGB color model designed to more closely align with the way human vision perceives
        /// color-making attributes.
        ///
        /// The HSL model attempts to resemble more perceptual color models such as the natural
        /// color system (NCS) or Munsell color system, placing fully saturated colors around a
        /// circle at a lightness value of ​½, where a lightness value of 0 or 1 is fully black or white,
        /// respectively.
        case HSL

        /// The CIE 1931 color spaces were the first defined quantitative links between
        /// distributions of wavelengths in the electromagnetic visible spectrum, and
        /// physiologically perceived colors in human color vision. The mathematical relationships
        /// that define these color spaces are essential tools for color management.
        case CIE

        /// The YCbCr color model used as a part of the color image pipeline in video and digital
        /// photography systems. Y is the luminance (luma) component and Cb and Cr are the
        /// blue-difference and red-difference chrominance (chroma) components, respectively.
        case YCbCr

    }

}
