//
//  MMJobInfoView.m
//  MakeMoney
//
//  Created by 王坜 on 15/9/15.
//  Copyright (c) 2015年 王坜. All rights reserved.
//

#import "MMJobInfoView.h"

@interface MMJobInfoView ()
{
    UIView *_contentView;
}

@property (nonatomic, strong) NSDictionary *jobInfo;

@property (nonatomic, weak) UIView *containerView;

@property (nonatomic, assign) MMJobType jobType;

@end

@implementation MMJobInfoView

- (id)initWithInfo:(NSDictionary *)info jobType:(MMJobType)type container:(UIView *)container
{
    self = [super initWithFrame:container.bounds];
    if (self) {
        self.jobInfo = info;
        self.containerView = container;
        self.jobType = type;
        
        [self makeSubViews];
    }
    
    return self;
}

- (void)show
{
    [UIView transitionWithView:self.containerView duration:0.1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.containerView addSubview:self];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            _contentView.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (void)hide
{
    UtilRemoveView(self);
}

- (CGFloat)calculateContentHeight
{
    CGFloat height = 360;
    return height;

}

- (void)makeBackgroundView
{
    UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.6];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [bgView addGestureRecognizer:tap];
    
    [self addSubview:bgView];
}

- (void)makeContentView
{
    CGFloat width = CGRectGetWidth(self.bounds) - kMargin_10 * 2;
    CGFloat height = [self calculateContentHeight];
    CGFloat y = (CGRectGetHeight(self.bounds) - height) / 2;
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(kMargin_10, y, width, height)];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.layer.cornerRadius = 2;
    _contentView.transform = CGAffineTransformMakeScale(0.7, 0.7);
    [self addSubview:_contentView];
}

- (void)makeSubViews
{
    [self makeBackgroundView];
    
    switch (self.jobType) {
        case MMJobTypeDownload:
            [self makeDownloadView];
            break;
            
        default:
            break;
    }
}

- (void)makeDownloadView
{
    [self makeContentView];
}

@end
