//
//  Dot.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/31.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "Vertex.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dot : Vertex

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;

@end

NS_ASSUME_NONNULL_END
