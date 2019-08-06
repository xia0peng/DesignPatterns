//
//  Vertex.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/31.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

@synthesize location;

- (id) initWithLocation:(CGPoint) aLocation
{
    if (self = [super init])
    {
        [self setLocation:aLocation];
    }
    
    return self;
}

- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor {
    [visitor visitVertex:self];
}

@end
