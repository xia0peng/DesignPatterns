//
//  Scribble.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/10.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@class ScribbleMemento;

@interface Scribble : NSObject {
@private
    id <Mark> parentMark_;
    id <Mark> incrementalMark_;
}

// 管理 mark 的方法
- (void) addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void) removeMark:(id <Mark>)aMark;

// 备忘录用的方法
- (id) initWithMemento:(ScribbleMemento *)aMemento;
+ (Scribble *) scribbleWithMemento:(ScribbleMemento *)aMemento;
- (ScribbleMemento *) scribbleMemento;
- (ScribbleMemento *) scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot;
- (void) attachStateFromMemento:(ScribbleMemento *)memento;

@end

NS_ASSUME_NONNULL_END
