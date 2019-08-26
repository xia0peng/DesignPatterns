//
//  ClothCanvasView.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/25.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "ClothCanvasView.h"

@implementation ClothCanvasView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        // 在上面添加一个质图像视图作为画布背景
        UIImage *backgroundImage = [UIImage imageNamed:@"cloth"];
        UIImageView *backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
        [self addSubview:backgroundView];
    }
    return self;
}

@end
