//
//  ClothCanvasViewGenerator.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/26.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "ClothCanvasViewGenerator.h"
#import "ClothCanvasView.h"

@implementation ClothCanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)aFrame {
    
    return [[ClothCanvasView alloc] initWithFrame:aFrame];
}

@end
