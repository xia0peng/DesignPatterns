//
//  XPWann.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/30.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "XPWann.h"

@implementation XPWann

+ (instancetype)sharedInstance {
    // 静态局部变量
    static XPWann *instance = nil;
    
    // 通过 dispatch_once 方式 确保 instance 在多线程环境下只被创建一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 创建实例
        // 用 super 不能用 self
        // 1.因为当重写了 allocWithZone 方法时，如果这里用的是 self 调用的话，当对象第一次初始化时会产生循环调用。
        // 2.因为已经在 self 中重载了基本的对象分配方法，所以需要借用其父类的功能来帮助处理底层内存分配的杂物。
        // 在 Cocoa Touch 框架中，调用类的 allocWithZone:(NSZone *)zone 方法，会分配实例的内存，引用计数会置为 1，然后会返回实例。其实，alloc 是用设为 NULL 的 zone 来调用 allocWithZone：，在默认区域（zone）为新实力分配内存。
        instance = [[super allocWithZone:NULL] init];
    });
    
    return instance;
}

// 重写方法【必不可少】
// 因为外界有可能不通过 sharedInstance 方法获取对象，而是调用了 allocWithZone
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

// 重写方法【必不可少】
// 因为外界有可能通过对当前实例进行 copy 操作来创建一个对象
- (id)copyWithZone:(nullable NSZone *)zone {
    return self;
}

@end
