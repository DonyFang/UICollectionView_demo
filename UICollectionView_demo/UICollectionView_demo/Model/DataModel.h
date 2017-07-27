//
//  DataModel.h
//  UICollectionView_demo
//
//  Created by 方冬冬 on 2017/7/27.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic,readwrite,copy)NSString *title;
//- (void)isSelected;

@property(nonatomic,assign)BOOL isSelected;


@property(nonatomic,strong)NSIndexPath *currentIndex;

@end
