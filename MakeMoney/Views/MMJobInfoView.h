//
//  MMJobInfoView.h
//  MakeMoney
//
//  Created by 王坜 on 15/9/15.
//  Copyright (c) 2015年 王坜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MMJobType) {
    MMJobTypeDownload,
    MMJobTypeRecharge,
};

@interface MMJobInfoView : UIView

- (id)initWithInfo:(NSDictionary *)info jobType:(MMJobType)type container:(UIView *)container;

- (void)show;


@end
