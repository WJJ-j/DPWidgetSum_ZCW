//
//  UIButton+DPCategory.m
//  YQYLApp
//
//  Created by yupeng xia on 2018/8/7.
//  Copyright © 2018年 zcw. All rights reserved.
//

#import "UIButton+DPCategory.h"
#import "DPWidgetSum.h"

@implementation UIButton (DPCategory)
- (void)dp_setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    UIImage *backgroundColorImage = [UIImage dp_imageWithColor:color];
    [self setBackgroundImage:backgroundColorImage forState:state];
}
@end
