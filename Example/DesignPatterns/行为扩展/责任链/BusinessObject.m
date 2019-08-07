//
//  BusinessObject.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/7.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "BusinessObject.h"

@implementation BusinessObject

// 责任链入口
- (void)handle:(ResultBlock)result {
    CompletionBlock completion = ^(BOOL handled){
        
        // 当前业务处理掉，上抛结果
        if (handled) {
            result(self, handled);
        }
        else {
            
            // 沿着责任链，指派给下一个业务处理
            if (self.nextBusiness) {
                [self.nextBusiness handle:result];
            }
            else {
                
                // 没有业务处理，上抛
                result(nil, NO);
            }
        }
    };
    
    [self handleBusiness:completion];
}

- (void)handleBusiness:(CompletionBlock)completion {
    
    // 业务逻辑处理
    // 如网约请求，本地图片查询
}

@end
