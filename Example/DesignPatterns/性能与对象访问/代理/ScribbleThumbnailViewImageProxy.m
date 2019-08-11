//
//  ScribbleThumbnailViewImageProxy.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/11.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "ScribbleThumbnailViewImageProxy.h"

@interface ScribbleThumbnailViewImageProxy ()

// 用于转发加载线程的私有范畴
- (void) forwardImageLoadingThread;

@end

@implementation ScribbleThumbnailViewImageProxy

@dynamic imagePath;
@dynamic image;

// 如果不需要把对象显示在视图上，客户端可以直接使用这个方法来转发真实图像的加载
- (UIImage *) image
{
    if (realImage_ == nil)
    {
        realImage_ = [[UIImage alloc] initWithContentsOfFile:self.imagePath];
    }
    
    return realImage_;
}

// 在不同的线程会建立转发的调用，从真实图像加载实际内容
// 在实际内容返回前，drawRect 会处理后台的加载过程，并绘制一个占位图框
// 一旦实际内容加载完成，就会用实际内容进行重画
- (void)drawRect:(CGRect)rect
{
    // if is no real image available
    // from realImageView_,
    // then just draw a blank frame
    // as a placeholder image
    if (realImage_ == nil)
    {
        // Drawing code
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        // draw a placeholder frame
        // with a 10-user-space-unit-long painted
        // segment and a 3-user-space-unit-long
        // unpainted segment of a dash line
        CGContextSetLineWidth(context, 10.0);
        const CGFloat dashLengths[2] = {10,3};
        CGContextSetLineDash (context, 3, dashLengths, 2);
        CGContextSetStrokeColorWithColor(context, [[UIColor darkGrayColor] CGColor]);
        CGContextSetFillColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
        CGContextAddRect(context, rect);
        CGContextDrawPath(context, kCGPathFillStroke);
        
        // launch a thread to load the real
        // payload if it hasn't done yet
        if (!loadingThreadHasLaunched_)
        {
            [self performSelectorInBackground:@selector(forwardImageLoadingThread)
                                   withObject:nil];
            loadingThreadHasLaunched_ = YES;
        }
    }
    // otherwise pass the draw*: message
    // along to realImage_ and let it
    // draw the real image
    else
    {
        [realImage_ drawInRect:rect];
    }
}

#pragma mark -
#pragma mark A private method for loading a real image in a thread

- (void) forwardImageLoadingThread
{
    @autoreleasepool {
        // forward the message to load
        // the real image payload
        [self image];
        
        // redraw itself with the newly loaded image
        [self performSelectorInBackground:@selector(setNeedsDisplay) withObject:nil];
        
    }
}

@end
