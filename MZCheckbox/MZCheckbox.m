//
//  MZCheckbox.m
//  MZCheckbox
//
//  Created by mizu bai on 2021/8/6.
//

#import "MZCheckbox.h"

#define kRingRadius    8
#define kRingLineWidth 2
#define kCircleRadius  5
#define kMargin        5

@interface MZCheckbox ()

@end

@implementation MZCheckbox

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // checkbox
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint arcCenter = CGPointMake(kMargin + kRingRadius, rect.size.height * 0.5);
    [path addArcWithCenter:arcCenter radius:kRingRadius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [path setLineWidth:kRingLineWidth];
    [[UIColor lightGrayColor] setStroke];
    [path stroke];
    if (self.isOn) {
        UIBezierPath *path1 = [UIBezierPath bezierPath];
        [path1 addArcWithCenter:arcCenter radius:kCircleRadius startAngle:0 endAngle:2 * M_PI clockwise:YES];
        [[UIColor blueColor] setFill];
        [path1 fill];
    }
    // title
    NSDictionary *attr = @{
            NSFontAttributeName: [UIFont systemFontOfSize:14],
    };
    CGFloat titleX = (kMargin + kRingRadius) * 2;
    CGFloat titleMaxWidth = self.bounds.size.width - 2 * kRingRadius - 3 * kMargin;
    CGFloat titleMaxHeight = self.bounds.size.height - 2 * kMargin;
    CGSize titleMaxSize = CGSizeMake(titleMaxWidth, titleMaxHeight);
    CGSize titleSize = [self.title boundingRectWithSize:titleMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    CGRect titleRect = CGRectMake(titleX, (titleMaxHeight - titleSize.height) * 0.5, titleSize.width, titleSize.height);
    [self.title drawInRect:titleRect withAttributes:attr];
}

- (void)setOn:(BOOL)on {
    _on = on;
    [self setNeedsDisplay];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    [self setNeedsDisplay];
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event {
    [super beginTrackingWithTouch:touch withEvent:event];
    [self setOn:!self.isOn];
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event {
    [super continueTrackingWithTouch:touch withEvent:event];
    return YES;
}

- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event {
    [super endTrackingWithTouch:touch withEvent:event];
}

- (void)cancelTrackingWithEvent:(nullable UIEvent *)event {
    [super cancelTrackingWithEvent:event];
}


@end
