//
//  Scribble.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/10.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "Scribble.h"
#import "ScribbleMemento.h"
#import "Stroke.h"
#import "ScribbleMemento+Friend.h"

// A private category for Scribble
// that contains a mark property available
// only to its objects
@interface Scribble ()

@property (nonatomic, retain) id <Mark> mark;

@end

@implementation Scribble

@synthesize mark=parentMark_;

- (id) init {
    if (self = [super init])
    {
        // 父节点应该是个组合对象（即 Stroke）
        parentMark_ = [[Stroke alloc] init];
    }

    return self;
}

#pragma mark -
#pragma mark Methods for Mark management

- (void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark {
    [self willChangeValueForKey:@"mark"];
    
    // 如果标记设为 YES
    // 就把这个 aMark 加到前一个 Mark 作为聚合体的一部分
    // 根据我们的设计，它应该是根节点的最后一个子节点
    if (shouldAddToPreviousMark)
    {
        [[parentMark_ lastChild] addMark:aMark];
    }
    // 否则把它附加到父节点
    else
    {
        [parentMark_ addMark:aMark];
        incrementalMark_ = aMark;
    }
    
    [self didChangeValueForKey:@"mark"];
}

- (void)removeMark:(id<Mark>)aMark {
    // 如果 aMark 是父节点则什么也不做
    if (aMark == parentMark_) return;
    
    // manual KVO invocation
    [self willChangeValueForKey:@"mark"];
    
    [parentMark_ removeMark:aMark];
    
    // 不需要保存 incrementalMark_ 引用，因为它刚从父节点删除
    if (aMark == incrementalMark_)
    {
        incrementalMark_ = nil;
    }
    
    // manual KVO invocation
    [self didChangeValueForKey:@"mark"];
}

#pragma mark -
#pragma mark Methods for memento

- (id) initWithMemento:(ScribbleMemento*)aMemento
{
    if (self = [super init])
    {
        if ([aMemento hasCompleteSnapshot])
        {
            [self setMark:[aMemento mark]];
        }
        else
        {
            // 如果备忘录中只包含一个增量的 mark，那就需要创建容纳它的父节点
            parentMark_ = [[Stroke alloc] init];
            [self attachStateFromMemento:aMemento];
        }
    }
    
    return self;
}

- (void) attachStateFromMemento:(ScribbleMemento *)memento
{
    // 把来自备忘录对象的 mark 附加到根节点
    [self addMark:[memento mark] shouldAddToPreviousMark:NO];
}

- (ScribbleMemento *) scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot
{
    id <Mark> mementoMark = incrementalMark_;
    
    // 如果要返回完整的快照，就把它设为 parentMark_
    if (hasCompleteSnapshot)
    {
        mementoMark = parentMark_;
    }
    // 但如果 incrementalMark_ 是 nil 我们什么也做不了，只好退出
    else if (mementoMark == nil)
    {
        return nil;
    }
    
    ScribbleMemento *memento = [[ScribbleMemento alloc]
                                 initWithMark:mementoMark];
    [memento setHasCompleteSnapshot:hasCompleteSnapshot];
    
    return memento;
}

- (ScribbleMemento *) scribbleMemento
{
    return [self scribbleMementoWithCompleteSnapshot:YES];
}


+ (Scribble *) scribbleWithMemento:(ScribbleMemento *)aMemento
{
    Scribble *scribble = [[Scribble alloc] initWithMemento:aMemento];
    return scribble;
}

@end
