//
//  StatusCollectionViewCell.h
//  UICollectionView_demo
//
//  Created by 方冬冬 on 2017/7/27.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface StatusCollectionViewCell : UICollectionViewCell

@property(nonatomic,copy)DataModel *dataModel;
- (void)setTextColorAndBorderColorSelected:(BOOL)isSelecteed;

@end
