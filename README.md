# Colorly
> An iOS utility framework for working with colors.

## Usage

### Index
  * [Accessibility Compliance](#accessibility)
  * [Averaging](#averaging)
  * [Color Wheel](#color-wheel)
  * [Components](#components)
  * [Contrast Ratio](#contrast)
  * [Gradients](#gradients)
  * [Harmonies](#harmonies)
  * [Hue Adjustment](#hue-adjustment)
  * [Illuminants](#illuminants)
  * [Inversion](#inversion)
  * [Lighter / Darker](#lightness)
  * [Luminance Values](#luminance)
  * [Mixing](#mixing)
  * [Mixing Models](#mixing-models)
  * [Models](#models)
  * [Pantone Colors](#pantone)
  * [Randomization](#randomization)
  * [Saturated / Desaturated / Grayscale](#saturation)
  * [Shades / Tints / Tones](#shades-tints-tones)
  * [Signal Encodings](#signal-encodings)
  * [Web Safe](#websafe)

#### <a name="models"></a> Models 👩‍🔬
``` swift
let color = UIColor.red
color.hex // The hexadecimal integer value in the RGB format (RRGGBB) e.g. 0xff0000
color.hexString // The hexadecimal string value in the RGB format (RRGGBB) e.g. "#ff0000"
color.hex_ARGB // The hexadecimal integer value in the ARGB format (AARRGGBB) e.g. 0xffff0000
color.hexString_ARGB // The hexadecimal string value in the ARGB format (AARRGGBB) e.g. "#ffff0000"
color.hex_RGBA // The hexadecimal integer value in the RGBA format (RRGGBBAA) e.g. 0xff0000ff
color.hexString_RGBA // The hexadecimal string value in the RGBA format (RRGGBBAA) e.g. "#ff0000ff"
```
``` swift
let color = UIColor.red
color.rgb // The RGB (red, green, blue) components [0, 255]
color.rgba // The RGBA (red, green, blue, alpha) components [0, 255]
color.argb // The ARGB (alpha, red, green, blue) components [0, 255]
color.linearRGB // The inverse companded sRGB components to get non-gamma corrected linear values [0, 1]
```
``` swift
let color = UIColor.red
color.cmyk // The CMYK (cyan, magenta, yellow, black) components [0, 100%]
```
``` swift
let color = UIColor.red
color.hsb // The HSB (hue [0, 360°], saturation[0, 100%], brightness[0, 100%]) components
color.hsi // The HSI (hue [0, 360°], saturation[0, 100%], intensity[0, 100%]) components
color.hsl // The HSL (hue [0, 360°], saturation[0, 100%], lightness[0, 100%]) components
color.hsv // The HSV (hue [0, 360°], saturation[0, 100%], value[0, 100%]) components
```
``` swift
let color = UIColor.red
color.XYZ // The CIE 1931 XYZ components - luminance Y[0, 100] and chromaticity X[0, 95.047], Z[0, 108.883]
color.xyY // The CIE xyY components - luminance Y[0, 100] and chromaticity x,y[0, 1]
color.ucs // The CIE 1960 UCS components - u,v[0, 1] chromaticity coordinates
color.uvw // The CIE 1964 UVW components - chromaticity U,V[-100, 100] and lightness W[0, 100]
color.Lab // The CIELAB components - lightness L[0, 100] and chromaticity a,b[-128, 128]
color.Luv // The CIELUV components - lightness L[0, 100] and chromaticity u,v[-100, 100]
color.Lch_ab // The CIELCh°(ab) components - lightness L[0, 100], chroma C, and hue h[0, 360°]
color.Lch_uv // The CIELCh°(uv) components - lightness L[0, 100], chroma C, and hue h[0, 360°]
color.hunterLab // The Hunter Lab components - lightness L[0, 100] and chromaticity a,b

// Support for different illuminants and standard observers
color.Lab(illuminant: .d65, observer: .two)
color.Luv(illuminant: .d65, observer: .two)
color.Lch_ab(illuminant: .d65, observer: .two)
color.Lch_uv(illuminant: .d65, observer: .two)
color.hunterLab(illuminant: .d65, observer: .two)
```
``` swift
let color = UIColor.red
color.yPbPr // The Y′PbPr components - luma Y′[0, 1] and chroma Cb,Cr[-0.5, 0.5]
color.yCbCr // The Y′CbCr components - luma Y′[0, 255] and chroma Cb,Cr[0, 255]
color.yuv // The Y′UV components - luma Y′[0, 1] and chroma U[-0.436, 0.436], V[-0.615, 0.615]
color.yiq // The Y′IQ components - luma Y′[0, 1] and chroma I[-0.596, 0.596], Q[-0.523, 0.523]

// Support for different signal encodings
color.yPbPr(.rec601)
color.yCbCr(.rec601)
color.yuv(.rec601)
color.yiq(.rec601)
```

#### <a name="components"></a> Components ⚛️
``` swift
// RGB components [0, 1]
let color = UIColor.red
color.redComponent // The red component of the color
color.greenComponent // The green component of the color
color.blueComponent // The blue component of the color
color.alphaComponent // The alpha component of the color
color.rgbComponents // The red, green, and blue components of the color
color.rgbaComponents // The red, green, blue, and alpha components of the color
color.argbComponents // The alpha, red, green, and blue components of the color
```
``` swift
// HSB components [0, 1]
let color = UIColor.red
color.hueComponent // The hue component of the color
color.saturationComponent // The saturation component of the color
color.brightnessComponent // The brightness component of the color
color.hsbComponents // The hue, saturation, and brightness components of the color
```
``` swift
// Grayscale components [0, 1]
let color = UIColor.red
color.whiteComponent // The white component of the color
```

#### <a name="mixing"></a> Mixing 🎨
``` swift
// Returns a mixture of two colors with a given weight
UIColor.mixing(.red, with: .blue)
//UIColor.mixing(.red, with: .blue, weight: 0.5)
UIColor.red.mixed(with: .blue)
//UIColor.red.mixed(with: .blue, weight: 0.5)

// Arithmetic
let rose = (UIColor.magenta * 0.5) + (UIColor.red * 0.5)
let chartreuse = (UIColor.yellow * 0.5) + (UIColor.green * 0.5)
```

#### <a name="shades-tints-tones"></a> Shades / Tints / Tones 👥
``` swift
let color = UIColor.red
color.shade() // Returns a mixture of the color with black, decreasing lightness
//color.shade(percent: 0.1)
color.tint() // Returns a mixture of the color with white, increasing lightness
//color.tint(percent: 0.1)
color.tone() // Returns a mixture of the color with gray, decreasing saturation
//color.tone(percent: 0.1)
```

#### <a name="saturation"></a> Saturated / Desaturated / Grayscaled 🖤
``` swift
let color = UIColor.red
color.saturated() // Returns a new instance of the color with increased saturation
//color.saturated(percent: 0.1)
color.desaturated() // Returns a new instance of the color with decreased saturation
//color.desaturated(percent: 0.1)
color.grayscaled() // Returns a new instance of the color with 0% saturation
```

#### <a name="lightness"></a> Lighter / Darker 🌓
``` swift
let color = UIColor.red
color.lighter() // Returns a new instance of the color with increased lightness
//color.lighter(percent: 0.1)
color.darker() // Returns a new instance of the color with decreased lightness
//color.darker(percent: 0.1)
```

#### <a name="hue-adjustment"></a> Hue Adjustment 🚥
``` swift
let color = UIColor.red
color.adjustingHue(by: 180.0) // Returns a new instance of the color with an adjusted hue
color.complement // The color opposite on the color wheel, equivalant to adjusting the hue by 180°
color.isCool // Returns true if the color falls on the cool side of the color wheel
color.isWarm // Returns true if the color falls on the warm side of the color wheel
```

#### <a name="inversion"></a> Inversion 🙃
``` swift
let color = UIColor.red
color.inverted // The negative of the color, produced by inverting the RGB values
```

#### <a name="harmonies"></a> Harmonies 🎶
``` swift
let color = UIColor.red
let harmonies = color.harmonies
harmonies.monochromatic // Different tints and shades of the same color
harmonies.complementary // Two opposite colors on the color wheel
harmonies.splitComplementary // A color and the two adjacent tertiary colors of its complement
harmonies.analogous // Three adjacent colors on the color wheel
harmonies.triadic // Three evenly spaced colors on the color wheel
harmonies.tetradic // Two complementary pairs in a rectangular pattern on the color wheel
harmonies.square // Two evenly spaced complementary pairs on the color wheel
```

#### <a name="gradients"></a> Gradients 🌈
``` swift
// Generates an array of colors between a start and end color
UIColor.gradient(between: .orange, and: .purple)
UIColor.gradient(between: .orange, and: .purple, stops: 5)
UIColor.gradient(between: .orange, and: .purple, customStops: [0.0, 0.1, 0.5, 0.9, 1.0])
```

#### <a name="averaging"></a> Averaging 🖖
``` swift
UIColor.average(of: [.red, .green, ,blue]) // Returns the average color of an array of colors
UIColor.average(of: .black, and: .white) // Returns the average of two colors
```

#### <a name="randomization"></a> Randomization 🔀
``` swift
UIColor.random() // Returns a color with random component values
UIColor.randomSet(of: 5) // Returns a set of unique colors with random component values
```

#### <a name="contrast"></a> Contrast Ratio 🔲
``` swift
// Returns the contrast ratio between two colors based on their luminance values
UIColor.contrastRatio(between: .black, and: .white)
UIColor.black.contrastRatio(to: .white)

// Compares the contrast ratio of the color to two others and returns which of the two has the higher ratio
UIColor.red.higherContrastingColor(between: .black, and: .white)
// Compares the contrast ratio of the color to an array of others and returns the one with the highest ratio
UIColor.white.highestContrastingColor(between: [.red, .green, .blue])

// Compares the contrast ratio of the color to two others and returns which of the two has the lower ratio
UIColor.red.lowerContrastingColor(between: .black, and: .white)
// Compares the contrast ratio of the color to an array of others and returns the one with the lowest ratio
UIColor.white.lowestContrastingColor(between: [.red, .green, .blue])
```

#### <a name="accessibility"></a> Accessibility Compliance 🌎
``` swift
// The visual presentation of text has a contrast ratio of at least 4.5:1 (Level AA)
UIColor.isCompliant(with: .minimum, testing: .black, against: .white)
// The visual presentation of large text has a contrast ratio of at least 3:1 (Level AA)
UIColor.isCompliant(with: .minimumLargeText, testing: .black, against: .white)
// The visual presentation of text has a contrast ratio of at least 7:1 (Level AAA)
UIColor.isCompliant(with: .enhanced, testing: .black, against: .white)
// The visual presentation of large text has a contrast ratio of at least 4.5:1 (Level AAA)
UIColor.isCompliant(with: .enhancedLargeText, testing: .black, against: .white)
```

#### <a name="luminance"></a> Luminance Values ☀️
``` swift
let color = UIColor.red
color.relativeLuminance // The relative luminance of the color, measured according to the HSL color model
color.perceivedBrightness // The perceived brightness of the color, measured according to the HSP color model
color.isLight // Returns true if the color is considered light according to its perceived brightness
color.isDark // Returns true if the color is considered dark according to its perceived brightness
```

#### <a name="websafe"></a> Web Safe 🕸️
``` swift
let color = UIColor.random()
color.webSafe // The nearest web safe color to the current color
```

#### <a name="mixing-models"></a> Mixing Models 🖌️
``` swift
let mixingModel = UIColor.MixingModel.additive
//let mixingModel = UIColor.MixingModel.subtractive
//let mixingModel = UIColor.MixingModel.traditional

mixingModel.primaryColors // The primary colors of the mixing model
mixingModel.secondaryColors // The secondary colors of the mixing model
mixingModel.tertiaryColors // The tertiary colors of the mixing model
mixingModel.colorWheel // The primary, secondary, and tertiary colors of the mixing model
```

#### <a name="color-wheel"></a> Color Wheel 🎡
``` swift
UIColor.azure // A color object whose RGB values are 0.0, 0.5, and 1.0 and whose alpha value is 1.0
UIColor.violet // A color object whose RGB values are 0.5, 0.0, and 1.0 and whose alpha value is 1.0
UIColor.rose // A color object whose RGB values are 1.0, 0.0, and 0.5 and whose alpha value is 1.0
UIColor.orange // A color object whose RGB values are 1.0, 0.5, and 0.0 and whose alpha value is 1.0
UIColor.chartreuse // A color object whose RGB values are 0.5, 1.0, and 0.0 and whose alpha value is 1.0
UIColor.springGreen // A color object whose RGB values are 0.0, 1.0, and 0.5 and whose alpha value is 1.0
```
``` swift
// The colors that define the RGB color wheel
let colorWheel = UIColor.ColorWheel.RGB
// grayscale
colorWheel.white // #ffffff, rgb(255,255,255)
colorWheel.black // #000000, rgb(0,0,0)
// primary
colorWheel.red // #ff0000, rgb(255,0,0)
colorWheel.green // #00ff00, rgb(0,255,0)
colorWheel.blue // #0000ff, rgb(0,0,255)
// secondary
colorWheel.cyan // #00ffff, rgb(0,255,255)
colorWheel.magenta // #ff00ff, rgb(255,0,255)
colorWheel.yellow // #ffff00, gb(255,255,0)
// tertiary
colorWheel.azure // #0080ff, rgb(0,128,255)
colorWheel.violet // #8000ff, rgb(128,0,255)
colorWheel.rose // #ff0080, rgb(255,0,128)
colorWheel.orange // #ff8000, rgb(255,128,0)
colorWheel.chartreuse // #80ff00, rgb(128,255,0)
colorWheel.springGreen // #00ff80, rgb(0,255,128)
```
``` swift
// The colors that define the RYB color wheel
let colorWheel = UIColor.ColorWheel.RYB
// grayscale
colorWheel.white // #ffffff, ryb(255,255,255)
colorWheel.black // #000000, ryb(0,0,0)
// primary
colorWheel.red // #ff0000, ryb(255,0,0)
colorWheel.yellow // #00ff00, ryb(0,255,0)
colorWheel.blue // #0000ff, ryb(0,0,255)
// secondary
colorWheel.green // #00ffff, ryb(0,255,255)
colorWheel.purple // #ff00ff, ryb(255,0,255)
colorWheel.orange // #ffff00, ryb(255,255,0)
// tertiary
colorWheel.vermilion // #ff8000, ryb(255,128,0)
colorWheel.amber // #80ff00, ryb(128,255,0)
colorWheel.chartreuse // #00ff80, ryb(0,255,128)
colorWheel.teal // #0080ff, ryb(0,128,255)
colorWheel.violet // #8000ff, ryb(128,0,255)
colorWheel.magenta // #ff0080, ryb(255,0,128)
```

#### <a name="pantone"></a> Pantone Colors 🍭
``` swift
let palette = UIColor.Pantone
palette.cerulean // Pantone 15-4020, #9BB7D4, Color of the year 2000
palette.fuchsiaRose // Pantone 17-2031, #C74375, Color of the year 2001
palette.trueRed // Pantone 19-1664, #BF1932, Color of the year 2002
palette.aquaSky // Pantone 14-4811, #7BC4C4, Color of the year 2003
palette.tigerlily // Pantone 17-1456, #E2583E, Color of the year 2004
palette.blueTurquoise // Pantone 15-5217, #53B0AE, Color of the year 2005
palette.sandDollar // Pantone 13-1106, #DECDBE, Color of the year 2006
palette.chiliPepper // Pantone 19-1557, #9B1B30, Color of the year 2007
palette.blueIris // Pantone 18-3943, #5A5B9F, Color of the year 2008
palette.mimosa // Pantone 14-0848, #F0C05A, Color of the year 2009
palette.turquoise // Pantone 15-5519, #45B5AA, Color of the year 2010
palette.honeysuckle // Pantone 18-2120, #D94F70, Color of the year 2011
palette.tangerineTango // Pantone 17-1463, #DD4124, Color of the year 2012
palette.emerald // Pantone 17-5641, #009473, Color of the year 2013
palette.radiantOrchid // Pantone 18-3224, #B163A3, Color of the year 2014
palette.marsala // Pantone 18-1438, #955251, Color of the year 2015
palette.roseQuartz // Pantone 13-1520, #F7CAC9, Color of the year 2016
palette.serenity // Pantone 15-3913, #92A8D1, Color of the year 2016
palette.greenery // Pantone 15-0343, #88B04B, Color of the year 2017
palette.ultraViolet // Pantone 18-3838, #5F4B8B, Color of the year 2018
palette.livingCoral // Pantone 16-1546, #FF6F61, Color of the year 2019
```

#### <a name="illuminants"></a> Illuminants 💡
``` swift
UIColor.Illuminant.a // Incandescent/Tungsten
UIColor.Illuminant.b // Old Direct Sunlight at Noon
UIColor.Illuminant.c // Old Daylight
UIColor.Illuminant.d50 // ICC Profile PCS
UIColor.Illuminant.d55 // Mid-morning Daylight
UIColor.Illuminant.d65 // Daylight, sRGB, Adobe-RGB
UIColor.Illuminant.d75 // North Sky Daylight
UIColor.Illuminant.e // Equal Energy
UIColor.Illuminant.f1 // Daylight Fluorescent
UIColor.Illuminant.f2 // Cool Fluorescent
UIColor.Illuminant.f3 // White Fluorescent
UIColor.Illuminant.f4 // Warm White Fluorescent
UIColor.Illuminant.f5 // Daylight Fluorescent
UIColor.Illuminant.f6 // Lite White Fluorescent
UIColor.Illuminant.f7 // Daylight Fluorescent, D65 Simulator
UIColor.Illuminant.f8 // Sylvania F40, D50 Simulator
UIColor.Illuminant.f9 // Cool White Fluorescent
UIColor.Illuminant.f10 // Ultralume 50, Philips TL85
UIColor.Illuminant.f11 // Ultralume 40, Philips TL84
UIColor.Illuminant.f12 // Ultralume 30, Philips TL83
```
``` swift
UIColor.StandardObserver.two // CIE 1931 2° Standard Observer
UIColor.StandardObserver.ten // CIE 1964 10° Standard Observer
```
``` swift
let illuminant = UIColor.Illuminant.d65 
illuminant.whitePoint // The XYZ tristimulus values of the white point
//illuminant.whitePoint(for: .two, scale: 100.0)
```

#### <a name="signal-encodings"></a> Signal Encodings 📡
``` swift
UIColor.SignalEncoding.rec601 // ITU-R BT.601 (standard-definition television)
UIColor.SignalEncoding.rec709 // ITU-R BT.709 (high-definition television)
```

## License
```
MIT License

Copyright (c) 2019 Adam Graham

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
