//
//  FlowerFlyweightFactory.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/13.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    kAnemone,
    kCosmos,
    kGerberas,
//    kHollyhock,
//    kJasmine,
//    kZinnia,
    kTotalNumberOfFlowerType
}FlowerType;

typedef struct {
    UIView *flowerView;
    CGRect area;
} ExtrinesicFlowerState;

@interface FlowerFlyweightFactory : NSObject {
    @private
    NSMutableDictionary *flowerPool_;
}

- (UIView *)flowerViewWithType:(FlowerType)type;

@end

NS_ASSUME_NONNULL_END
