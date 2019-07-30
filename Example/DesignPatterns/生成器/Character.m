//
//  Character.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/7/30.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "Character.h"

@implementation Character

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.strength = 1.0;
        self.stamina = 1.0;
        self.intelligence = 1.0;
        self.agility = 1.0;
        self.aggressiveness = 1.0;
    }
    return self;
}

@end
