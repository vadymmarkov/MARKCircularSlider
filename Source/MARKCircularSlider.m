//
//  MARKCircularSlider.m
//  Tests
//
//  Created by Vadym Markov on 10/03/15.
//  Copyright (c) 2015 Hyper. All rights reserved.
//

#import "MARKCircularSlider.h"

@interface MARKCircularSlider ()

@property (nonatomic, assign) CGPoint center;

@end

@implementation MARKCircularSlider

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        [self setDefaults];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setDefaults];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setDefaults];
    }
    return self;
}

#pragma mark - Setters

- (void)setValue:(CGFloat)value
{
    _value = value;
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark - Configuration

- (void)setDefaults
{
    CGFloat halfWidth = self.frame.size.width / 2;
    CGFloat halfHeight = self.frame.size.height / 2;

    // Set initial values
    self.value = 0.0;
    self.minimumValue = 0.0;
    self.maximumValue = 1.0;
    self.radius = halfWidth > halfHeight ? halfHeight : halfWidth;

    // Set colors
    self.backgroundColor = [UIColor clearColor];
    self.filledColor = [UIColor blueColor];
    self.unfilledColor = [UIColor lightGrayColor];

    self.enableOutsideTouches = YES;

    self.center = CGPointMake(halfWidth, halfHeight);
}

#pragma mark - UI

- (void)drawRect:(CGRect)rect
{
    CGFloat diameter = self.radius * 2;
    CGContextRef context = UIGraphicsGetCurrentContext();

    // Unfilled part
    [self.unfilledColor setFill];
    CGRect contourRect = CGRectMake(
                                    self.center.x - self.radius,
                                    self.center.y - self.radius,
                                    diameter, diameter);
    CGContextFillEllipseInRect (context, contourRect);
    CGContextFillPath(context);

    // Filled part
    CGContextBeginPath(context);
    [self.filledColor setFill];
    CGFloat degrees = 360.0 * self.value / [self valueRange];
    CGContextAddArc(context, self.center.x, self.center.y,
                    self.radius, 0 - M_PI_2,
                    [self radiansFromDegrees:degrees] - M_PI_2, 0);
    CGContextAddLineToPoint(context, self.center.x, self.center.y);
    CGContextClosePath(context);
    CGContextFillPath(context);
}

#pragma mark - Touch events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];

    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];

    if (self.enableOutsideTouches || [self containsPoint:point]) {
        [self sendActionsForControlEvents:UIControlEventTouchDown];
        self.value = [self valueForPoint:point];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];

    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];

    if ([self containsPoint:point]) {
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    } else {
        [self sendActionsForControlEvents:UIControlEventTouchUpOutside];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];

    [self sendActionsForControlEvents:UIControlEventTouchCancel];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];

    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];

    self.value = [self valueForPoint:point];
}

- (BOOL)containsPoint:(CGPoint)point
{
    CGFloat distance = sqrtf(powf(point.x - self.center.x, 2) + powf(point.y - self.center.y, 2));
    return distance <= self.radius;
}

#pragma mark - Helpers

- (CGFloat)valueRange
{
    return self.maximumValue - self.minimumValue;
}

- (CGFloat)radiansFromDegrees:(CGFloat)degrees
{
    return degrees * M_PI / 180.0;
}

- (CGFloat)degreesFromRadians:(CGFloat)radians
{
    return radians * 180.0 / M_PI;
}

- (CGFloat)valueForPoint:(CGPoint)point
{
    CGFloat atan = atan2f(point.x - self.center.x, point.y - self.center.y);
    CGFloat degrees = -([self degreesFromRadians:atan] - 180.0);

    if (degrees < 0) {
        degrees = 360.0 + degrees;
    }
    return degrees / 360.0 * [self valueRange];
}

@end
