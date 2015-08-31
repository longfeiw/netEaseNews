//
//  AppDelegate.m
//  news
//
//  Created by 王龙飞 on 15/8/31.
//  Copyright (c) 2015年 王龙飞. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworkActivityIndicatorManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //1. 设置缓存 缓存-4M 本地磁盘20M 沙盒路径:默认
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:4 *1024 * 1024 diskCapacity:20 *1024 * 1024 diskPath:nil];
    
    [NSURLCache setSharedURLCache:cache];
    
    //设置网络指示器
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    return YES;
}


@end
