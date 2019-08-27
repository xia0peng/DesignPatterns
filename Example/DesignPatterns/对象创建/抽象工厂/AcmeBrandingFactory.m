//
//  AcmeBrandingFactory.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/27.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "AcmeBrandingFactory.h"

@implementation AcmeBrandingFactory

- (UIView *)brandedView {
    
    // 返回 Acme 定制视图
    // return [AcmeView new];
    return nil;
}

- (UIButton *)brandedMainButton {
    
    // 返回 Acme 定制主按钮
    // return [AcmeMainButton new];
    return nil;
}

- (UIToolbar *)brandedToolbar {
    
    // 返回 Acme 定制工具条
    // return [AcmeToolbar new];
    return nil;
}

@end
