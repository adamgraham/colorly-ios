//
//  UIColor+Model.swift
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
    enum Model {

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

        /// The YCbCr color model used as a part of the color image pipeline in video and digital
        /// photography systems. Y is the luminance (luma) component and Cb and Cr are the
        /// blue-difference and red-difference chrominance (chroma) components, respectively.
        case YCbCr

        /// In the 1920s, W. David Wright and John Guild independently conducted a series of
        /// experiments on human sight, from which they tried to determine the colors in human
        /// vision, and give it a mathematical basis. The results of these experiments defined the
        /// CIE RGB color space which became the basis for the trichromatic CIE XYZ color
        /// specification.
        case CIERGB

        /// In 1931, based on the results of the CIE RGB version of the human eye, CIE
        /// mathematically determined a theoretical color space called the CIE 1931 XYZ color
        /// space to map out all of the colors perceived by the human eye. It is considered to be
        /// one of the most accurate color spaces; thus, it is commonly used for color
        /// management and conversions.
        ///
        /// X, Y and Z are extrapolations of RGB created mathematically to avoid negative numbers
        /// and are called Tristimulus values. Y means luminance, Z is somewhat equal to blue, and
        /// X is a mix of cone response curves chosen to be orthogonal to luminance and
        /// non-negative.
        case CIEXYZ

        /// In CIE xyY, Y is the luminance and x and y represents the chromaticity values derived
        /// from the tristimulus values X, Y and Z in the CIE XYZ color space. CIE xyY is just
        /// another way to represent CIE XYZ.
        case CIExyY

        /// CIE L\*a\*b\* is a color space in which L is lightness and a and b are chromaticity
        /// components, with the difference that the color values are far more than the human
        /// gamut. It was designed to be perceptually uniform with respect to human color vision,
        /// meaning that the same amount of numerical change in these values corresponds to
        /// about the same amount of visually perceived change.
        case CIELAB

        /// The CIE 1976 L\*u\*v\* color space, commonly known by its abbreviation CIELUV, is a
        /// simple-to-compute transformation of the 1931 CIE XYZ color space, but which
        /// attempted perceptual uniformity. It is extensively used for applications such as
        /// computer graphics which deal with colored lights.
        case CIELUV

        /// The Hunter Lab color space, defined in 1948 by Richard S. Hunter, is another color
        /// space sometimes referred to as "Lab". Like CIELAB, it was also designed to be
        /// computed via simple formulas from the CIE XYZ space but to be more perceptually
        /// uniform than CIE XYZ.
        ///
        /// Hunter named his coordinates L, a, and b; the CIELAB space, defined years later in
        /// 1976, named its coordinates L*, a*, and b* to distinguish them from Hunter's
        /// coordinates.
        case HunterLab

    }

}
