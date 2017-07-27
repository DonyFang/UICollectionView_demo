//
//  DataViewModel.m
//  UICollectionView_demo
//
//  Created by 方冬冬 on 2017/7/27.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "DataViewModel.h"
#import "DataModel.h"

@interface DataViewModel()


@end
@implementation DataViewModel

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArr;
}


- (void)loadDataFromeServer{
    NSArray *dataArr = @[@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"},@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"},@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"},@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"},@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"},@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"},@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"},@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"},@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"},@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"},@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"},@{@"title":@"正常"},
                         @{@"title":@"1元缺币"},
                         @{@"title":@"5毛缺币"},
                         @{@"title":@"失联"}
                         ,@{@"title":@"位置异常"}
                         ,@{@"title":@"货道异常"}
                         ,@{@"title":@"纸币器异常"}
                         ,@{@"title":@"串口通讯异常"}
                         ,@{@"title":@"门异常"}
                         ];
    for (NSDictionary *dic in dataArr) {
        self.model = [[DataModel alloc] init];
        [self.model setValuesForKeysWithDictionary:dic];
        [self.dataArr addObject:self.model];
    }
    
}


@end
