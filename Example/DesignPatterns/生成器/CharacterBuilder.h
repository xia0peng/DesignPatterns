//
//  CharacterBuilder.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/7/30.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//
//  抽象生成器
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Character;

@interface CharacterBuilder : NSObject

@property (nonatomic, readonly) Character *character;

- (CharacterBuilder *)buildNewCharacter;

- (CharacterBuilder *)buildStrength:(float)value;
- (CharacterBuilder *)buildStamina:(float)value;
- (CharacterBuilder *)buildIntelligence:(float)value;
- (CharacterBuilder *)buildAgility:(float)value;
- (CharacterBuilder *)buildAggressiveness:(float)value;

@end

NS_ASSUME_NONNULL_END
