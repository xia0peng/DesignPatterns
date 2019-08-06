//
//  XPMarkEnumerator.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/5.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "XPMarkEnumerator.h"
#import "XPMarkEnumerator+Private.h"
#import "NSMutableArray+Stack.h"

@implementation XPMarkEnumerator

- (NSArray *)allObjects {
    // 返回还未访问的 Mark 节点的数组
    // 也就是栈中的剩余元素
    return [[self.stack reverseObjectEnumerator] allObjects];
}

- (id)nextObject {
    return [self.stack pop];
}

- (id)initWithMark:(id<XPIteratorMark>)mark {
    if (self = [super init]) {
        self.stack = [NSMutableArray arrayWithCapacity:[mark count]];
        
        // 后续遍历整个 Mark 聚合体
        // 然后把单个 Mark 加到私有栈中
        [self traverseAndBuildStackWithMark:mark];
    }
    return self;
}

- (void)traverseAndBuildStackWithMark:(id<XPIteratorMark>)mark {
    // 把后续遍历压住栈中
    if (mark == nil) {return;}
    
    [self.stack push:mark];
    
    NSUInteger index = [mark count];
    id <XPIteratorMark> childMark;
    
    // TODO: bug
    
    while (childMark == [mark childMarkAtIndex:--index]) {
        [self traverseAndBuildStackWithMark:childMark];
    }
}

@end
