//
//  DPSharedManager.h
//  ZCWBaseApp
//
//  Created by yupeng xia on 2020/11/28.
//  Copyright © 2020 zcw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class DPSharedManager;

///消息弹框 “单例获取
#define DPSMDate [DPSharedManager sharedManager]

@interface DPSharedManager : NSObject
+ (DPSharedManager *)sharedManager;

#pragma mark - 消息弹框 “样式自定义
///可重定义，消息弹框 “背景” 样式，默认：
@property (nonatomic, strong) NSDictionary *alertMsgBG;
///可重定义，消息弹框 “中间父视图背景” 样式，默认：
@property (nonatomic, strong) NSDictionary *alertMsgCenterBG;
///可重定义，消息弹框 “标题” 样式，默认：
@property (nonatomic, strong) NSDictionary *alertMsgTitle;
///可重定义，消息弹框 “详细内容” 样式，默认：
@property (nonatomic, strong) NSDictionary *alertMsgContent;
///可重定义，消息弹框 “按钮顶部分割线” 样式，默认：
@property (nonatomic, strong) NSDictionary *alertMsgBtnLine;
///可重定义，消息弹框 “按钮左侧分割线” 样式，默认：
@property (nonatomic, strong) NSDictionary *alertMsgBtnLineLeft;
///可重定义，消息弹框 “忽略按钮” 样式，默认：
@property (nonatomic, strong) NSDictionary *alertMsgBtn;
///可重定义，消息弹框 “引导按钮” 样式，默认：
@property (nonatomic, strong) NSDictionary *alertMsgBtnOther;

#pragma mark - 默认视图背景样式自定义
///可重定义，默认视图“背景” 样式，默认：
@property (nonatomic, strong) NSDictionary *defaultViewBG;
///可重定义，默认视图“标题” 样式，默认：
@property (nonatomic, strong) NSDictionary *defaultViewTitle;
///可重定义，默认视图“按钮” 样式，默认：
@property (nonatomic, strong) NSDictionary *defaultViewBtn;
@end
