//
//  Avater.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/7.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "Avatar.h"

@implementation Avatar

- (void)handleAttak:(Attack *)attack {

    // 当攻击到达这里时，我就被击中了
    // 实际损伤的点数取决于攻击的类型
    NSLog(@"Oh！I'm hit with a %@!",[attack class]);
}

@end
