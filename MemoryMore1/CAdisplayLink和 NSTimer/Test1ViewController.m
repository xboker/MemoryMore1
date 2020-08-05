//
//  Test1ViewController.m
//  MemoryMore1
//
//  Created by xiekunpeng on 2020/8/3.
//  Copyright © 2020 xiekunpeng. All rights reserved.
//

#import "Test1ViewController.h"

@interface Test1ViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) CADisplayLink *link;
@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     不论是CADisplayLink还是NSTimer这种用法, 都会导致循环引用;
     因为他们addTarget后都会对target强硬用, 使用weakself只对对block类型用法有效;
     */
    [self timerAction];
//    [self displaylinkAction];
}




- (void)timerAction {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(printAction) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)displaylinkAction {
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(printAction)];
    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)printAction {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    [self.link invalidate];
    [self.timer invalidate];
    NSLog(@"%s", __func__);
}

@end
