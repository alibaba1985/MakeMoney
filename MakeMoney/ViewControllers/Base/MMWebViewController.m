//
//  MMWebViewController.m
//  MakeMoney
//
//  Created by 王坜 on 15/9/14.
//  Copyright (c) 2015年 王坜. All rights reserved.
//

#import "MMWebViewController.h"

@interface MMWebViewController ()

@property (nonatomic, strong) NSURL *url;

@property (nonatomic, strong) NSString *barTitle;

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation MMWebViewController


- (id)initWithUrlString:(NSString *)urlString barTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        if (!UtilIsNilOrEmptyString(urlString)) {
            self.url = [NSURL URLWithString:urlString];
        }
        
        if (!UtilIsNilOrEmptyString(title)) {
            self.barTitle = title;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makeWebView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.webView setFrame:self.view.bounds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)makeWebView
{
    if (self.url == nil) {
        return;
    }
    self.webView = ({
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        NSURLRequest *requet = [[NSURLRequest alloc] initWithURL:self.url];
        [webView loadRequest:requet];
        webView;
    });
    
    [self.view addSubview:self.webView];
    
    self.naviBarTitleLabel.text = self.barTitle;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
