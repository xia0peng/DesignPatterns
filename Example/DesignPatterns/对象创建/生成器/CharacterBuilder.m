//
//  CharacterBuilder.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/7/30.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "CharacterBuilder.h"

@implementation CharacterBuilder

- (CharacterBuilder *)buildNewCharacter {
    
    _character = [[Character alloc] init];
    
    return self;
}

- (CharacterBuilder *)buildStrength:(float)value {
    _character.strength = value;
    return self;
}

- (CharacterBuilder *)buildStamina:(float)value {
    _character.stamina = value;
    return self;
}

- (CharacterBuilder *)buildIntelligence:(float)value {
    _character.intelligence = value;
    return self;
}

- (CharacterBuilder *)buildAgility:(float)value {
    _character.agility = value;
    return self;
}

- (CharacterBuilder *)buildAggressiveness:(float)value {
    _character.aggressiveness = value;
    return self;
}

@end
