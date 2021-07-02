//
//  DPAddressPickerModel.m
//  ZhongCaiMSJ
//
//  Created by sy on 15/7/6.
//  Copyright (c) 2015年 wsf. All rights reserved.
//

#import "DPAddressPickerModel.h"
#import "DPWidgetSum.h"

@implementation DPAddressPickerModel

@end

@implementation DPProvinceModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (void)setArray:(NSMutableArray *)array {
    _array = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dic in array) {
        DPCityModel *model = [[DPCityModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [model dp_setDefaultValueForAllStringProperty];
        [_array addObject:model];
    }
}
@end

@implementation DPCityModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (void)setArr:(NSMutableArray *)arr {
    _arr = [NSMutableArray arrayWithCapacity:arr.count];
    for (NSDictionary *dic in arr) {
        DPCountyModel *model = [[DPCountyModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [model dp_setDefaultValueForAllStringProperty];
        [_arr addObject:model];
    }
}
@end

@implementation DPCountyModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end

