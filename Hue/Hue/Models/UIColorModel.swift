//
//  UIColorModel.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

public extension UIColor {

    /// An abstract mathematical model describing the ways colors can be represented as
    /// tuples of numbers, typically as three or four values or color components.
    public enum Model {

        /// A representation of the RGB color model using hexadecimal numbers, i.e., `#0080ff`.
        case Hex

        /// The RGB (red, green, blue) color model, an additive color mixing, device-dependent
        /// model used mainly for the representation and display of images in digital formats.
        case RGB

        /// The RYB (red, yellow, blue) color model, a traditional model used in a standard artist's
        /// color wheel, particularly in painting.
        case RYB

        /// The HSB (hue, saturation, brightness) color model - also referred to as HSV - is an
        /// alternative representation to the RGB color model designed to more closely align with
        /// the way human vision perceives color-making attributes.
        ///
        /// The HSB representation models the way paints of different colors mix together, with the
        /// _saturation_ dimension resembling various shades of brightly colored paint, and the
        /// _brightness_ dimension resembling the mixture of those paints with varying amounts of
        /// black or white paint
        case HSB

        /// The HSV (hue, saturation, value) color model - also referred to as HSB - is an
        /// alternative representation to the RGB color model designed to more closely align with
        /// the way human vision perceives color-making attributes.
        ///
        /// The HSV representation models the way paints of different colors mix together, with the
        /// _saturation_ dimension resembling various shades of brightly colored paint, and the
        /// _value_ dimension resembling the mixture of those paints with varying amounts of
        /// black or white paint
        case HSV

        /// The HSL (hue, saturation, lightness) color model, an alternative representation to the
        /// RGB color model designed to more closely align with the way human vision perceives
        /// color-making attributes.
        ///
        /// The HSL model attempts to resemble more perceptual color models such as the natural
        /// color system (NCS) or Munsell color system, placing fully saturated colors around a
        /// circle at a lightness value of ​½, where a lightness value of 0 or 1 is fully black or white,
        /// respectively.
        case HSL

        /// The XYZ color model defined by the International Commission on Illumination (CIE).
        /// Created to map out all of the colors perceived by the human eye, it is considered to be
        /// one of the most accurate color models; thus, it is commonly used for color
        /// management and conversions.
        case XYZ

        /// The LAB (lightness, A-channel, B-channel) color model defined by the International
        /// Commission on Illumination (CIE). It was designed to be perceptually uniform with
        /// respect to human color vision, meaning that the same amount of numerical change in
        /// these values corresponds to about the same amount of visually perceived change.
        case LAB

        /// The CMYK (cyan, magenta, yellow, black) color model, a subtractive color mixing model
        /// used in color printing.
        case CMYK

        /// The YCbCr color model used as a part of the color image pipeline in video and digital
        /// photography systems. _Y_ is the luminance (luma) component and _Cb_ and _Cr_ are the
        /// blue-difference and red-difference chrominance (chroma) components, respectively.
        case YCbCr

    }

}
