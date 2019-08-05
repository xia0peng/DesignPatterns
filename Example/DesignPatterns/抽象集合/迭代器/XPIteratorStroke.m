//
//  XPIteratorStroke.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/5.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "XPIteratorStroke.h"
#import "XPMarkEnumerator+Private.h"

@implementation XPIteratorStroke

@synthesize color;
@synthesize size;
@synthesize count;
@synthesize lastChild;

@dynamic location;

- (instancetype)init {
    if (self = [super init]) {
        self.children = [NSMutableArray arrayWithCapacity:5];
    }
    return self;
}

- (void) addMark:(id <XPIteratorMark>) mark {
    [self.children addObject:mark];
}

- (void) removeMark:(id <XPIteratorMark>) mark {
    // 如果 mark 在这一层，将其移除并返回
    // 否则，让每个子节点去找他
    if ([self.children containsObject:mark]) {
        [self.children removeObject:mark];
    } else {
        [self.children makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (void)setLocation:(CGPoint)location {
    // 不设定任何位置
}

- (CGPoint)location {
    // 返回第一个子节点的位置
    if ([self.children count] > 0) {
        id <XPIteratorMark> t = self.children.firstObject;
        return [t location];
    }
    // 否则返回原点
    return CGPointZero;
}

- (id <XPIteratorMark>) childMarkAtIndex:(NSUInteger) index {
    if (index >= self.children.count) {
        return nil;
    }else{
        return self.children[index];
    }
}

- (id<XPIteratorMark>)lastChild {
    return self.children.lastObject;
}

- (NSUInteger)count {
    return self.children.count;
}

#pragma mark -
#pragma mark - enumerator method

- (NSEnumerator *)enumerator {
    
    return [[XPMarkEnumerator alloc] initWithMark:self];
}

// 用于实现内部迭代器
- (void)enumerateMarksUsingBlock:(void (^)(id<XPIteratorMark> _Nonnull, BOOL * _Nonnull))block {
    BOOL stop = NO;
    
    NSEnumerator *enumerator = [self enumerator];
    
//    for (id <XPIteratorMark> mark in enumerator)
//    {
//        block (mark, &stop);
//        if (stop)
//            break;
//    }
    
    id <XPIteratorMark> mark;
    
    while (mark = [enumerator nextObject]) {
        block (mark, &stop);
        if (stop) {
            break;
        }
    }
}

@end
