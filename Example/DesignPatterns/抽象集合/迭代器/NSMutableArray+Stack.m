//
//  NSMutableArray+Stack.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/5.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void)push:(id)object {
    [self addObject:object];
}

- (id)pop {
    if (self.count == 0) {return nil;}
    
    id object = [self lastObject];
    [self removeLastObject];
    
    return object;
}

@end
