//
//  NSObject+DPCategory.h
//  ZCWBaseApp
//
//  Created by yupeng xia on 2018/8/7.
//  Copyright © 2018年 zcw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (DPCategory)
///所有NSString类型变量为nil时，设置值为@""
- (void)dp_setDefaultValueForAllStringProperty;
///重置所有NSString、NSDictionary、NSMutableArray……类型变量为空数据
- (void)dp_clearValueForAllStringProperty;
@end

@interface NSObject (Runtime)
///标记 id 数据
@property (nonatomic, strong) id dpIndentObject;
///标记 UIButton 数据
@property (nonatomic, strong) UIButton *dpIndentButton;
///标记 NSDictionary 数据
@property (nonatomic, strong) NSDictionary *dpIndentDictionary;
///标记 NSArray 数据
@property (nonatomic, strong) NSArray *dpIndentNSArray;
///标记 NSString 数据
@property (nonatomic, strong) NSString *dpIndentString;
///标记 NSIndexPath 数据
@property (nonatomic, strong) NSIndexPath *dpIndentIndexPath;
///标记 CGFloat 数据
@property (nonatomic, assign) CGFloat dpIndentFloat;
///标记 NSInteger 数据
@property (nonatomic, assign) NSInteger dpIndentInteger;
///标记 BOOL 数据
@property (nonatomic, assign) BOOL dpIndentBool;
@end
