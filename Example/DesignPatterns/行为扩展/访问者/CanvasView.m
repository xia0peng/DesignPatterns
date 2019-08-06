//
//  CanvasView.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/5.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"
#import "Mark.h"

@implementation CanvasView

@synthesize mark=mark_;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    // Drawing code 绘制代码
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // create a renderer visitor 创建 renderer 访问者
    MarkRenderer *markRenderer = [[MarkRenderer alloc] initWithCGContext:context];
    
    // pass this renderer along the mark composite structure
    // 把 renderer 沿着 mark 组合结构传递
    [mark_ acceptMarkVisitor:markRenderer];
    
}

@end
