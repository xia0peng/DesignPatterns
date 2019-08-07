//
//  AttackHandler.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/7.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Attack.h"

NS_ASSUME_NONNULL_BEGIN

@interface AttackHandler : NSObject

@property (nonatomic, strong) AttackHandler *nextAttackHandler;

- (void)handleAttak:(Attack *)attack;

@end

NS_ASSUME_NONNULL_END
