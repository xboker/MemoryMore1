//
//  ObjectObj.h
//  MemoryMore1
//
//  Created by xiekunpeng on 2020/8/3.
//  Copyright © 2020 xiekunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjectObj : NSObject

+ (ObjectObj *)ShareTarget:(id)obj;
@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
