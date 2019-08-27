//
//  BrandingFactory.m
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/27.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "BrandingFactory.h"
#import "SierraBrandingFactory.h"
#import "AcmeBrandingFactory.h"

@implementation BrandingFactory

+ (BrandingFactory *)factory {
    
#if defined (USE_ACME)
    return [AcmeBrandingFactory new];
#elif defined (USE_SIERRA)
    return [SierraBrandingFactory new];
#else
    return nil;
#endif
    
}

- (UIView *)brandedView {
    return nil;
}

- (UIButton *)brandedMainButton {
    return nil;
}

- (UIToolbar *)brandedToolbar {
    return nil;
}

@end
