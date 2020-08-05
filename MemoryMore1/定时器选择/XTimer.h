//
//  XTimer.h
//  MemoryMore1
//
//  Created by xiekunpeng on 2020/8/3.
//  Copyright © 2020年 xiekunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

 
NS_ASSUME_NONNULL_BEGIN

@interface XTimer : NSObject


/// 创建一个定时器并启动 返回这个定时器的 hash
/// @param task 需要执行的任务
/// @param begin 开始时间
/// @param interval 执行间隔
/// @param repeat 是否重复
/// @param async 是否异步执行
+ (NSString *)excuteTimerWithTask:(void(^)(void))task
                          begin:(double)begin
                       interval:(double)interval
                         repeat:(BOOL)repeat
                          async:(BOOL)async;

 
/// 取消hash值为hashStr的timer任务
+ (void)cancelTask:(NSString *)hashStr ;


@end

NS_ASSUME_NONNULL_END
