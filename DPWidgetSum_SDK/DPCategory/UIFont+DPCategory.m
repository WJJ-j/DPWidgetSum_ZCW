//
//  UIFont+DPCategory.m
//  ZCWBaseApp
//
//  Created by yupeng xia on 2018/8/7.
//  Copyright © 2018年 zcw. All rights reserved.
//

#import "UIFont+DPCategory.h"
#import "DPWidgetSum.h"
#import <CoreText/CoreText.h>

@implementation UIFont (DPCategory)
///指定字体库
+ (UIFont *)dp_customFontWithName:(NSString *)fontFileName size:(CGFloat)size {
    if (@available(iOS 9.0, *)) {
        UIFont *aFont = [self fontWithName:fontFileName size:size];
        if (aFont) {
            return aFont;
        }
    }
    if ([fontFileName rangeOfString:@"bold"].location != NSNotFound || [fontFileName rangeOfString:@"Bold"].location != NSNotFound) {
        return [self boldSystemFontOfSize:size];
    }
    return [self systemFontOfSize:size];
}
@end
