@import UIKit;

@interface MARKCircularSlider : UIControl

// Values
@property(nonatomic, assign) CGFloat value;
@property(nonatomic, assign) CGFloat minimumValue;
@property(nonatomic, assign) CGFloat maximumValue;

// Colors
@property(nonatomic, retain) UIColor *filledColor;
@property(nonatomic, retain) UIColor *unfilledColor;

@end
