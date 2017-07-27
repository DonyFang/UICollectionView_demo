//
//  ThirdViewController.h
//  UICollectionView_demo
//
//  Created by 方冬冬 on 2017/7/27.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataModel;

typedef NSMutableArray *(^PushValue)(NSMutableArray *arr);

@interface ThirdViewController : UIViewController


@property(nonatomic,strong)PushValue pushBlock;

@property(nonatomic,strong)NSMutableArray *selectedItem;
@end
