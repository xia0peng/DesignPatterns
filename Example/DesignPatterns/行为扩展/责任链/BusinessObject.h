//
//  BusinessObject.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/7.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BusinessObject;

typedef void(^CompletionBlock)(BOOL handled);
typedef void(^ResultBlock)(BusinessObject * _Nullable handler, BOOL handled);

@interface BusinessObject : NSObject

// 下一个响应者
@property (nonatomic, strong) BusinessObject *nextBusiness;

// 响应者的处理方法
- (void)handle:(ResultBlock)result;

// 各个业务在该方法当中做实际业务处理
- (void)handleBusiness:(CompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
