//
//  SierraBrandingFactory.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/27.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "SierraBrandingFactory.h"

@implementation SierraBrandingFactory

- (UIView *)brandedView {
    
    // 返回 Sierra 定制视图
    // return [SierraView new];
    return nil;
}

- (UIButton *)brandedMainButton {
    
    // 返回 Sierra 定制主按钮
    // return [SierraMainButton new];
    return nil;
}

- (UIToolbar *)brandedToolbar {
    
    // 返回 Sierra 定制工具条
    // return [SierraToolbar new];
    return nil;
}

@end
