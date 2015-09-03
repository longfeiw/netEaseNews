//
//  News.m
//  news
//
//  Created by 王龙飞 on 15/8/31.
//  Copyright (c) 2015年 王龙飞. All rights reserved.
//

#import "News.h"
#import "NetWorkTool.h"
#import <objc/runtime.h>
@implementation News

+ (instancetype)newsWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    NSArray *propertyList = [self loadProperties];
    for (NSString *key in propertyList) {
        if (dict[key] != nil) {
            
            [obj setValue:dict[key] forKeyPath:key];
        }
        
    }
//    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}
//下面的这个方法也可以
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//
//}
- (NSString *)description
{
    NSArray *propertyList = [self.class loadProperties];
    
    //输出字典
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertyList];
    
    return [NSString stringWithFormat:@"<%@: %p>, %@", self.class, self, dict];
}

const char *kPropertiesKey = "kPropertiesKey";
+ (NSArray *)loadProperties
{
    //利用关联对象,给类添加属性,oc中的类,本身就是一个特殊的对象
    /**
     获取关联对象
     1.对象,属性关联到的对象
     2.key,属性的key
    */
    NSArray *pList = objc_getAssociatedObject(self, kPropertiesKey);
    if (pList != nil) {
        return pList;
    }
    //获取关联对象,1.对象,属性关联的对象2.key,属性的key
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    NSLog(@"%u", count);
    
    //遍历数组
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++)
    {
        objc_property_t pty = list[i];
        
        //属性名称
        const char *cname = property_getName(pty);
        
        //添加到数组
        [arrayM addObject:[NSString stringWithUTF8String:cname]];
    }
    NSLog(@"%@", arrayM);
    
    //释放对象
    free(list);
    
    //设置关联对象对象
    /**
     设置关联对想爱你个的属性,运行时机制只能够,在OC开发的应用,关联对象使用的频率最高
     1. 属性关联的对象
     2.key
     3.值
     4.引用关系
     
     */
    objc_setAssociatedObject(self, kPropertiesKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return objc_getAssociatedObject(self, kPropertiesKey);;
}

+ (void)loadNewsListWithURLString:(NSString *)urlString
{
    [[NetWorkTool sharedNetWorkTools] GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        
//        NSLog(@"%@", responseObject);
        //url不同  拿到第一层的字典 key不同
        //利用keyEnumerator.nextObject能拿到第一个key
        //主要遍历字典
        NSLog(@"%@", responseObject.keyEnumerator.nextObject);
        
        //根据key拿到数组
        NSArray *array =  responseObject[responseObject.keyEnumerator.nextObject];
//        NSLog(@"%@", array);
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        //遍历数组字典转模型
        for (NSDictionary *dict in array) {
            
            //字典转模型 并加到可变数组中
            [arrayM addObject:[self newsWithDict:dict]];
            
        }
//        NSLog(@"%@", arrayM);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@", error);
    }];
}

@end
