# MARKCircularSlider

[![Version](https://img.shields.io/cocoapods/v/MARKCircularSlider.svg?style=flat)](http://cocoadocs.org/docsets/MARKCircularSlider)
[![License](https://img.shields.io/cocoapods/l/MARKCircularSlider.svg?style=flat)](http://cocoadocs.org/docsets/MARKCircularSlider)
[![Platform](https://img.shields.io/cocoapods/p/MARKCircularSlider.svg?style=flat)](http://cocoadocs.org/docsets/MARKCircularSlider)

A custom reusable circular slider control. Values range is between `minimumValue` and `maximumValue` (from 0 to 1 by default).

Please check Demo project for a basic example on how to use MARKCircularSlider.

### Demo
![Alt text](https://cloud.githubusercontent.com/assets/10529867/6665833/4f8fc20a-cbde-11e4-99c3-d773667aa710.gif "Demo")

### Available control properties
- `value` - the current value of the slider
- `minimumValue` - the minimum value of the slider's range
- `maximumValue` - the maximum value of the slider's range

## Available styling properties
Customizable colors:
- `filledColor` - color of the filled area
- `unfilledColor` - color of the unfilled area

## Usage

#### In your View Controller
```objc
- (void)viewDidLoad
{
    // ...
    self.slider = [[MARKCircularSlider alloc] initWithFrame:CGRectZero];
    self.slider.filledColor = [UIColor blueColor];
    self.slider.unfilledColor = [UIColor lightGrayColor];
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 72;
    self.slider.value = 10;

    [self.slider addTarget:self
                         action:@selector(sliderValueDidChange:)
               forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:self.slider];
    // ...
}

- (void)sliderValueDidChange:(MARKCircularSlider *)slider
{
    NSLog(@"%0.2f", slider.value);
}

```

## Installation

**MARKCircularSlider** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod 'MARKCircularSlider'`

## Author

Vadym Markov, impressionwave@gmail.com

## License

**MARKCircularSlider** is available under the MIT license. See the LICENSE file for more info.
