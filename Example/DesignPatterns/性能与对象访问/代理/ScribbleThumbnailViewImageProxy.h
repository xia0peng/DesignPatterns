//
//  ScribbleThumbnailViewImageProxy.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/11.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "ScribbleThumbnailView.h"
#import "Scribble.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleThumbnailViewImageProxy : ScribbleThumbnailView
{
@private
    UIImage *realImage_;
    BOOL loadingThreadHasLaunched_;
}

@property (nonatomic, readonly) UIImage *image;

@end

NS_ASSUME_NONNULL_END
