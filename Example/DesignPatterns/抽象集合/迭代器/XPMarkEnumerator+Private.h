//
//  XPMarkEnumerator+Private.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/5.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "XPMarkEnumerator.h"
#import "XPIteratorMark.h"

NS_ASSUME_NONNULL_BEGIN

@interface XPMarkEnumerator ()

- (id)initWithMark:(id<XPIteratorMark>)mark;
- (void)traverseAndBuildStackWithMark:(id<XPIteratorMark>)mark;

@end

NS_ASSUME_NONNULL_END
