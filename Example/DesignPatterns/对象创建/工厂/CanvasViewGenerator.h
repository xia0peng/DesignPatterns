//
//  CanvasViewGenerator.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/25.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CanvasView;

@interface CanvasViewGenerator : NSObject

- (CanvasView *)canvasViewWithFrame:(CGRect)aFrame;

@end

NS_ASSUME_NONNULL_END
