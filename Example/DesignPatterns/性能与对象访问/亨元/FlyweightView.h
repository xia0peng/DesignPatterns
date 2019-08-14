//
//  FlyweightView.h
//  DesignPatterns_Example
//
//  Created by xiaopengwang on 2019/8/14.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlyweightView : UIView {
@private
    NSArray *flowerList_;
}

@property (nonatomic,strong)NSArray *flowerList;

@end

NS_ASSUME_NONNULL_END
