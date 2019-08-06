//
//  Mark.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/31.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MarkVisitor.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Mark <NSObject>

@optional
@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id <Mark> lastChild;

- (void) addMark:(id <Mark>) mark;
- (void) removeMark:(id <Mark>) mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger) index;

// for the Visitor pattern
// 如果把这些操作都放在 Mark 接口，那么就需要同时修改每个节点类
- (void) acceptMarkVisitor:(id <MarkVisitor>) visitor;

@end

NS_ASSUME_NONNULL_END
