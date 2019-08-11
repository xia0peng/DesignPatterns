//
//  ScribbleThumbnailView.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/11.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleThumbnailView : UIView

@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, copy) NSString *imagePath;

@end

NS_ASSUME_NONNULL_END
