//
//  DPCustomBanner.h
//  ScrollViewReLoop
//
//  Created by zcw on 16/2/17.
//  Copyright © 2016年 zhcw. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DPCustomBannerDelegate <NSObject>
@required
-(UIView *)customBannerChildViewWithFrame:(CGRect)bounds data:(id)data tag:(NSInteger)tag index:(NSInteger)index;
@optional
-(void)customBannerDidSelectedViewIndex:(NSInteger)index data:(id)data tag:(NSInteger)tag;
@end

@interface DPCustomBanner : UIView

typedef NS_ENUM(NSUInteger, DPCustomBannerDirection) {
    DPCustomBannerLandscape,   //横的
    DPCustomBannerPortrait     //竖的
};
typedef struct DPCustomBannerEdgeInsets {
    CGFloat value, valueCenter, valueMax;
} DPCustomBannerEdgeInsets;

@property (nonatomic, strong)    UIPageControl* pageC;
@property (nonatomic, weak)      id<DPCustomBannerDelegate>delegate;

///可刷新加载数据
- (instancetype)initWithFrame:(CGRect)frame placeholderBGImage:(UIImage *)aPlaceholderBGImage currentPage:(NSInteger)currentPage showDataArr:(NSArray*)dataArray timeInterval:(NSTimeInterval)timeInterval direction:(DPCustomBannerDirection)direction tag:(NSInteger)tag delegate:(id<DPCustomBannerDelegate>)delegate;

///不可刷新加载数据
- (instancetype)initWithFrame:(CGRect)frame currentPage:(NSInteger)currentPage showDataArr:(NSArray*)dataArray timeInterval:(NSTimeInterval)timeInterval direction:(DPCustomBannerDirection)direction tag:(NSInteger)tag delegate:(id<DPCustomBannerDelegate>)delegate;

///刷新数据
-(void)refreshData:(NSArray *)dataArray;

-(void)startTimer;  //打开定时器
-(void)stopTimer;   //关闭定时器

-(void)qingli;
@end
