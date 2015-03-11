//
//  MARKCircularSlider.h
//  Tests
//
//  Created by Vadym Markov on 10/03/15.
//  Copyright (c) 2015 Hyper. All rights reserved.
//

@import UIKit;

@interface MARKCircularSlider : UIControl

// Values
@property(nonatomic, assign) CGFloat value;
@property(nonatomic, assign) CGFloat minimumValue;
@property(nonatomic, assign) CGFloat maximumValue;
@property(nonatomic, assign) CGFloat radius;

// Colors
@property(nonatomic, retain) UIColor *filledColor;
@property(nonatomic, retain) UIColor *unfilledColor;

// Touch events
@property(nonatomic) BOOL enableOutsideTouches;

@end
