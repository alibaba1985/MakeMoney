//
//  MMJobViewCell.m
//  MakeMoney
//
//  Created by 王坜 on 15/9/13.
//  Copyright (c) 2015年 王坜. All rights reserved.
//

#import "MMJobViewCell.h"

@implementation MMJobViewCell

#pragma mark - imageView getter方法
- (UIImageView *)imageView
{
    // 懒加载imageView
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        // 保证图像按比例显示
        //[_imageView setContentMode:UIViewContentModeScaleAspectFit];
        
        [self addSubview:_imageView];
    }
    
    return _imageView;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置imageView大小和位置
    [self.imageView setFrame:self.bounds];
}


@end
