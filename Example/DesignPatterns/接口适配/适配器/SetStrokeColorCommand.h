//
//  SetStrokeColorCommand.h
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/30.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//
//  客户端
//

#import "Command.h"

NS_ASSUME_NONNULL_BEGIN

@class SetStrokeColorCommand;

@protocol SetStrokeColorCommandDelegate <NSObject>

- (void)command:(SetStrokeColorCommand *)command
          didRequestColorComponentsForRed:(CGFloat)red
                                    green:(CGFloat)green
                                     blue:(CGFloat)blue;

- (void)command:(SetStrokeColorCommand *)commadn
            didFinishColorUpdateWithColor:(UIColor *)color;

@end

@interface SetStrokeColorCommand : Command

@property (nonatomic, weak) id <SetStrokeColorCommandDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
