//
//  ScribbleMemento+Friend.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/10.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "ScribbleMemento.h"
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleMemento ()

- (id) initWithMark:(id <Mark>)aMark;

// object-c 不允许在范畴中合成属性

@property (nonatomic, copy) id <Mark> mark;
@property (nonatomic, assign) BOOL hasCompleteSnapshot;

@end

NS_ASSUME_NONNULL_END
