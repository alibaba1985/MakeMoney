//
//  MMJobViewController.m
//  MakeMoney
//
//  Created by 王坜 on 15/9/12.
//  Copyright (c) 2015年 王坜. All rights reserved.
//

#import "MMJobViewController.h"
#import "WMLoopView.h"
#import "MMJobViewCell.h"
#import "MMJobHeaderView.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "MMWebViewController.h"

#define kImageWidth  145
#define kImageHeight 95

#define kAdverWidth  320
#define kAdverHeight 135

#define kCellDequeueID           @"JobCell"
#define kCellDequeueHeaderID     @"JobCellHeader"


@interface MMJobViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *jobList;


@end

@implementation MMJobViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self makeCollectionView];
    [self addPullRefreshActions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)makeBaseProperties
{
    [super makeBaseProperties];
    self.naviBarTitleLabel.text = @"首页";
}

- (void)makeCollectionView
{
    CGFloat itemWidth = (CGRectGetWidth(self.view.frame) - kMargin_10 * 3) / 2;
    CGFloat itemHeight = itemWidth * kImageHeight / kImageWidth;

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    layout.sectionInset = UIEdgeInsetsMake(kMargin_10, kMargin_10, kMargin_10, kMargin_10);
    layout.minimumInteritemSpacing = kMargin_10;
    layout.minimumLineSpacing = kMargin_10;
    
    
    
    //初始化CollectView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[MMJobViewCell class] forCellWithReuseIdentifier:kCellDequeueID];
    
    [collectionView registerClass:[MMJobHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCellDequeueHeaderID];

}


- (void)makeLoopView
{
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = width * kAdverHeight / kAdverWidth;
    
    NSString *url = @"https://tse1-mm.cn.bing.net/th?id=JN.ZRGgDZPBbLrhvVdQ9Mzj8A&w=125&h=105&c=7&rs=1&qlt=90&pid=3.1&rm=2";
    NSArray *images = @[url, url, url];
    WMLoopView *loopView = [[WMLoopView alloc] initWithFrame:CGRectMake(0, 0, width, height) images:images autoPlay:YES delay:2.0];
    loopView.delegate = self;
    
    [self.view addSubview:loopView];
}

- (void)addPullRefreshActions
{
    // add header
    __weak typeof(self) vc = self;
    // 添加下拉刷新头部控件
    [self.collectionView addHeaderWithCallback:^{
        // 进入刷新状态就会回调这个Block
        
        // 模拟延迟加载数据，因此2秒后才调用）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [vc.collectionView reloadData];
            // 结束刷新
            [vc.collectionView headerEndRefreshing];
        });
    }];

    // 一进程序就自动刷新
    [self.collectionView headerBeginRefreshing];
    
    // add footer
    
    [self.collectionView addFooterWithCallback:^{
        // 进入刷新状态就会回调这个Block
        // 模拟延迟加载数据，因此2秒后才调用）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [vc.collectionView reloadData];
            // 结束刷新
            [vc.collectionView footerEndRefreshing];
        });
    }];
}

- (void)showJobDetailViewAtIndex:(NSInteger)index
{
    
}

#pragma mark - LoopViewDelegate

- (void)loopViewDidSelectedImage:(WMLoopView *)loopView index:(int)index
{
    MMWebViewController *web = [[MMWebViewController alloc] initWithUrlString:@"http://www.baidu.com" barTitle:@"百度"];
    web.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:web animated:YES];
    
    
}


#pragma mark - CollectionView Delegate
#pragma mark - collectionView的数据源和代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 18;//self.jobList.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    MMJobViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellDequeueID forIndexPath:indexPath];;
    
    cell.backgroundColor = Color_Red;
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://tse1-mm.cn.bing.net/th?id=JN.ZRGgDZPBbLrhvVdQ9Mzj8A&w=125&h=105&c=7&rs=1&qlt=90&pid=3.1&rm=2"]];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = width * kAdverHeight / kAdverWidth;
    CGSize size={width,height};
    return size;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MMJobHeaderView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCellDequeueHeaderID forIndexPath:indexPath];
        reusableview.loopDelegate = self;
        NSString *url = @"https://tse1-mm.cn.bing.net/th?id=JN.ZRGgDZPBbLrhvVdQ9Mzj8A&w=125&h=105&c=7&rs=1&qlt=90&pid=3.1&rm=2";
        NSArray *images = @[url, url, url];
        [reusableview resetLoopViewWithImages:images];
    }
    
    
    return reusableview;
}



@end
