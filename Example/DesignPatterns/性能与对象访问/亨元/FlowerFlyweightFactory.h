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
    kHollyhock,
    kJasmine,
    kZinnia,
    kTotalNumberOfFlowerType
}FlowerType;

/*
 在ARC环境下，在结构体中使用objc对象，必须使用_unsafe_unretained，这个是苹果的规定。
 
 typedef struct pinyinTableCell{
 __unsafe_unretained NSString * pinyin;
 __unsafe_unretained NSString * hanzi;
 }pinyinTableCell;
 */
typedef struct {
    __unsafe_unretained UIView *flowerView;
    CGRect area;
} ExtrinesicFlowerState;

@interface FlowerFlyweightFactory : NSObject {
//    @private
//    NSMutableDictionary *flowerPool_;
}

@property (nonatomic,strong) NSMutableDictionary *flowerPool_;

- (UIView *)flowerViewWithType:(FlowerType)type;

@end

NS_ASSUME_NONNULL_END
