//
//  MMJobHeaderView.h
//  MakeMoney
//
//  Created by 王坜 on 15/9/13.
//  Copyright (c) 2015年 王坜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMLoopView.h"

@interface MMJobHeaderView : UICollectionReusableView

@property (nonatomic, strong) NSArray *loopImages;

@property (nonatomic, weak) id<WMLoopViewDelegate> loopDelegate;

- (void)resetLoopViewWithImages:(NSArray *)images;

@end
