//
//  Stroke.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/31.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface Stroke : NSObject<Mark>

@property (nonatomic, strong) NSMutableArray *children;

@end

NS_ASSUME_NONNULL_END
