//
//  UIApplication+DPCategory.h
//  YQYLApp
//
//  Created by yupeng xia on 2021/1/12.
//  Copyright © 2021 zcw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIApplication (DPCategory)
///获取keyWindow，iOS13废弃 [UIApplication sharedApplication].keyWindow
@property(nullable, nonatomic, readonly) UIWindow *dp_keyWindow;

///获取LaunchImage启动图片
+ (NSString *_Nullable)dp_getLaunchImageName;
@end
