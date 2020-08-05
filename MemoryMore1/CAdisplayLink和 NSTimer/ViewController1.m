//
//  ViewController1.m
//  MemoryMore1
//
//  Created by xiekunpeng on 2020/8/3.
//  Copyright © 2020 xiekunpeng. All rights reserved.
//

#import "ViewController1.h"
#import "ObjectObj.h"
#import "ProxyObj.h"

@interface ViewController1 ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) CADisplayLink *link;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     不论是CADisplayLink还是NSTimer这种用法, 都会导致循环引用;
     因为他们addTarget后都会对target强硬用, 使用weakself只对对block类型用法有效;
     */
    
    ///方案一: 使用 Block
    [self timerBlockAction];
    
    
//    ///方案二:使用中转转发对象
//    [self timerAction];
//    [self displaylinkAction];
//    ///NSProxy注意事项
//    [self proxyAttention];
}




/*********************************NSProxy注意事项*****************************************/
- (void)proxyAttention {
    ObjectObj *obj1 = [ObjectObj ShareTarget:self];
    ProxyObj  *obj2 = [ProxyObj ShareTarget:self];
    NSLog(@"%ld___%ld", (long)[obj1 isKindOfClass:[ViewController1 class]],
                        (long)[obj2 isKindOfClass:[ViewController1 class]]);
}



/*********************************方案一: 使用Block*****************************************/
- (void)timerBlockAction {
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf printAction];
    }];
}



/*********************************方案二: 使用中转转发对象*****************************************/
- (void)timerAction {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:[ObjectObj ShareTarget:self] selector:@selector(printAction) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)displaylinkAction {
    self.link = [CADisplayLink displayLinkWithTarget:[ProxyObj ShareTarget:self] selector:@selector(printAction)];
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
