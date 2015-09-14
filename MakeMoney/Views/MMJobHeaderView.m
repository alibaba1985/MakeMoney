//
//  MMJobHeaderView.m
//  MakeMoney
//
//  Created by 王坜 on 15/9/13.
//  Copyright (c) 2015年 王坜. All rights reserved.
//

#import "MMJobHeaderView.h"

@interface MMJobHeaderView ()
{
    WMLoopView *_loopView;
}

@end


@implementation MMJobHeaderView


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UtilRemoveView(_loopView);
    
    if (!UtilIsNilOrEmptyArray(self.loopImages)) {
        CGFloat width = CGRectGetWidth(self.frame);
        CGFloat height = CGRectGetHeight(self.frame);
        
        _loopView = [[WMLoopView alloc] initWithFrame:CGRectMake(0, 0, width, height) images:self.loopImages autoPlay:YES delay:10.0];
        _loopView.delegate = self.loopDelegate;
        [self addSubview:_loopView];
    }
}


- (void)resetLoopViewWithImages:(NSArray *)images
{
    self.loopImages = images;
    [self setNeedsLayout];
}

@end
