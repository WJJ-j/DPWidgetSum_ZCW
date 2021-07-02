//
//  NSArray+DPCategory.m
//  YQYLApp
//
//  Created by yupeng xia on 2018/8/7.
//  Copyright © 2018年 zcw. All rights reserved.
//

#import "NSArray+DPCategory.h"
#import "DPWidgetSum.h"

@implementation NSArray (DPCategory)
- (id)dp_objectAtIndex:(NSInteger)index {
    id retObject = nil;
    if(nil != self && self.count>0 && index>=0 ){
        NSInteger count = self.count;
        if (index<count) {
            retObject = [self objectAtIndex:index];
        }
    }
    return retObject;
}
@end
