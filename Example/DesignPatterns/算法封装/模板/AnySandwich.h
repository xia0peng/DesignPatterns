//
//  AnySandwich.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/8.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnySandwich : NSObject

- (void)make;

// 制作三明治🥪的补助
- (void)prepareBread;
- (void)putBreadOnPlate;
- (void)addMeat;
- (void)addCondiments;
- (void)extraStep; // 可选步骤，钩子方法
- (void)serve;

@end

NS_ASSUME_NONNULL_END
