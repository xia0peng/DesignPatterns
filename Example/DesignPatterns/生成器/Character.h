//
//  Character.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/7/30.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Character : NSObject

@property (nonatomic, assign) float strength;       // 防御
@property (nonatomic, assign) float stamina;        // 耐力
@property (nonatomic, assign) float intelligence;   // 智力
@property (nonatomic, assign) float agility;        // 敏捷
@property (nonatomic, assign) float aggressiveness; // 攻击力

@property (nonatomic, assign) float protection; // 防御值
@property (nonatomic, assign) float power;      // 攻击力

@end

NS_ASSUME_NONNULL_END
