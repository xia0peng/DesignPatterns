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
 结构体通常都是以上这样的，需要注意的结构体内定义的只能是基本数据类型的变量，而不能是对象。如若非要用结构体存放对象也可以，需要在对象前面添加标识__unsafe_unretained，如__unsafe_unretained UIImage *imageNew，但是这样也可能会出现一些奇怪的问题，所以不建议使用，需要定义对象时还是建一个类去存储。
 
 具体原因是因为：ARC需要在一个合适的位置插入成员的释放行为，在Objective-C中，编译器会把实例成员的release放在该类型的实例方法dealloc中。而由于标准的C结构体，即struct，是没有析构函数的，所以编译器无法在合适的位置插入成员的release操作。从而导致内存泄漏。所以，在ARC项目中，不做特殊处理是无法在struct中声明Objective-C对象的，除非明确指定放弃对所声明对象的内存管理责任，即楼上提到的，将对象定义为__unsafe_unretain，这样ARC就不会想办法插入release操作了
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
