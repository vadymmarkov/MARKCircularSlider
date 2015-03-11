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

@interface MARKCircularSlider ()

@property (nonatomic, assign) CGPoint centerPoint;
@property(nonatomic, assign) CGFloat radius;

- (CGFloat)valueRange;
- (BOOL)containsPoint:(CGPoint)point;
- (CGFloat)radiansFromDegrees:(CGFloat)degrees;
- (CGFloat)degreesFromRadians:(CGFloat)radians;
- (CGFloat)valueForPoint:(CGPoint)point;

@end


@interface MARKCircularSliderTests : XCTestCase

@property (strong) MARKCircularSlider *slider;

@end

@implementation MARKCircularSliderTests

- (void)setUp
{
    [super setUp];

    self.slider = [[MARKCircularSlider alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0f, 80.0f)];
}

- (void)testDefaultsAfterInit
{
    XCTAssertEqual(self.slider.value, 0.0f, @"Value is %f but it should be %f", self.slider.value, 0.0f);
    XCTAssertEqual(self.slider.minimumValue, 0.0f, @"Minimum value is %f but it should be %f", self.slider.minimumValue, 0.0f);
    XCTAssertEqual(self.slider.maximumValue, 1.0f, @"Maximum value is %f but it should be %f", self.slider.maximumValue, 0.0f);
    XCTAssertEqual(self.slider.radius, 0.0f, @"Radius is %f but it should be %f", self.slider.radius, 0.0f);
}

- (void)testLayoutSubviews
{
    CGFloat halfWidth = self.slider.frame.size.width / 2;
    CGFloat halfHeight = self.slider.frame.size.height / 2;
    CGFloat radius = halfWidth > halfHeight ? halfHeight : halfWidth;

    [self.slider layoutSubviews];

    XCTAssertEqual(self.slider.radius, radius, @"Radius is %f but it should be %f", self.slider.radius, radius);
    XCTAssertTrue(
                  CGPointEqualToPoint(self.slider.centerPoint, CGPointMake(halfWidth, halfHeight)),
                  @"Center point is (%f, %f) but it should be (%f, %f)", self.slider.centerPoint.x, self.slider.centerPoint.y, halfWidth, halfHeight);
}

- (void)testValueRange
{
    XCTAssertEqual([self.slider valueRange], self.slider.maximumValue - self.slider.minimumValue, @"value range is %f but it should be %f", [self.slider valueRange], self.slider.maximumValue - self.slider.minimumValue);
}

- (void)testContainsPoint
{
    [self.slider layoutSubviews];

    XCTAssertTrue([self.slider containsPoint:CGPointMake(50.0f, 50.0f)]);
    XCTAssertFalse([self.slider containsPoint:CGPointMake(200.0f, 350.0f)]);
}

- (void)testRadiansFromDegrees
{
    CGFloat degrees = 90.0f;
    CGFloat expectedRadians = degrees * M_PI / 180.0f;

    CGFloat radians = [self.slider radiansFromDegrees:degrees];
    XCTAssertEqual(radians, expectedRadians, @"%f degrees is %f radians but it should be %f", degrees, radians, expectedRadians);
}

- (void)testDegreesFromRadians
{
    CGFloat radians = 0.5 * M_PI;
    CGFloat expectedDegrees = radians * 180.0f / M_PI;

    CGFloat degrees = [self.slider degreesFromRadians:radians];
    XCTAssertEqual(degrees, expectedDegrees, @"%f radians is %f degrees but it should be %f", radians, degrees, expectedDegrees);
}

- (void)testValueForPoint
{
    CGPoint point = CGPointMake(50.0f, 80.0f);
    CGFloat expectedValue = 36.0f;

    self.slider.maximumValue = 72.0f;
    [self.slider layoutSubviews];
    CGFloat value = [self.slider valueForPoint:CGPointMake(50.0f, 80.0f)];
    XCTAssertEqual(value, expectedValue, @"Value for point(%f, %f) is %f but it should be %f", point.x, point.y, value, expectedValue);
}


@end
