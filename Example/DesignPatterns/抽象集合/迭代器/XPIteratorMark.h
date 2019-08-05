//
//  XPIteratorMark.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/5.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XPIteratorMark <NSObject>

@optional
@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id <XPIteratorMark> lastChild;

- (void)addMark:(id <XPIteratorMark>) mark;
- (void)removeMark:(id <XPIteratorMark>) mark;
- (id <XPIteratorMark>)childMarkAtIndex:(NSUInteger) index;

- (NSEnumerator *)enumerator;

- (void)enumerateMarksUsingBlock:(void (^)(id <XPIteratorMark> item, BOOL *stop)) block;

@end

NS_ASSUME_NONNULL_END
