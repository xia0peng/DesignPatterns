//
//  XPIteratorStroke.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/5.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPIteratorMark.h"

NS_ASSUME_NONNULL_BEGIN

@interface XPIteratorStroke : NSObject<XPIteratorMark>

@property (nonatomic, strong) NSMutableArray *children;

@end

NS_ASSUME_NONNULL_END
