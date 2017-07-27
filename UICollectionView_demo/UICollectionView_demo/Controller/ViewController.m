//
//  ViewController.m
//  UICollectionView_demo
//
//  Created by 方冬冬 on 2017/7/27.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *mainTable;

@property(nonatomic,strong)NSMutableArray *dataArr;

@end
//CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)]
@implementation ViewController

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.mainTable];
    self.mainTable.delegate = self;
    
    self.mainTable.dataSource = self;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @" simpleOne";
        
    }else if(indexPath.row == 1){
        cell.textLabel.text = @" simpleTWo";
        
    }else if(indexPath.row == 2){
    
        cell.textLabel.text = @" simpleThree";

    
    }
    
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FirstViewController *first = [[FirstViewController alloc] init];
        [self.navigationController pushViewController:first animated:YES];
    }else if (indexPath.row == 1){
        SecondViewController *second = [[SecondViewController alloc] init];
        
        second.selectedItem = self.dataArr;
        
        second.pushBlock = ^NSMutableArray *(NSMutableArray *arr) {
            self.dataArr = arr;
            return arr;
        };
        [self.navigationController pushViewController:second animated:YES];

    }else{
    
    
        ThirdViewController *third = [[ThirdViewController alloc] init];
        third.selectedItem = self.dataArr;

        third.pushBlock = ^NSMutableArray *(NSMutableArray *arr) {
            self.dataArr = arr;
            return arr;
        };
        [self.navigationController pushViewController:third animated:YES];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}
@end
