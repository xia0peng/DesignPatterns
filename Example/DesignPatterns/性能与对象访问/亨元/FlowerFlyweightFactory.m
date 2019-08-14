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
    if (nil == self.flowerPool_) {
        self.flowerPool_ = [[NSMutableDictionary alloc] initWithCapacity:kTotalNumberOfFlowerType];
    }
    
    // 尝试从花朵池中取出一朵花
    UIView *flowerView = [self.flowerPool_ objectForKey:[NSNumber numberWithInt:type]];
    
    if (nil == flowerView) {
        
        UIImage *flowerImage;
        
        switch (type) {
            case kAnemone:
                flowerImage = [UIImage imageNamed:@"anemone.png"];
                break;
            case kCosmos:
                flowerImage = [UIImage imageNamed:@"cosmos.png"];
                break;
            case kGerberas:
                flowerImage = [UIImage imageNamed:@"gerberas.png"];
                break;
            case kHollyhock:
                flowerImage = [UIImage imageNamed:@"hollyhock.png"];
                break;
            case kJasmine:
                flowerImage = [UIImage imageNamed:@"jasmine.png"];
                break;
            case kZinnia:
                flowerImage = [UIImage imageNamed:@"zinnia.png"];
                break;
            default:
                break;
        }
        
        flowerView = [[FlowerView alloc]initWithImage:flowerImage];

        [self.flowerPool_ setObject:flowerView forKey:@(type)];
    }
    
    return flowerView;
}

@end
