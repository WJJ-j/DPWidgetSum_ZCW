//
//  UIViewController+DPCategory.h
//  YQYLApp
//
//  Created by yupeng xia on 2021/1/18.
//  Copyright © 2021 zcw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DPWidgetSum.h"
@interface UIViewController (DPCategory)
///获取APP窗口当前展示的页面
+ (UIViewController *)dp_topVC;
///循环遍历多类型下级控制器
+ (UIViewController *)dp_topVCRunTime:(UIViewController *)vc;
@end
