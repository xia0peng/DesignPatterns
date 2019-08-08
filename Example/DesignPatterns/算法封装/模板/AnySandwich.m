//
//  AnySandwich.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/8.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "AnySandwich.h"

@implementation AnySandwich

- (void)make {
    [self prepareBread];
    [self putBreadOnPlate];
    [self addMeat];
    [self addCondiments];
    [self extraStep];
    [self serve];
}

- (void)putBreadOnPlate {
    
    // 做任何三明治都要把面包放在盘子上
}

- (void)extraStep {
    
}

- (void)serve {
    
    // 任何三明治做好了都要上餐
}

#pragma mark -
#pragma Details will be handled by subclasses

- (void)prepareBread {
    
    // 要保证子类重载这个方法
    
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void)addMeat {
    
    // 要保证子类重载这个方法
    
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void)addCondiments {
    
    // 要保证子类重载这个方法
    
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

@end
