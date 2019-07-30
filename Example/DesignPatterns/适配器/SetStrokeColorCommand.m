//
//  SetStrokeColorCommand.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/30.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "SetStrokeColorCommand.h"

@implementation SetStrokeColorCommand

- (void)execute {
    CGFloat redValue = 0.0;
    CGFloat greenValue = 0.0;
    CGFloat blueValue = 0.0;
    
    // 从委托取得 RGB 值
    [self.delegate command:self didRequestColorComponentsForRed:redValue green:greenValue blue:blueValue];
    
    // 根据 RGB 值创建一个颜色对象
    UIColor *color = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
    
    // 把它赋值给当前 canvasViewController
    
    // 转发更新成功消息
    [self.delegate command:self didFinishColorUpdateWithColor:color];
}

@end
