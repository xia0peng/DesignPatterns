//
//  Stroke.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/31.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "Stroke.h"

//@property (nonatomic, retain) UIColor *color;
//@property (nonatomic, assign) CGFloat size;
//@property (nonatomic, assign) CGPoint location;
//@property (nonatomic, readonly) NSUInteger count;
//@property (nonatomic, readonly) id <Mark> lastChild;
//
//- (void) addMark:(id <Mark>) mark;
//- (void) removeMark:(id <Mark>) mark;
//- (id <Mark>) childMarkAtIndex:(NSUInteger) index;

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
    [self.children removeObject:mark];
}

- (CGPoint)location {
    return CGPointZero;
}

//- (id <Mark>) childMarkAtIndex:(NSUInteger) index;

@end
