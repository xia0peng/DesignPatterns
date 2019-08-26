//
//  CanvasViewGenerator.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/25.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "CanvasViewGenerator.h"
#import "CanvasView.h"

@implementation CanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)aFrame {
    
    return [[CanvasView alloc] initWithFrame:aFrame];
}

@end
