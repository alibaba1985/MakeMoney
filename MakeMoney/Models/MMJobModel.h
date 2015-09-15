//
//  MMJobModel.h
//  MakeMoney
//
//  Created by 王坜 on 15/9/13.
//  Copyright (c) 2015年 王坜. All rights reserved.
//

#import "JSONModel.h"

@interface MMJobModel : JSONModel

@property (nonatomic, strong) NSString<Optional> *context;
@property (nonatomic, strong) NSString<Optional> *price;
@property (nonatomic, strong) NSString<Optional> *keyWord;

@end
