//
//  DPTool.m
//  ZCWBaseApp
//
//  Created by ShaoHua Huang on 13-9-3.
//  Copyright (c) 2013年 ShaoHua Huang. All rights reserved.
//

#import "DPTool.h"
#import "DPWidgetSum.h"
#import <CommonCrypto/CommonDigest.h>
#import "MBProgressHUD.h"

@implementation DPTool
+ (void)showToastMsg:(NSString *)toastStr {
    [self showToastMsg:toastStr delay:Animation_Time];
}
+ (void)showToastMsg:(NSString *)toastStr delay:(int)delay {
    [self showToastMsg:toastStr forView:[UIApplication sharedApplication].dp_keyWindow delay:delay];
}
+ (void)showToastMsg:(NSString *)toastStr forVc:(UIViewController *)vc {
    [self showToastMsg:toastStr forVc:vc delay:Animation_Time];
}
+ (void)showToastMsg:(NSString *)toastStr forVc:(UIViewController *)vc delay:(int)delay {
    if(dp_isNotNullString(toastStr) && vc && [vc isKindOfClass:[UIViewController class]]) {
        [self showToastMsg:toastStr forView:vc.view delay:delay];
    }
}
+ (void)showToastMsg:(NSString *)toastStr forView:(UIView *)aView {
    [self showToastMsg:toastStr forView:aView delay:Animation_Time];
}
+ (void)showToastMsg:(NSString *)toastStr forView:(UIView *)aView delay:(int)delay {
    UIView * toastView = [aView viewWithTag:ToastView_Tag];
    if(nil != toastView) {
        [toastView removeFromSuperview];
    }
    
    if(nil != toastStr && toastStr.length>0 && aView) {
        if (toastStr.length<10) {
            toastStr = [NSString stringWithFormat:@"%@",toastStr];
        }
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:aView animated:YES];
        hud.tag = ToastView_Tag;
        hud.userInteractionEnabled= NO;
        hud.mode = MBProgressHUDModeText;
        hud.label.text = toastStr;
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.color = DP_RGBACOLOR(0x00, 0x00, 0x00, .75);
        hud.label.textColor = DP_RGB(255, 255, 255);
        hud.label.numberOfLines =0;
        hud.offset = CGPointMake(0.f, 0);
        hud.margin = 8;
        [hud hideAnimated:YES afterDelay:delay];
    }
}
@end
