//
//  News.h
//  news
//
//  Created by 王龙飞 on 15/8/31.
//  Copyright (c) 2015年 王龙飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

/**新闻标题*/
@property (nonatomic, copy) NSString *title;

/**新闻摘要*/
@property (nonatomic, copy) NSString *digest;

/**跟帖数量*/
@property (nonatomic, assign) int *replyCount;

/**配图地址*/
@property (nonatomic, copy) NSString *imgsrc;

+ (instancetype)newsWithDict:(NSDictionary *)dict;

/**加载指定URL的新闻数组*/
+ (void)loadNewsListWithURLString:(NSString *)urlString;

@end
