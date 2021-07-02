//
//  ViewController.m
//  test
//
//  Created by yupeng xia on 2018/12/17.
//  Copyright © 2018 yupeng xia. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveObjC.h"
#import "DPWidgetSum.h"
#import "DPDefaultView.h"
#import "DPMessageAlertView.h"
#import "DPTimeAlertPickerView.h"

@interface ViewController (){
    UILabel *dateLab;
}
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *msgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    msgBtn.frame = CGRectMake(0, DP_StatusbarHeight+DP_FrameHeight(10), self.view.dp_width, 40);
    msgBtn.backgroundColor = [UIColor orangeColor];
    [msgBtn setTitle:@"消息弹框-DPMessageAlert" forState:UIControlStateNormal];
    dp_arc_block(self);
    [[msgBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [ZCWAlertView showDPMessageAlertViewForTitle:@"警告" content:@"网络请求失败！" buttonTitles:@[@"取消", @"重新请求"] buttonBlock:nil];
    }];
    [self.view addSubview:msgBtn];
    
    UIButton *defaultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    defaultBtn.frame = CGRectMake(0, msgBtn.dp_yMax+DP_FrameHeight(10), self.view.dp_width, 40);
    defaultBtn.backgroundColor = [UIColor purpleColor];
    [defaultBtn setTitle:@"默认显示框-DPDefaultView" forState:UIControlStateNormal];
    [[defaultBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [DPDefaultView showDefaulTSuperView:weak_self.view topImage:nil title:nil btnTitle:nil btnBlock:^(DPDefaultView *aObject, UIButton *aButton) {
            [aObject hiddenDefaulTSuperView];
        }];
    }];
    [self.view addSubview:defaultBtn];
    
    dateLab = [[UILabel alloc] init];
    dateLab.userInteractionEnabled = YES;
    dateLab.frame = CGRectMake(0, defaultBtn.dp_yMax+DP_FrameHeight(10), self.view.dp_width, DP_FrameHeight(40));
    dateLab.backgroundColor = [UIColor greenColor];
    dateLab.text = @"选择时间：";
    [self.view addSubview:dateLab];
    
    UITapGestureRecognizer *dateLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dateLabelTapAction:)];
    [dateLab addGestureRecognizer:dateLabelTap];
}

- (void)dateLabelTapAction:(UITapGestureRecognizer *)tap {
    DPTimeAlertPickerView *datePickerView = [DPTimeAlertPickerView alertViewForParent:self.view uuid:0 alertViewStyle:DPTimeViewStyleOne level:1 AlertBlock:^(DPTimeAlertPickerView *aObject) {
        NSString *dateStr = [NSDate dp_getStrForDateOrStr:aObject.selectDate formatter:@"yyyy-MM-dd" isIntercept:NO];
        if (dateStr.length) {
            self->dateLab.text = [@"选择时间： " stringByAppendingString:dp_notEmptyStr(dateStr)];
        }
    }];
    NSDate *maxDate = [NSDate date];
    NSDate *minDate = [NSDate dp_getPriousorLaterDateFromDate:maxDate withMonth:-3];
    datePickerView.minDate = minDate;
    datePickerView.maxDate = maxDate;
    [datePickerView showTypeAlertViewForIsShow:YES];
}
@end
