//
//  DPSharedManager.m
//  ZCWBaseApp
//
//  Created by yupeng xia on 2020/11/28.
//  Copyright © 2020 zcw. All rights reserved.
//

#import "DPSharedManager.h"
#import "DPWidgetSum.h"

@interface DPSharedManager (){
    
}
@end

@implementation DPSharedManager
+ (DPSharedManager *)sharedManager {
    static DPSharedManager *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}

#pragma mark - 消息弹框样式自定义
///可重定义，消息弹框 “背景” 样式
- (NSDictionary *)alertMsgBG {
    if (_alertMsgBG == nil) {
        return @{@"bgColor":DP_RGBA(0, 0, 0, 0.5)};
    }
    return _alertMsgBG;
}
///可重定义，消息弹框 “中间父视图背景” 样式
- (NSDictionary *)alertMsgCenterBG {
    if (_alertMsgCenterBG == nil) {
        return @{@"bgColor":DP_RGBA(255, 255, 255, 1),
                 @"radius":@"10"};
    }
    return _alertMsgCenterBG;
}
///可重定义，消息弹框 “标题” 样式
- (NSDictionary *)alertMsgTitle {
    if (_alertMsgTitle == nil) {
        return @{@"font":DP_FontBold(18),
                 @"textColor":DP_RGBA(0, 0, 0, 1)};
    }
    return _alertMsgTitle;
}
///可重定义，消息弹框 “详细内容” 样式
- (NSDictionary *)alertMsgContent {
    if (_alertMsgContent == nil) {
        return @{@"font":DP_Font(16),
                 @"textColor":DP_RGBA(0, 0, 0, 1)};
    }
    return _alertMsgContent;
}
///可重定义，消息弹框 “按钮顶部分割线” 样式
- (NSDictionary *)alertMsgBtnLine {
    if (_alertMsgBtnLine == nil) {
        return @{@"borderWidth":@"0.5",
                 @"bgColor":DP_RGBA(51, 105, 227, 1)};
    }
    return _alertMsgBtnLine;
}
///可重定义，消息弹框 “按钮左侧分割线” 样式
- (NSDictionary *)alertMsgBtnLineLeft {
    if (_alertMsgBtnLineLeft == nil) {
        return @{@"borderWidth":@"0.6",
                 @"bgColor":DP_RGBA(51, 105, 227, 1)};
    }
    return _alertMsgBtnLineLeft;
}
///可重定义，消息弹框 “忽略按钮” 样式
- (NSDictionary *)alertMsgBtn {
    if (_alertMsgBtn == nil) {
        return @{@"bgColor":DP_RGBA(255, 255, 255, 1),
                 @"font":DP_FontBold(16),
                 @"titleColor":DP_RGBA(51, 105, 227, 1)};
    }
    return _alertMsgBtn;
}
///可重定义，消息弹框 “引导按钮” 样式
- (NSDictionary *)alertMsgBtnOther {
    if (_alertMsgBtnOther == nil) {
        return @{@"bgColor":DP_RGBA(51, 105, 227, 1),
                 @"font":DP_FontBold(16),
                 @"titleColor":DP_RGBA(255, 255, 255, 1)};
    }
    return _alertMsgBtnOther;
}

#pragma mark - 默认视图背景样式自定义
///可重定义，默认视图 “背景” 样式
- (NSDictionary *)defaultViewBG {
    if (_defaultViewBG == nil) {
        return @{@"bgColor":DP_RGBA(243, 243, 243, 1)};
    }
    return _defaultViewBG;
}

///可重定义，默认视图 “标题” 样式
- (NSDictionary *)defaultViewTitle {
    if (_defaultViewTitle == nil) {
        return @{@"font":DP_FontBold(18),
                 @"textColor":DP_RGBA(156, 156, 156, 1)};
    }
    return _defaultViewTitle;
}

///可重定义，默认视图 “按钮” 样式
- (NSDictionary *)defaultViewBtn {
    if (_defaultViewBtn == nil) {
        return @{@"bgColor":DP_RGBA(36, 47, 95, 1),
                 @"font":DP_FontBold(16),
                 @"titleColor":DP_RGBA(255, 255, 255, 1),
                 @"borderColor":DP_RGBA(216, 216, 216, 1),
                 @"radius":@"5"};
    }
    return _defaultViewBtn;
}
@end

