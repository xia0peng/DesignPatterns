//
//  ScribbleMemento.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/10.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "ScribbleMemento.h"
#import "ScribbleMemento+Friend.h"

@implementation ScribbleMemento

@synthesize mark;
@synthesize hasCompleteSnapshot;

- (NSData *)data {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.mark];
    return data;
}

+ (ScribbleMemento *)mementoWithData:(NSData *)data {
    // It raises an NSInvalidArchiveOperationException if data is not a valid archive
    id <Mark> retoredMark = (id <Mark>)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    ScribbleMemento *memento = [[ScribbleMemento alloc]
                                 initWithMark:retoredMark];
    return memento;
}

- (id)initWithMark:(id<Mark>)aMark {
    if (self = [super init]) {
        [self setMark:aMark];
    }
    return self;
}

@end
