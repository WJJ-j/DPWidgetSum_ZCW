//
//  NSData+DPCategory.h
//  YQYLApp
//
//  Created by yupeng xia on 2018/8/7.
//  Copyright © 2018年 zcw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DPCategory)
///gzip压缩
+ (NSData *)gzipDeflate:(NSData *)data;
///gzip解压
+ (NSData *)gzipInflate:(NSData*)data;
@end
