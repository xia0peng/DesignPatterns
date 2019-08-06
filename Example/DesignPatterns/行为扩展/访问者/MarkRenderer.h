//
//  MarkRenderer.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/5.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarkRenderer : NSObject<MarkVisitor> {
    @private
    BOOL _shouldMoveContextToDot;
    
    @protected
    CGContextRef _context;
}

- (id) initWithCGContext:(CGContextRef)context;

@end

NS_ASSUME_NONNULL_END
