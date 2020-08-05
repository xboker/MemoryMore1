
//
//  ViewController2.m
//  MemoryMore1
//
//  Created by xiekunpeng on 2020/8/3.
//  Copyright © 2020年 xiekunpeng. All rights reserved.
//

#import "ViewController2.h"
#import "XTimer.h"


@interface ViewController2 ()
@property (nonatomic, strong) dispatch_source_t timer;
@property (nonatomic, strong) NSString *timerStr;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GCDTimerAction];
    
//    self.timerStr =  [XTimer excuteTimerWithTask:^{
//        NSLog(@"%@", [NSThread currentThread]);
//    } begin:1 interval:1 repeat:YES async:YES];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [XTimer cancelTask:self.timerStr];
}


- (void)GCDTimerAction {
    ///创建一个队列
    dispatch_queue_t queue = dispatch_queue_create("111", DISPATCH_QUEUE_SERIAL);
    ///创建一个GCDTimer, 它的类型是DISPATCH_SOURCE, 注意Timer一定要强引用
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    /*
     设置Timer的一些参数
     参数1: 设置多久后触发timer
     参数2: 设置间隔多久触发一次timer
     */
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
    ///timer的调用方法
    dispatch_source_set_event_handler(self.timer, ^{
        NSLog(@"触发GCDTimer %@", [NSThread currentThread]);
    });
    ///重置timer
    dispatch_resume(self.timer);
}


- (void)dealloc {
    NSLog(@"%s", __func__);
}



@end
