//
//  ImageComponent.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/6.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ImageComponent <NSObject>

// https://www.jianshu.com/p/fe1cc2978a1d
// 我们要截获 UIImage 的行为，插入附加行为
@optional

- (void)drawAsPatternInRect:(CGRect)rect;
- (void)drawAtPoint:(CGPoint)point;
//- (void)drawAtPoint:(CGPoint)point
//          blendMode:()

@end

NS_ASSUME_NONNULL_END
