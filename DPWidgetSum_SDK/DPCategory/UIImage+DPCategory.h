//
//  UIImage+DPCategory.h
//  JYJ微博
//
//  Created by JYJ on 15/3/11.
//  Copyright (c) 2015年 JYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (DPCategory)
///获取纯色值图片，大小为：CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)
+ (UIImage *)dp_imageWithColor:(UIColor *)color;

///获取纯色值图片，指定大小
+ (UIImage *)dp_imageWithColor:(UIColor *)color rect:(CGRect)rect;

///生成任意圆角边框图片
+ (UIImage*)dp_imageWithStoreColor:(UIColor*)storeColor fillColor:(UIColor*)fillColor lineWidth:(CGFloat)lineWidth size:(CGSize)size radius:(CGFloat)radius edgInset:(UIEdgeInsets)edgInset alpha:(CGFloat)alpha;

///获取bundle图片，默认
+ (UIImage *)dp_imageName:(NSString *)aImageName bundleName:(NSString *)aBundleName;
@end
