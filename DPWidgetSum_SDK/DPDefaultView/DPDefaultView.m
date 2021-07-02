//
//  DPDefaultView.m
//  SJFX11X5App
//
//  Created by yupeng xia on 2018/12/10.
//  Copyright © 2018 zcw. All rights reserved.
//

#import "DPDefaultView.h"
#import "DPWidgetSum.h"

@interface DPDefaultView(){
    UIView *centerView;
    UIImageView *imageV;
    UILabel *label;
    UIButton *btn;
}
@property (nonatomic, weak) UIView *superView;
@property (nonatomic, strong) UIImage *topImage;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *btnTitle;
///1 内容整体靠上位置显示, 2 内容整体居中显示, 3 内容整体靠上（距离50）位置显;
@property (nonatomic, assign) int layoutType;
///1 只有提示语, 2 只有图片, 3 提示语+图片;
@property (nonatomic, assign) int showType;
@property (nonatomic, copy) ButtonBlock btnBlock;
@end

@implementation DPDefaultView
/**
 *  显示默认视图
 *
 *  @param aSuperView: 父视图;
 *  @param aTopImage: 顶部图片，默认值：dp_BundleImageNamed(@"dp_no_failed.png");
 *  @param aTitle: 提示语，默认值：@"获取数据为空";
 *  @param aBtnTitle: 按钮文字，默认值：@"重新获取";
 *  @param aBtnBlock: 为nil不显示按钮;
 *
 */
+ (id)showDefaulTSuperView:(UIView *)aSuperView topImage:(UIImage *)aTopImage title:(NSString *)aTitle btnTitle:(NSString *)aBtnTitle btnBlock:(ButtonBlock)aBtnBlock {
    return [[self class] showDefaulTSuperView:aSuperView topImage:aTopImage title:aTitle btnTitle:aBtnTitle showType:3 layoutType:2 btnBlock:aBtnBlock];
}
/**
 *  显示默认视图
 *
 *  @param aSuperView: 父视图;
 *  @param aTopImage: 顶部图片，默认值：dp_BundleImageNamed(@"dp_no_failed.png");
 *  @param aTitle: 提示语，默认值：@"获取数据为空";
 *  @param aBtnTitle: 按钮文字，默认值：@"重新获取";
 *  @param aShowType: 1 只有提示语, 2 只有图片, 3 提示语+图片;
 *  @param aLayoutType: 1 内容整体靠上位置显示, 2 内容整体居中显示, 3 内容整体靠上（距离50）位置显;
 *  @param aBtnBlock: 为nil不显示按钮;
 *
 */
+ (id)showDefaulTSuperView:(UIView *)aSuperView topImage:(UIImage *)aTopImage title:(NSString *)aTitle btnTitle:(NSString *)aBtnTitle showType:(int)aShowType layoutType:(int)aLayoutType btnBlock:(ButtonBlock)aBtnBlock {
    if (aSuperView != nil) {
        NSMutableArray *aArray = [NSMutableArray arrayWithCapacity:aSuperView.subviews.count];
        for (UIView *aView in aSuperView.subviews) {
            if ([aView isKindOfClass:[DPDefaultView class]]) {
                [aArray addObject:aView];
            }
        }
        
        DPDefaultView *currentView = nil;
        for (int i = 0; i < aArray.count; i++) {
            DPDefaultView *aView = aArray[i];
            if (i == 0) {
                currentView = aView;
            }else {
                [aView removeFromSuperview];
            }
        }

        if (currentView == nil) {
            currentView = [[DPDefaultView alloc] init];
        }
        currentView.superView = aSuperView;
        if (aTopImage != nil) {
            currentView.topImage = aTopImage;
        }
        if (aTitle != nil) {
            currentView.title = aTitle;
        }
        if (aBtnTitle != nil) {
            currentView.btnTitle = aBtnTitle;
        }
        currentView.layoutType = aLayoutType;
        currentView.showType = aShowType;
        currentView.btnBlock = aBtnBlock;

        [currentView updateLayout];
        currentView.hidden = NO;
        
        return currentView;
    }
    return nil;
}

/**
 *  隐藏默认视图
 *
 *  @param aSuperView: 父视图;
 *
 */
+ (void)hiddenDefaulTSuperView:(UIView *)aSuperView {
    for (UIView *aView in aSuperView.subviews) {
        if ([aView isKindOfClass:[DPDefaultView class]]) {
            aView.hidden = YES;
        }
    }
}
/**
 *  隐藏默认视图
 *
 */
