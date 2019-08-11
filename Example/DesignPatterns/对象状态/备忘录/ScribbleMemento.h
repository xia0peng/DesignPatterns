//
//  ScribbleMemento.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/10.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleMemento : NSObject

+ (ScribbleMemento *) mementoWithData:(NSData *)data;
- (NSData *) data;

@end

NS_ASSUME_NONNULL_END
