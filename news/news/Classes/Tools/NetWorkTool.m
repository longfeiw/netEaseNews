//
//  NetWorkTool.m
//  news
//
//  Created by 王龙飞 on 15/8/31.
//  Copyright (c) 2015年 王龙飞. All rights reserved.
//

#import "NetWorkTool.h"

@implementation NetWorkTool

+ (instancetype)sharedNetWorkTools
{
    static NetWorkTool *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //后续使用可以用相对路径
        //baseURL 基本路径,注意:末尾需要以'/'结尾
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        instance = [[self alloc] initWithBaseURL:url];
    });
    
    return instance;
}

@end
