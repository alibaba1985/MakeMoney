//
//  WKTabBarController.m
//  WokWok
//
//  Created by 王坜 on 15/8/13.
//  Copyright (c) 2015年 王坜. All rights reserved.
//

#import "WKTabBarController.h"
#import "WKNavigationController.h"
#import "MMJobViewController.h"
#import "MMExchangeViewController.h"
#import "MMMineViewController.h"
#import "MMMoreViewController.h"

@interface WKTabBarController ()
{
    NSMutableArray *_customTabBarItems;
    NSMutableArray *_customViewControllers;
}

@end

@implementation WKTabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureProperties];
    [self makeViewControllers];
    [self makeTabBarItems];
    
}


- (void)configureProperties
{
    self.tabBar.tintColor = Color_RGB(245, 106, 69);
}


- (void)makeViewControllers
{
    NSArray *classes = @[[MMJobViewController class],
                         [MMExchangeViewController class],
                         [MMMineViewController class],
                         [MMMoreViewController class]];
    
    _customViewControllers = [[NSMutableArray alloc] init];
    
    for (Class class in classes) {
        WKNavigationController *navi = [self navigationControllerWithClass:class];
        [_customViewControllers addObject:navi];
        
    }
    
    self.viewControllers = _customViewControllers;
    
}


- (WKNavigationController *)navigationControllerWithClass:(Class)class
{
    UIViewController *viewController = [[class alloc] init];
    WKNavigationController *naviController = [[WKNavigationController alloc] initWithRootViewController:viewController];
    
    return naviController;
    
}


- (void)makeTabBarItems
{
    _customTabBarItems = [[NSMutableArray alloc] init];
    
    NSArray *titles = @[@"赚钱任务", @"兑换", @"我的", @"更多"];
    NSArray *normalImages = @[@"task", @"exchange", @"my", @"more"];
    NSArray *selectedImages = @[@"task_another", @"exchange_another", @"my_another", @"more_another"];
    
    for (NSInteger i = 0; i < 4; i++) {
        
        NSString *title = [titles objectAtIndex:i];
        UIImage *normalImage = [UIImage imageNamed:[normalImages objectAtIndex:i]];
        UIImage *selectedImage = [UIImage imageNamed:[selectedImages objectAtIndex:i]];
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectedImage];
        [_customTabBarItems addObject:item];
        UIViewController *viewController = [_customViewControllers objectAtIndex:i];
        viewController.tabBarItem = item;
    }
}


@end
