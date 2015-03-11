//
//  ViewController.m
//  Demo
//
//  Created by Vadym Markov on 11/03/15.
//  Copyright (c) 2015 Vadym Markov. All rights reserved.
//

#import "ViewController.h"
#import "MARKCircularSlider.h"
#import "UIColor+Demo.h"

static CGFloat const kViewControllerSliderWidth = 200.0;
static CGFloat const kViewControllerLabelWidth = 200.0;

@interface ViewController ()

@property (nonatomic, strong) MARKCircularSlider *slider;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Additional setup after loading the view
    self.title = @"Slider Demo";
    self.view.backgroundColor = [UIColor backgroundColor];
    [self setUpViewComponents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    CGFloat labelX = (CGRectGetWidth(self.view.frame) - kViewControllerLabelWidth) / 2;
    self.label.frame = CGRectMake(labelX, 110.0, kViewControllerLabelWidth, 20.0);

    CGFloat sliderX = (CGRectGetWidth(self.view.frame) - kViewControllerSliderWidth) / 2;
    self.slider.frame = CGRectMake(sliderX, CGRectGetMaxY(self.label.frame) + 20.0, kViewControllerSliderWidth, kViewControllerSliderWidth);
}

#pragma mark - Actions

- (void)sliderValueDidChange:(MARKCircularSlider *)slider
{
    [self updateRangeText];
}

#pragma mark - UI

- (void)setUpViewComponents
{
    // Text label
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.backgroundColor = [UIColor backgroundColor];
    self.label.numberOfLines = 1;
    self.label.textColor = [UIColor secondaryTextColor];
    self.label.textAlignment = NSTextAlignmentCenter;

    // Init slider
    self.slider = [[MARKCircularSlider alloc] initWithFrame:CGRectZero];
    self.slider.filledColor = [UIColor sliderFilledColor];
    self.slider.unfilledColor = [UIColor sliderUnfilledColor];
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 72;
    self.slider.value = 10;
    self.slider.outsideTouchesEnabled = YES;

    [self.slider addTarget:self
                         action:@selector(sliderValueDidChange:)
               forControlEvents:UIControlEventValueChanged];

    [self updateRangeText];

    [self.view addSubview:self.label];
    [self.view addSubview:self.slider];
}

- (void)updateRangeText
{
    NSLog(@"%0.2f", self.slider.value);
    self.label.text = [NSString stringWithFormat:@"%0.2f",
                       self.slider.value];
}

@end
