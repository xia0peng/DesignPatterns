//
//  Vertex.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/31.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface Vertex : NSObject<Mark>

@property (nonatomic, assign) CGPoint location;

- (id) initWithLocation:(CGPoint) location;

@end

NS_ASSUME_NONNULL_END
