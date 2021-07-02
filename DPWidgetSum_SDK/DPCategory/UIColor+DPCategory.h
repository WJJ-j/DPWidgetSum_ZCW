//
//  UIColor+Extension.h
//  YQYLApp
//
//  Created by yupeng xia on 2018/8/7.
//  Copyright © 2018年 zcw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (DPCategory)
///16进制颜色
+ (UIColor *)dp_hexColor:(NSString *)hexColor;
///混合颜色 0~1
+ (UIColor *)dp_sectionColor:(UIColor *)aStartColor endColor:(UIColor *)aEndColor ratio:(CGFloat)aRatio;
@end
