//
//  NetWorkTool.h
//  news
//
//  Created by 王龙飞 on 15/8/31.
//  Copyright (c) 2015年 王龙飞. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetWorkTool : AFHTTPSessionManager

/**
 *  全局访问入口
 */
+ (instancetype)sharedNetWorkTools;

@end
