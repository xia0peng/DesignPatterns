//
//  ReubenSandwich.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/8.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "AnySandwich.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReubenSandwich : AnySandwich

// 重载父类方法
- (void)prepareBread;
- (void)addMeat;
- (void)addCondiments;
- (void)extraStep;

// 鲁宾三明治的特有操作
- (void)cutRyeBread;
- (void)addCornBeef;
- (void)addSauerkraut;
- (void)addThousandIslandDressing;
- (void)addSwissCheese;
- (void)grillIt;

@end

NS_ASSUME_NONNULL_END
