# Colorly
> An iOS utility framework for working with colors.

## Usage

### Index
  * [🌎 Accessibility Compliance](#accessibility)
  * [⚛️ Components](#components)
  * [🔲 Contrast Ratio](#contrast)
  * [🌈 Gradients](#gradients)
  * [🎶 Harmonies](#harmonies)
  * [🚥 Hue Adjustment](#hue-adjustment)
  * [🙃 Inversion](#inversion)
  * [🌓 Lighter / Darker](#lightness)
  * [☀️ Luminance Values](#luminance)
  * [🎨 Mixing](#mixing)
  * [👩‍🔬 Models](#models)
  * [🔀 Randomization](#randomization)
  * [🖤 Saturated / Desaturated / Grayscale](#saturation)
  * [👥 Shades / Tints / Tones](#shades-tints-tones)

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
