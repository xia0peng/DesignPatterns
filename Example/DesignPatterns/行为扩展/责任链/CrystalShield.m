//
//  CrystalShield.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/7.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "CrystalShield.h"
#import "MagicFireAttack.h"

@implementation CrystalShield

- (void)handleAttak:(Attack *)attack {
    if ([attack isKindOfClass:MagicFireAttack.class]) {
        
        // 攻击没有通过这个盔甲
        NSLog(@"NO damage from a sword attack");
    }
    else {
        
        NSLog(@"I don't know this attack: %@",[attack class]);
        [super handleAttak:attack];
    }
}

@end
