//
//  FRCarGroupItem.h
//  suoyintiao
//
//  Created by FanrongZeng on 2018/3/24.
//  Copyright © 2018年 FanrongZeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FRCarItem;
@interface FRCarGroupItem : NSObject
/** 组标题 */
@property (copy, nonatomic) NSString *title;
/** 所有的car模型 */
@property (strong, nonatomic) NSArray *carItems;
/** 类工厂方法 */
+ (instancetype)carGroupItemWithDict: (NSDictionary *)dict;
@end
