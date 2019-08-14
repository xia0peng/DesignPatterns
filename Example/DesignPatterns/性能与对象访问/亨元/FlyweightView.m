//
//  FlyweightView.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/14.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "FlyweightView.h"
//#import "FlowerFlyweightFactory.h"
#import "FlyweightMode.h"

@implementation FlyweightView

@synthesize flowerList = flowerList_;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    for (NSValue *stateValue in flowerList_)
//    {
//        ExtrinesicFlowerState state;
//        [stateValue getValue:&state];
//
//
//        UIView *flowerView = CFBridgingRelease((__bridge struct UIView *)(state.flowerView));
//        CGRect area = state.area;
//
//        [flowerView drawRect: area];
//    }
    
    for (FlyweightMode *mode in flowerList_)
    {
        UIView *flowerView = mode.flowerView;
        CGRect area = mode.area;
        
        [flowerView drawRect:area];
        
    }
}

@end
