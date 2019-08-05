//
//  Stroke.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/31.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "Stroke.h"

@implementation Stroke

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

- (void) addMark:(id <Mark>) mark {
    [self.children addObject:mark];
}

- (void) removeMark:(id <Mark>) mark {
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
        id <Mark> t = self.children.firstObject;
        return [t location];
    }
    // 否则返回原点
    return CGPointZero;
}

- (id <Mark>) childMarkAtIndex:(NSUInteger) index {
    if (index >= self.children.count) {
        return nil;
    }else{
        return self.children[index];
    }
}

- (id<Mark>)lastChild {
    return self.children.lastObject;
}

- (NSUInteger)count {
    return self.children.count;
}

@end
