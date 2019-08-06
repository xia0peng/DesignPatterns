//
//  CanvasView.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/5.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Mark;

@interface CanvasView : UIView {
    @private
    id <Mark> mark_;  // the main stroke structure
}
@property (nonatomic, retain) id <Mark> mark;

@end

NS_ASSUME_NONNULL_END
