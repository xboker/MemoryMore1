//
//  XTimer.m
//  MemoryMore1
//
//  Created by xiekunpeng on 2020/8/3.
//  Copyright © 2020年 xiekunpeng. All rights reserved.
//

#import "XTimer.h"
#import <os/lock.h>
static NSMutableDictionary *timerDic;
static os_unfair_lock lock;
static NSInteger   timerCount;

@implementation XTimer

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timerDic = [NSMutableDictionary dictionaryWithCapacity:0];
        lock = OS_UNFAIR_LOCK_INIT;
        timerCount = 0;
    });
}
 



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
                          async:(BOOL)async {
    ///一些判断条件
    if (!task || begin < 0 || (interval <= 0 && repeat)) {
        return nil;
    }
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0 ) : dispatch_get_main_queue();
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    os_unfair_lock_lock(&lock);
    [timerDic setValue:timer forKey:Str(timerCount)];
    timerCount ++;
    os_unfair_lock_unlock(&lock);
    NSLog(@"%@", timerDic.description);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, begin * NSEC_PER_SEC, interval * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        task();
        if (!repeat) {
            [self cancelTask:Str(timerCount)];
        }
    });
    dispatch_resume(timer);
    return Str(timerCount);
}


 
/// 根据 key 取消任务
+ (void)cancelTask:(NSString *)hashStr {
    if (!hashStr) {
        return;
    }
    os_unfair_lock_lock(&lock);
    dispatch_source_t source = timerDic[hashStr];
    if (!source) {
        return;
    }
    dispatch_source_cancel(source);
    [timerDic removeObjectForKey:hashStr];
    timerCount --;
    os_unfair_lock_unlock(&lock);

    
}


///设定一个 key
NSString* Str(NSInteger count) {
    return [NSString stringWithFormat:@"%ld", count];
}

 
 


@end
