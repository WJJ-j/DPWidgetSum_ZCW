//
//  UIImage+DPCategory.m
//  JYJ微博
//
//  Created by JYJ on 15/3/11.
//  Copyright (c) 2015年 JYJ. All rights reserved.
//

#import "UIImage+DPCategory.h"
#import "DPWidgetSum.h"

@implementation UIImage (DPCategory)
///获取纯色值图片，大小为：CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)
+ (UIImage *)dp_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIImage *image = [UIImage dp_imageWithColor:color rect:rect];
    return image;
}

///获取纯色值图片，指定大小
+ (UIImage *)dp_imageWithColor:(UIColor *)color rect:(CGRect)rect {
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

//生成任意圆角边框图片
+ (UIImage*)dp_imageWithStoreColor:(UIColor*)storeColor fillColor:(UIColor*)fillColor lineWidth:(CGFloat)lineWidth size:(CGSize)size radius:(CGFloat)radius edgInset:(UIEdgeInsets)edgInset alpha:(CGFloat)alpha {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAlpha(context,alpha);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextSetStrokeColorWithColor(context, storeColor.CGColor);

    CGRect rect=CGRectMake(lineWidth/2+edgInset.left, lineWidth/2+edgInset.top, size.width-lineWidth-edgInset.left-edgInset.right, size.height-lineWidth-edgInset.top-edgInset.bottom);
    CGFloat ra=MIN(radius, MIN(rect.size.width/2, rect.size.height/2));
    UIBezierPath* path=[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:ra];
    path.lineWidth=lineWidth;
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineCapRound; //终点处理
    [path fill];
    [path stroke];
    return UIGraphicsGetImageFromCurrentImageContext();
}

///获取bundle图片，默认
+ (UIImage *)dp_imageName:(NSString *)aImageName bundleName:(NSString *)aBundleName {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:aBundleName ofType:@"bundle"];
    UIImage *bundleImage = [UIImage imageWithContentsOfFile:[bundlePath stringByAppendingPathComponent:aImageName]];
    return bundleImage;
}
@end

