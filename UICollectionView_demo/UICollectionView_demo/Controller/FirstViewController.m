//
//  FirstViewController.m
//  UICollectionView_demo
//
//  Created by 方冬冬 on 2017/7/27.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "FirstViewController.h"
#import "StatusCollectionViewCell.h"

static NSString *headID = @"headIdentifier";

static NSString *footId = @"footIdentifier";
@interface FirstViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *customeCollectionView;


@end

@implementation FirstViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"纯代码创建collection";
    
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
    
    [self.view addSubview:self.customeCollectionView];
    
    //注册不带xib文件的cell
    //   [self.customeCollectionView registerClass:[CollectionViewCell1 class] forCellWithReuseIdentifier:@"StatusCollectionViewCell"];

    //注册cell
    [self.customeCollectionView registerNib:[UINib nibWithNibName:@"StatusCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"StatusCollectionViewCell"];
    
    //    //这是头部与脚部的注册  xib文件创建
    //    UINib *cellNib1=[UINib nibWithNibName:@"CollectionReusableView" bundle:nil];
    //    [self.customeCollectionView registerNib:cellNib1 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CollectionReusableView"];
    
    //村代码注册头部尾部视图
    //    [self.customeCollectionView registerClass:[UIView class]
    //            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
    //                   withReuseIdentifier:@"collectionFooterView"];
    
    //    [self.customeCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    //代码注册头部尾部视图
    [self.customeCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footId];
    
    
}
//每一个cell是什么
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    StatusCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"StatusCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

//选中点击cell的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
}

//一共有多少个组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//每一组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//每一个分组的上左下右间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{       //上  左 下  右
    return UIEdgeInsetsMake(10, 15, 5, 15);
}
////头部试图的大小
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake(50, 60);
//}
////脚部试图的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(50, 60);
}
//定义每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(110, 30);
}

////头部和脚部的加载
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    //纯代码创建footer和header
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *headerView = [self.customeCollectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headID forIndexPath:indexPath];
        if(headerView == nil)
        {
            headerView = [[UICollectionReusableView alloc] init];
        }
        headerView.backgroundColor = [UIColor grayColor];
        
        return headerView;
    }
    else if([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        UICollectionReusableView *footerView = [self.customeCollectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footId forIndexPath:indexPath];
        if(footerView == nil)
        {
            footerView = [[UICollectionReusableView alloc] init];
        }
        footerView.backgroundColor = [UIColor lightGrayColor];
        
        
        
        return footerView;
    }
    
    return nil;
    
}
@end
