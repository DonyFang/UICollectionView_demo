//
//  SecondViewController.m
//  UICollectionView_demo
//
//  Created by 方冬冬 on 2017/7/27.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "SecondViewController.h"
#import "StatusCollectionViewCell.h"
#import "CollectionReusableFooterView.h"
#import "DataViewModel.h"
static NSString *headID = @"headIdentifier";

static NSString *footId = @"footIdentifier";
@interface SecondViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *customeCollectionView;


@property(nonatomic,strong)DataViewModel *dataViewModel;


@end



@implementation SecondViewController

- (NSMutableArray *)selectedItem{
    if (!_selectedItem) {
        _selectedItem = [NSMutableArray arrayWithCapacity:0];
    }
    return _selectedItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"xib创建collectionView";
    
    
    self.dataViewModel = [[DataViewModel alloc] init];
    
    [self.dataViewModel loadDataFromeServer];

    self.view.backgroundColor = [UIColor whiteColor];
    //此处必须要有创见一个UICollectionViewFlowLayout的对象
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout.minimumInteritemSpacing = 5;
    //    //最小两行之间的间距
    layout.minimumLineSpacing = 15;
    
    
    //设置每一个cell的大小
    //    layout.itemSize=CGSizeMake(100, 50);
    //设置滚动的方向
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    //设置头部视图的大小
//    layout.headerReferenceSize = CGSizeMake(320, 100);

    CGRect frame =  CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
    self.customeCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    self.customeCollectionView.backgroundColor = [UIColor whiteColor];
    self.customeCollectionView.delegate = self;
    
    self.customeCollectionView.dataSource  = self;
    
//    self.customeCollectionView.allowsMultipleSelection = YES;
    [self.view addSubview:self.customeCollectionView];

    //注册cell
    [self.customeCollectionView registerNib:[UINib nibWithNibName:@"StatusCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"StatusCollectionViewCell"];
    
    //    //这是头部与脚部的注册  xib文件创建
    UINib *cellNib1=[UINib nibWithNibName:@"CollectionReusableFooterView" bundle:nil];
    [self.customeCollectionView registerNib:cellNib1 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footId];

 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//每一个cell是什么
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    StatusCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"StatusCollectionViewCell" forIndexPath:indexPath];
    cell.dataModel = self.dataViewModel.dataArr[indexPath.item];

    if (self.selectedItem.count > 0 ) {
        for (DataModel *model  in self.selectedItem) {
            StatusCollectionViewCell *cell = (StatusCollectionViewCell *) [collectionView cellForItemAtIndexPath:model.currentIndex];
            [cell setTextColorAndBorderColorSelected:YES];
        }
    }
    return cell;
}

//选中点击cell的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DataModel *model =  self.dataViewModel.dataArr[indexPath.item];
    
    StatusCollectionViewCell *cell = (StatusCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    
    if (![self.selectedItem containsObject:model]) {
        model.isSelected = YES;
        cell.dataModel = model;
        model.currentIndex  = indexPath;
        [self.selectedItem addObject:model];
    }else{
        model.isSelected = NO;
        cell.dataModel=model;
        [self.selectedItem removeObject:model];
    }
    
//    [cell setTextColorAndBorderColorSelected:YES];
//    [self.selectedItem addObject:self.dataViewModel.dataArr[indexPath.item]];
}
//
//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    StatusCollectionViewCell *cell = (StatusCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
//    [cell setTextColorAndBorderColorSelected:NO];
//    [self.selectedItem removeObject:self.dataViewModel.dataArr[indexPath.item]];
//}

//一共有多少个组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//每一组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataViewModel.dataArr.count;
}

//每一个分组的上左下右间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{       //上  左 下  右
    return UIEdgeInsetsMake(10, 15, 10, 15);
}

////脚部试图的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(self.view.frame.size.width, 50);
}
//定义每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(110, 30);
}

////头部和脚部的加载
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (kind== UICollectionElementKindSectionFooter)  {
        CollectionReusableFooterView *hview = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footId forIndexPath:indexPath];
        return hview;
    }
    return nil;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    self.pushBlock(self.selectedItem);

}
@end
