//
//  StatusCollectionViewCell.m
//  UICollectionView_demo
//
//  Created by 方冬冬 on 2017/7/27.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "StatusCollectionViewCell.h"

@interface StatusCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLa;

@end

@implementation StatusCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 4;
    self.layer.borderColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:155/255.0].CGColor;
    self.layer.borderWidth = 1.0f;
    [self setClipsToBounds:YES];
    self.titleLa.textColor =[UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:155/255.0];
}

-  (void)setDataModel:(DataModel *)dataModel{
    
    self.titleLa.text = dataModel.title;
    if (dataModel.isSelected) {
        [self setTextColorAndBorderColorSelected:YES];
    }else{
        [self setTextColorAndBorderColorSelected:NO];

    }
    
}


- (void)setTextColorAndBorderColorSelected:(BOOL)isSelecteed{
    
    if (isSelecteed) {
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.titleLa.textColor =[UIColor redColor];
    }else{
        self.layer.borderColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:155/255.0].CGColor;
        
        self.titleLa.textColor =[UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:155/255.0];
    }

}
@end
