//
//  BrandingFactory.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/27.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BrandingFactory : NSObject

+ (BrandingFactory *)factory;

- (UIView *)brandedView;
- (UIButton *)brandedMainButton;
- (UIToolbar *)brandedToolbar;

@end

NS_ASSUME_NONNULL_END
