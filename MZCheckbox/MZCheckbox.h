//
//  MZCheckbox.h
//  MZCheckbox
//
//  Created by mizu bai on 2021/8/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZCheckbox : UIControl

@property (nonatomic, assign, getter=isOn) BOOL on;
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
