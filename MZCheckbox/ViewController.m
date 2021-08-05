//
//  ViewController.m
//  MZCheckbox
//
//  Created by mizu bai on 2021/8/6.
//
//

#import "ViewController.h"
#import "MZCheckbox.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@property (nonatomic, strong) MZCheckbox *checkbox;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // checkbox
    CGFloat checkboxWidth = 200;
    CGFloat checkboxHeight = 100;
    CGFloat checkboxX = (kScreenWidth - checkboxWidth) * 0.5;
    CGFloat checkboxY = 200;
    CGRect checkboxFrame = CGRectMake(checkboxX, checkboxY, checkboxWidth, checkboxHeight);
    self.checkbox = [[MZCheckbox alloc] initWithFrame:checkboxFrame];
    self.checkbox.title = @"This is a checkbox written by mizu-bai";
    [self.view addSubview:self.checkbox];
    [self.checkbox addTarget:self action:@selector(checkboxDidCheck:) forControlEvents:UIControlEventTouchUpInside];

    // label
    CGFloat labelWidth = 200;
    CGFloat labelHeight = 50;
    CGFloat labelX = (kScreenWidth - labelWidth) * 0.5;
    CGFloat labelY = CGRectGetMaxY(checkboxFrame) + 50;
    CGRect labelFrame = CGRectMake(labelX, labelY, labelWidth, labelHeight);
    self.label = [[UILabel alloc] initWithFrame:labelFrame];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];

    [self checkboxDidCheck:self.checkbox];
}

- (void)checkboxDidCheck:(MZCheckbox *)sender {
    self.label.text = [NSString stringWithFormat:@"Checkbox State: %@", sender.isOn ? @"On" : @"Off"];
}

@end
