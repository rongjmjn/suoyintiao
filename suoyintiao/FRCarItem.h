//
//  FRCarItem.h
//  suoyintiao
//
//  Created by FanrongZeng on 2018/3/24.
//  Copyright © 2018年 FanrongZeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRCarItem : NSObject
/** 图标 */
@property (copy, nonatomic) NSString *icon;
/** 名称 */
@property (copy, nonatomic) NSString *name;
/** 自定义类工厂方法 */
+ (instancetype)carItemWithDict: (NSDictionary *)dict;

@end
