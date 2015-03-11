//
//  MARKCircularSliderTests.m
//  Tests
//
//  Created by Vadym Markov on 11/03/15.
//  Copyright (c) 2015 Hyper. All rights reserved.
//

@import UIKit;
@import XCTest;

#import "MARKCircularSlider.h"

@interface MARKCircularSliderTests : XCTestCase

@property (strong) MARKCircularSlider *slider;

@end

@implementation MARKCircularSliderTests

- (void)setUp
{
    [super setUp];

    self.slider = [[MARKCircularSlider alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];
}

@end
