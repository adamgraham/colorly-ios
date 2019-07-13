//
//  UIColor+ColorSpace.swift
//  Colorly
//
//  Created by Adam Graham on 5/19/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to describe various color spaces.
public extension UIColor {

    // MARK: Color Space

    /// A color space is a specific organization of colors. In combination with physical device
    /// profiling, it allows for reproducible representations of color, in both analog and digital
    /// representations. Adding a specific mapping function between a color model and a
    /// reference color space establishes a definite "footprint", known as a gamut, and for a
    /// given color model this defines a color space.
    enum ColorSpace {

        /// sRGB (standard Red Green Blue) is an RGB color space that HP and Microsoft created
        /// cooperatively in 1996 to use on monitors, printers, and the Internet. It is often the
        /// "default" color space for images that contain no color space information, especially if
        /// the images' pixels are stored in 8-bit integers per color channel.
        case sRGB

        /// In the 1920s, W. David Wright and John Guild independently conducted a series of
        /// experiments on human sight, from which they tried to determine the colors in human
        /// vision, and give it a mathematical basis. The results of these experiments defined the
        /// CIE 1931 RGB color space which became the basis for the trichromatic CIE 1931 XYZ
        /// color specification.
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
        /// from the tristimulus values X, Y and Z in the CIE 1931 XYZ color space. CIE xyY is just
        /// another way to represent CIE 1931 XYZ.
        case CIExyY

        /// The CIE 1960 UCS color space is another name for the (u, v) chromaticity space
        /// devised by David MacAdam. The CIE 1960 UCS does not define a luminance or
        /// lightness component. Today, the CIE 1960 UCS is mostly used to calculate correlated
        /// color temperature, where the isothermal lines are perpendicular to the Planckian locus.
        case CIEUCS

        /// The CIE 1964 U\*V\*W\* color space is based on the CIE 1960 UCS. Wyszecki invented
        /// the UVW color space in order to be able to calculate color differences without having to
        /// hold the luminance constant. He defined a lightness index W\* by simplifying
        /// expressions suggested earlier. The chromaticity components U* and V* are defined
        /// such that the white point maps to the origin. This arrangement has the benefit of being
        /// able to express the loci of chromaticities with constant saturation.
        case CIEUVW

        /// CIE 1976 L\*a\*b\* is a color space in which L is lightness and a and b are chromaticity
        /// components, with the difference that the color values are far more than the human
        /// gamut. It was designed to be perceptually uniform with respect to human color vision,
        /// meaning that the same amount of numerical change in these values corresponds to
        /// about the same amount of visually perceived change.
        case CIELAB

        /// The CIE 1976 L\*u\*v\* color space is a simple-to-compute transformation of the CIE 1931
        /// XYZ color space, but which attempted perceptual uniformity. It is extensively used for
        /// applications such as computer graphics which deal with colored lights.
        case CIELUV

        /// The CIELCh° color space is a cylindrical representation of the CIELAB or CIELUV cube
        /// color space, where C* is the chroma and h° is the hue. The L* lightness value remains
        /// unchanged.
        ///
        /// The LCh color space is not the same as the HSV, HSL or HSB color models, although
        /// their values can also be interpreted as a base color, saturation and lightness of a color.
        /// The HSL values are a polar coordinate transformation of what is technically defined
        /// RGB cube color space. LCh is still perceptually uniform.
        case CIELCh

        /// The Hunter Lab color space, defined in 1948 by Richard S. Hunter, is another color
        /// space sometimes referred to as "Lab". Like CIELAB, it was also designed to be
        /// computed via simple formulas from the CIE 1931 XYZ space but to be more
        /// perceptually uniform than CIE 1931 XYZ.
        ///
        /// Hunter named his coordinates L, a, and b; the CIELAB space, defined years later in
        /// 1976, named its coordinates L*, a*, and b* to distinguish them from Hunter's
        /// coordinates.
        case HunterLab

    }

}
