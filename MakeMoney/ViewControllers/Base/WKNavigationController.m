//
//  WKNavigationController.m
//  WokWok
//
//  Created by 王坜 on 15/8/13.
//  Copyright (c) 2015年 王坜. All rights reserved.
//

#import "WKNavigationController.h"

@implementation WKNavigationController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NaviBar.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:@{
                                   NSForegroundColorAttributeName : [UIColor whiteColor]
                                   }];
}


@end
