//
//  ViewController.m
//  suoyintiao
//
//  Created by FanrongZeng on 2018/3/24.
//  Copyright © 2018年 FanrongZeng. All rights reserved.
//

#import "ViewController.h"
#import "FRCarGroupItem.h"
#import "FRCarItem.h"

@interface ViewController ()<UITableViewDataSource>
/** carGroup模型数组 */
@property (strong, nonatomic) NSArray *carGroups;
@end

@implementation ViewController
/** 懒加载carGroup模型 */
- (NSArray *)carGroups{
    if (!_carGroups) {
        //加载plist文件的字典数组
        NSArray *DictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars.plist" ofType:nil]];
        
        //创建一个可变数组
        NSMutableArray *MuArray = [NSMutableArray array];
        
        //字典数组转模型数组
        for (NSDictionary *dict in DictArray) {
            [MuArray addObject:[FRCarGroupItem carGroupItemWithDict:dict]];
        }
        
        _carGroups = MuArray;
    }
    return _carGroups;
}

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];

    //初始化tableView
    [self setupTableView];
    
    
}

/** 隐藏状态栏 */
- (BOOL)prefersStatusBarHidden{
    return YES;
}

/** 初始化tableView */
- (void)setupTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    tableView.dataSource = self;
    //索引天文字颜色
    tableView.sectionIndexColor = [UIColor orangeColor];
    //索引条背景颜色
    tableView.sectionIndexBackgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:tableView];
    
}

#pragma mark - tableView数据源方法
/** 有多少组 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carGroups.count;
}

/** 每组有多少个cell */
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //取出相应的cargroup模型
    FRCarGroupItem *carGroup = self.carGroups[section];
    return carGroup.carItems.count;
}

/** cell的内容 */
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    //取出对应的模型
    FRCarGroupItem *carGroup = self.carGroups[indexPath.section];
    FRCarItem *car = carGroup.carItems[indexPath.row];
    
    
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    
    return cell;
}

/** 返回组头标题 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    FRCarGroupItem *carGroup = self.carGroups[section];
    return carGroup.title;
}


/** 返回索引条显示的文字 */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    // 抽取self.carGroups数组中每一个元素(XMGCarGroup对象)的title属性的值,放在一个新的数组中
    return [self.carGroups valueForKeyPath:@"title"];
    
}


@end
