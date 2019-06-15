# Colorly
> An iOS utility framework for working with colors.

## Usage

#### Mixing
``` swift
// Returns a mixture of two colors with a given weight.
UIColor.mixing(.red, with: .blue)
//UIColor.mixing(.red, with: .blue, weight: 0.5)
UIColor.red.mixed(with: .blue)
//UIColor.red.mixed(with: .blue, weight: 0.5)

// Arithmetic
let rose = (UIColor.magenta * 0.5) + (UIColor.red * 0.5)
let chartreuse = (UIColor.yellow * 0.5) + (UIColor.green * 0.5)
```

#### Shades, Tints, Tones
``` swift
let color = UIColor.red
color.shade() // Returns a mixture of the color with black, decreasing lightness.
//color.shade(percent: 0.1)
color.tint() // Returns a mixture of the color with white, increasing lightness.
//color.tint(percent: 0.1)
color.tone() // Returns a mixture of the color with gray, decreasing saturation.
//color.tone(percent: 0.1)
```

#### Saturated / Desaturated / Grayscaled
``` swift
let color = UIColor.red
color.saturated() // Returns a new instance of the color with increased saturation.
//color.saturated(percent: 0.1)
color.desaturated() // Returns a new instance of the color with decreased saturation.
//color.desaturated(percent: 0.1)
color.grayscaled() // Returns a new instance of the color with 0% saturation.
```

#### Lighter / Darker
``` swift
let color = UIColor.red
color.lighter() // Returns a new instance of the color with increased lightness.
//color.lighter(percent: 0.1)
color.darker() // Returns a new instance of the color with decreased lightness.
//color.darker(percent: 0.1)
```

#### Hue Adjustment
``` swift
let color = UIColor.red
color.adjustingHue(by: 180.0) // Returns a new instance of the color with an adjusted hue.
color.complement // The color opposite on the color wheel, equivalant to adjusting the hue by 180°.
color.isCool // Returns true if the color falls on the cool side of the color wheel.
color.isWarm // Returns true if the color falls on the warm side of the color wheel.
```

#### Inverted
``` swift
let color = UIColor.red
color.inverted // The negative of the color, produced by inverting the RGB values.
```

#### Harmonies
``` swift
let color = UIColor.red
let harmonies = color.harmonies
harmonies.monochromatic // Different tints and shades of the same color.
harmonies.complementary // Two opposite colors on the color wheel.
harmonies.splitComplementary // A color and the two adjacent tertiary colors of its complement.
harmonies.analogous // Three adjacent colors on the color wheel.
harmonies.triadic // Three evenly spaced colors on the color wheel.
harmonies.tetradic // Two complementary pairs in a rectangular pattern on the color wheel.
harmonies.square // Two evenly spaced complementary pairs on the color wheel.
```

#### Gradients
``` swift
// Generates an array of colors between a start and end color.
UIColor.gradient(between: .orange, and: .purple)
UIColor.gradient(between: .orange, and: .purple, stops: 5)
UIColor.gradient(between: .orange, and: .purple, customStops: [0.0, 0.1, 0.5, 0.9, 1.0])
```

#### Randomization
``` swift
UIColor.random() // Returns a color with random component values.
UIColor.randomSet(of: 5) // Returns a set of unique colors with random component values.
```

#### Contrast Ratio
``` swift
// Returns the contrast ratio between two colors based on their luminance values.
UIColor.contrastRatio(between: .black, and: .white)
UIColor.black.contrastRatio(to: .white)

// Compares the contrast ratio of the color to two others and returns which of the two has the higher ratio.
UIColor.red.higherContrastingColor(between: .black, and: .white)
// Compares the contrast ratio of the color to an array of others and returns the one with the highest ratio.
UIColor.white.highestContrastingColor(between: [.red, .green, .blue])

// Compares the contrast ratio of the color to two others and returns which of the two has the lower ratio.
UIColor.red.lowerContrastingColor(between: .black, and: .white)
// Compares the contrast ratio of the color to an array of others and returns the one with the lowest ratio.
UIColor.white.lowestContrastingColor(between: [.red, .green, .blue])
```

#### Accessibility Compliance
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

#### Luminance Values
``` swift
let color = UIColor.red
color.relativeLuminance // The relative luminance of the color, measured according to the HSL color model.
color.perceivedBrightness // The perceived brightness of the color, measured according to the HSP color model.
color.isLight // Returns true if the color is considered light according to its perceived brightness.
color.isDark // Returns true if the color is considered dark according to its perceived brightness.
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
