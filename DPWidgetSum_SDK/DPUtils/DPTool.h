//
//  DPTool.h
//  ZCWBaseApp
//
//  Created by ShaoHua Huang on 13-9-3.
//  Copyright (c) 2013年 ShaoHua Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ToastView_Tag 201503312
#define Animation_Time 2

@interface DPTool : NSObject
///Toast提示框；默认时间 Animation_Time；delay 自定义时间；aView 父视图；vc 根控制器；
+ (void)showToastMsg:(NSString *)toastStr;
+ (void)showToastMsg:(NSString *)toastStr delay:(int)delay;
+ (void)showToastMsg:(NSString *)toastStr forView:(UIView *)aView;
+ (void)showToastMsg:(NSString *)toastStr forView:(UIView *)aView delay:(int)delay;
+ (void)showToastMsg:(NSString *)toastStr forVc:(UIViewController *)vc;
+ (void)showToastMsg:(NSString *)toastStr forVc:(UIViewController *)vc delay:(int)delay;
@end
