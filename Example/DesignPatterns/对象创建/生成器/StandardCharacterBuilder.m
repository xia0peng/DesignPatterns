//
//  StandardCharacterBuilder.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/7/30.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "StandardCharacterBuilder.h"

@implementation StandardCharacterBuilder

- (CharacterBuilder *)buildStrength:(float)value {
    
    // 更新角色的防御值
    self.character.protection *= value;
    
    // 更新角色的攻击力
    self.character.power *= value;
    
    // 最后设定力量并返回此生成器
    return [super buildStrength:value];
}

- (CharacterBuilder *)buildStamina:(float)value {
    
    self.character.protection *= value;
    
    self.character.power *= value;
    
    return [super buildStamina:value];
}

- (CharacterBuilder *)buildIntelligence:(float)value {
    
    self.character.protection *= value;
    
    self.character.power /= value;
    
    return [super buildIntelligence:value];
}

- (CharacterBuilder *)buildAgility:(float)value {
    self.character.protection *= value;
    
    self.character.power /= value;
    
    return [super buildAgility:value];
}

- (CharacterBuilder *)buildAggressiveness:(float)value {
   
    self.character.protection /= value;
    
    self.character.power *= value;
    
    return [super buildAggressiveness:value];
}

@end
