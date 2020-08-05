//
//  ProxyObj.m
//  MemoryMore1
//
//  Created by xiekunpeng on 2020/8/3.
//  Copyright © 2020 xiekunpeng. All rights reserved.
//

#import "ProxyObj.h"

@implementation ProxyObj

+ (ProxyObj *)ShareTarget:(id)obj {
    ProxyObj *object = [ProxyObj alloc] ;
    object.target = obj;
    return  object;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
   return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    invocation.target = self.target;
    [invocation invoke];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
