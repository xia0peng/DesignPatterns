//
//  FlowerFlyweightFactory.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/13.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "FlowerFlyweightFactory.h"
#import "FlowerView.h"

@implementation FlowerFlyweightFactory

- (UIView *)flowerViewWithType:(FlowerType)type {
    
    // 懒加载花朵池
    if (nil == flowerPool_) {
        flowerPool_ = [[NSMutableDictionary alloc] initWithCapacity:kTotalNumberOfFlowerType];
    }
    
    // 尝试从花朵池中取出一朵花
    UIView *flowerView = [flowerPool_ objectForKey:[NSNumber numberWithInt:type]];
    
    if (nil == flowerView) {
        
//        UIImage *flowerImage;
        
        flowerView = [[FlowerView alloc] init];

        switch (type) {
            case kAnemone:
//                flowerImage = [UIImage imageNamed:@"flowerImage.png"];
                flowerView.backgroundColor = [UIColor redColor];
                break;
            case kCosmos:
//                flowerImage = [UIImage imageNamed:@"kCosmos.png"];
                flowerView.backgroundColor = [UIColor blackColor];
                break;
            case kGerberas:
//                flowerImage = [UIImage imageNamed:@"kGerberas.png"];
                flowerView.backgroundColor = [UIColor orangeColor];
                break;
                
            default:
                break;
        }
        
        [flowerPool_ setObject:flowerView forKey:@(type)];
    }
    
    return flowerView;
}

@end
