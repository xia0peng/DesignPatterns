//
//  MarkVisitor.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/5.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Mark;
@class Dot, Vertex, Stroke;

@protocol MarkVisitor <NSObject>

- (void)visitMark:(id <Mark>)mark;
- (void)visitDot:(Dot *)dot;
- (void)visitVertex:(Vertex *)vertex;
- (void)visitStroke:(Stroke *)stroke;

@end

NS_ASSUME_NONNULL_END
