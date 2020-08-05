//
//  ObjectObj.m
//  MemoryMore1
//
//  Created by xiekunpeng on 2020/8/3.
//  Copyright © 2020 xiekunpeng. All rights reserved.
//

#import "ObjectObj.h"

@implementation ObjectObj

 

+ (ObjectObj *)ShareTarget:(id)obj {
    ObjectObj *object = [[ObjectObj alloc] init];
    object.target = obj;
    return  object;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.target;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