- (void)hiddenDefaulTSuperView {
    for (UIView *aView in self.superView.subviews) {
        if ([aView isKindOfClass:[DPDefaultView class]]) {
            aView.hidden = YES;
        }
    }
}

- (void)dealloc {
    
}
- (id)init {
    self = [super init];
    if (self) {
        self.backgroundColor = DPSMDate.defaultViewBG[@"bgColor"];
        
        self.topImage = dp_BundleImageNamed(@"dp_no_failed.png");
        self.title = @"获取数据为空";
        self.btnTitle = @"重新获取";
        
        centerView = [[UIView alloc] init];
        centerView.tag = 151;
        [self addSubview:centerView];
        
        //图片
        imageV = [[UIImageView alloc] init];
        imageV.tag = 152;
        [centerView addSubview:imageV];
        
        //提示语
        label = [[UILabel alloc] init];
        label.tag = 153;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = DPSMDate.defaultViewTitle[@"font"];
        label.textColor = DPSMDate.defaultViewTitle[@"textColor"];
        [centerView addSubview:label];
        
        //按钮
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 154;
        btn.backgroundColor = DPSMDate.defaultViewBtn[@"bgColor"];
        btn.titleLabel.font = DPSMDate.defaultViewBtn[@"font"];
        [btn setTitleColor:DPSMDate.defaultViewBtn[@"titleColor"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(noDataShowLabelBtnSelct:) forControlEvents:UIControlEventTouchUpInside];
        [centerView addSubview:btn];
    }
    return self;
}
- (void)noDataShowLabelBtnSelct:(UIButton *)button{
    if (self.btnBlock) {
        self.btnBlock(self, button);
    }
}

- (void)updateLayout {
    self.frame = _superView.bounds;
    [_superView addSubview:self];
    
    centerView.frame = CGRectMake(0, 0, self.dp_width, 0);
    centerView.backgroundColor = [UIColor clearColor];
    
    imageV.hidden = YES;
    CGSize imageSize = _topImage.size;
    imageSize.width = DP_FrameWidth(imageSize.width);
    imageSize.height = DP_FrameHeight(imageSize.height);
    imageV.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
    imageV.image = _topImage;
    imageV.dp_centerX = centerView.dp_width/2;
    
    label.hidden = YES;
    label.frame = CGRectMake(0, imageV.dp_yMax+DP_FrameHeight(20), centerView.dp_width, 0);
    label.text = _title;
    [label sizeToFit];
    label.frame = CGRectMake(0, imageV.dp_yMax+DP_FrameHeight(20), centerView.dp_width, label.dp_height);
    
    btn.hidden = YES;
    CGFloat btnW = DP_FrameWidth(175);
    btn.frame = CGRectMake((centerView.dp_width-btnW)/2, label.dp_yMax+DP_FrameHeight(30), btnW, DP_FrameHeight(34));
    [btn setTitle:_btnTitle forState:UIControlStateNormal];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = [DPSMDate.defaultViewBtn[@"radius"] floatValue];
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = ((UIColor *)DPSMDate.defaultViewBtn[@"borderColor"]).CGColor;
    
    //showType: 1 只有提示语, 2 只有图片, 3 提示语+图片
    CGFloat maxY = 0;
    if (_showType == 1) {
        imageV.hidden = YES;
        label.hidden = NO;
        label.dp_y = 0;
        maxY = label.dp_yMax;
    }else if(_showType == 2){
        imageV.hidden = NO;
        label.hidden = YES;
        maxY = imageV.dp_yMax;
    }else if(_showType == 3){
        imageV.hidden = NO;
        label.hidden = NO;
        label.dp_y = imageV.dp_yMax+DP_FrameHeight(20);
        maxY = label.dp_yMax;
    }
    if (_btnBlock) {
        btn.hidden = NO;
        btn.dp_y = maxY+DP_FrameHeight(30);
        maxY = btn.dp_yMax;
    }else{
        btn.hidden = YES;
    }
    centerView.dp_height = maxY;
    
    //layoutType: 1 内容整体靠上位置显示, 2 内容整体居中显示, 3 内容整体靠上（距离50）位置显;
    if (_layoutType == 1) {
        centerView.dp_y = 0;
    }else if(_layoutType == 2){
        centerView.dp_centerY = self.dp_height/2;
    }else if(_layoutType == 3){
        centerView.dp_y = DP_FrameHeight(50);
    }
}
@end
