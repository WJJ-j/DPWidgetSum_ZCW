//
//  UIColor+Extension.m
//  YQYLApp
//
//  Created by yupeng xia on 2018/8/7.
//  Copyright © 2018年 zcw. All rights reserved.
//

#import "UIColor+DPCategory.h"
#import "DPWidgetSum.h"

@implementation UIColor (DPCategory)
///16进制颜色
+ (UIColor *)dp_hexColor:(NSString *)hexColor {
    if (hexColor.length<6) {
        return [UIColor whiteColor];
    }
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}

///混合颜色 0~1
+ (UIColor *)dp_sectionColor:(UIColor *)aStartColor endColor:(UIColor *)aEndColor ratio:(CGFloat)aRatio {
    if(aRatio > 1) {
        aRatio = 1;
    }else if(aRatio < 0) {
        aRatio = 0;
    }
    const CGFloat *componentsStart = CGColorGetComponents(aStartColor.CGColor);
    const CGFloat *componentsEnd = CGColorGetComponents(aEndColor.CGColor);
    CGFloat r = componentsStart[0]*aRatio + componentsEnd[0]*(1-aRatio);
    CGFloat g = componentsStart[1]*aRatio + componentsEnd[1]*(1-aRatio);
    CGFloat b = componentsStart[2]*aRatio + componentsEnd[2]*(1-aRatio);
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}
@end
