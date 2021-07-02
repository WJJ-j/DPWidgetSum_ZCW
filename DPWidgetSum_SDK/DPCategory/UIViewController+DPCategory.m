//
//  UIViewController+DPCategory.m
//  YQYLApp
//
//  Created by yupeng xia on 2021/1/18.
//  Copyright © 2021 zcw. All rights reserved.
//

#import "UIViewController+DPCategory.h"

@implementation UIViewController (DPCategory)
///获取APP窗口当前展示的页面
+ (UIViewController *_Nonnull)dp_topVC {
    UIViewController *vc = [[UIApplication sharedApplication] delegate].window.rootViewController;
    UIViewController *topVc = [UIViewController dp_topVCRunTime:vc];
    if (topVc != nil) {
        vc = topVc;
    }
    return vc;
}
///循环遍历多类型下级控制器
+ (UIViewController *)dp_topVCRunTime:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [UIViewController dp_topVCRunTime:[(UINavigationController *)vc topViewController]];
    }else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [UIViewController dp_topVCRunTime:[(UITabBarController *)vc selectedViewController]];
    }else if (vc.presentedViewController) {
        return vc.presentedViewController;
    }else {
        return vc;
    }
    return nil;
}
@end
