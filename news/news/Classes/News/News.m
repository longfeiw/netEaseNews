//
//  News.m
//  news
//
//  Created by 王龙飞 on 15/8/31.
//  Copyright (c) 2015年 王龙飞. All rights reserved.
//

#import "News.h"
#import "NetWorkTool.h"
@implementation News

+ (instancetype)newsWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

+ (void)loadNewsListWithURLString:(NSString *)urlString
{
    [[NetWorkTool sharedNetWorkTools] GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@", error);
    }];
}

@end
