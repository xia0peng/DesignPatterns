//
//  ReubenSandwich.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/8.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "ReubenSandwich.h"

@implementation ReubenSandwich

- (void)prepareBread {
    
    [self cutRyeBread];
}

- (void)addMeat {
    
    [self addCornBeef];
}

- (void)addCondiments {
    
    [self addSauerkraut];
    [self addThousandIslandDressing];
    [self addSwissCheese];
}

- (void)extraStep {
    [self grillIt];
}

#pragma mark -
#pragma mark ReubenSandwich Specific Methods

- (void)cutRyeBread {
    
    // 鲁宾三明治需要两篇黑麦面包
}

- (void)addCornBeef {
    
    // 加大量腌牛肉
}

- (void)addSauerkraut {
    
    // 还有德国酸菜
}

- (void)addThousandIslandDressing {
    
    // 别忘了千岛酱
}

- (void)addSwissCheese {
    
    // 还有上等瑞士奶酪
}

- (void)grillIt {
    // 最后要把它考一下
}

@end
