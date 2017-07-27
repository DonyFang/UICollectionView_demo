//
//  DataViewModel.h
//  UICollectionView_demo
//
//  Created by 方冬冬 on 2017/7/27.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DataModel;
@interface DataViewModel : NSObject
@property(nonatomic,strong)DataModel *model;

@property(nonatomic,strong)NSMutableArray *dataArr;

- (void)loadDataFromeServer;


@end
