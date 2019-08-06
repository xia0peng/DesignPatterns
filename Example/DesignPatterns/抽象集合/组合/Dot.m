//
//  Dot.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/31.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "Dot.h"

@implementation Dot

@synthesize color;
@synthesize size;

- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor {
    [visitor visitDot:self];
}

@end
