//
//  DPDefaultView.h
//  SJFX11X5App
//
//  Created by yupeng xia on 2018/12/10.
//  Copyright © 2018 zcw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class DPDefaultView;

typedef void (^ButtonBlock)(DPDefaultView *aObject, UIButton *aButton);

@interface DPDefaultView : UIView
/**
 *  显示默认视图，提示语+图片，内容整体居中显示
 *
 *  @param aSuperView: 父视图;
 *  @param aTopImage: 顶部图片，默认值：dp_BundleImageNamed(@"dp_no_data.png");
 *  @param aTitle: 提示语，默认值：@"获取数据为空";
 *  @param aBtnTitle: 按钮文字，默认值：@"重新获取";
 *  @param aBtnBlock: 为nil不显示按钮;
 *
 */
+ (id)showDefaulTSuperView:(UIView *)aSuperView topImage:(UIImage *)aTopImage title:(NSString *)aTitle btnTitle:(NSString *)aBtnTitle btnBlock:(ButtonBlock)aBtnBlock;

/**
 *  显示默认视图
 *
 *  @param aSuperView: 父视图;
 *  @param aTopImage: 顶部图片，默认值：dp_BundleImageNamed(@"dp_no_data.png");
 *  @param aTitle: 提示语，默认值：@"获取数据为空";
 *  @param aBtnTitle: 按钮文字，默认值：@"重新获取";
 *  @param aShowType: 1 只有提示语, 2 只有图片, 3 提示语+图片;
 *  @param aLayoutType: 1 内容整体靠上位置显示, 2 内容整体居中显示, 3 内容整体靠上（距离50）位置显;
 *  @param aBtnBlock: 为nil不显示按钮;
 *
 */
+ (id)showDefaulTSuperView:(UIView *)aSuperView topImage:(UIImage *)aTopImage title:(NSString *)aTitle btnTitle:(NSString *)aBtnTitle showType:(int)aShowType layoutType:(int)aLayoutType btnBlock:(ButtonBlock)aBtnBlock;

/**
 *  隐藏默认视图
 *
 *  @param aSuperView: 父视图;
 *
 */
+ (void)hiddenDefaulTSuperView:(UIView *)aSuperView;

/**
 *  隐藏默认视图
 *
 */
- (void)hiddenDefaulTSuperView;
@end
