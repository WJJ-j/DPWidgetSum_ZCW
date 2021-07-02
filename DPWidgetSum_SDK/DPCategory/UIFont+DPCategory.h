//
//  UIFont+DPCategory.h
//  ZCWBaseApp
//
//  Created by yupeng xia on 2018/8/7.
//  Copyright © 2018年 zcw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIFont (DPCategory)
///指定字体库
+ (UIFont *)dp_customFontWithName:(NSString *)fontFileName size:(CGFloat)size;
@end
