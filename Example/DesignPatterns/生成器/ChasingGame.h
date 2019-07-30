//
//  ChasingGame.h
//  DesignPatterns
//
//  Created by xiaopengwang on 2019/7/30.
//
//  direcor 指导者
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Character; // 产品
@class CharacterBuilder; // 生成器

@interface ChasingGame : NSObject

- (Character *)createPlayer:(CharacterBuilder *)builder;
- (Character *)createEnemy:(CharacterBuilder *)builder;

@end

NS_ASSUME_NONNULL_END
