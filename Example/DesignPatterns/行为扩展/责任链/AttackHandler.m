//
//  AttackHandler.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/7.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "AttackHandler.h"

@interface AttackHandler()

@end

@implementation AttackHandler

- (void)handleAttak:(Attack *)attack {
    [self.nextAttackHandler handleAttak:attack];
}

@end
