//
//  FRCarItem.m
//  suoyintiao
//
//  Created by FanrongZeng on 2018/3/24.
//  Copyright © 2018年 FanrongZeng. All rights reserved.
//

#import "FRCarItem.h"

@implementation FRCarItem

+ (instancetype)carItemWithDict: (NSDictionary *)dict{
    FRCarItem *car = [[FRCarItem alloc]init];
    //kvc
    [car setValuesForKeysWithDictionary:dict];
    return car;
}

@end
