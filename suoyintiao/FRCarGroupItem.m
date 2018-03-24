//
//  FRCarGroupItem.m
//  suoyintiao
//
//  Created by FanrongZeng on 2018/3/24.
//  Copyright © 2018年 FanrongZeng. All rights reserved.
//

#import "FRCarGroupItem.h"
#import "FRCarItem.h"

@implementation FRCarGroupItem

+ (instancetype)carGroupItemWithDict: (NSDictionary *)dict{
    
    FRCarGroupItem *carGroup = [[FRCarGroupItem alloc]init];
    
    carGroup.title = dict[@"title"];
    
    //字典数组转模型数组
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary *dict1 in dict[@"cars"]) {
        [array addObject:[FRCarItem carItemWithDict:dict1]];
    }
    
    carGroup.carItems = array;
    
    return carGroup;
}



@end
