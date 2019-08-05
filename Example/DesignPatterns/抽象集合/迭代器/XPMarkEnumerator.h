//
//  XPMarkEnumerator.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/5.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XPMarkEnumerator : NSEnumerator

@property (nonatomic, strong) NSMutableArray *stack;

- (NSArray *)allObjects; // 重写父类方法
- (id)nextObject; // 重写父类方法

@end

NS_ASSUME_NONNULL_END
