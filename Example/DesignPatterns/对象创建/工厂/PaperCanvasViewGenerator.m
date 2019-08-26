//
//  PaperCanvasViewGenerator.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/26.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "PaperCanvasViewGenerator.h"
#import "PaperCanvasView.h"

@implementation PaperCanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)aFrame {
    
    return [[PaperCanvasView alloc] initWithFrame:aFrame];
}

@end
