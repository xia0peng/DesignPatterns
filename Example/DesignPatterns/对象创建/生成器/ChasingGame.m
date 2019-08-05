//
//  ChasingGame.m
//  DesignPatterns
//
//  Created by xiaopengwang on 2019/7/30.
//

#import "ChasingGame.h"
#import "CharacterBuilder.h"

@implementation ChasingGame

- (Character *)createPlayer:(CharacterBuilder *)builder {
    
    [builder buildNewCharacter];
    [builder buildStrength:5.0];
    [builder buildStamina:4.0];
    [builder buildIntelligence:3.0];
    [builder buildAgility:2.0];
    [builder buildAggressiveness:1.0];
    
    return [builder character];
}

- (Character *)createEnemy:(CharacterBuilder *)builder {
    
    [[[[[[builder buildNewCharacter]
                  buildStrength:15.0]
                  buildStamina:14.0]
                  buildIntelligence:13.0]
                  buildAgility:12.0]
                  buildAggressiveness:11.0];
    
    return [builder character];
}

@end
