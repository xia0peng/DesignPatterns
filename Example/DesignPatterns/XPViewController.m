//
//  XPViewController.m
//  DesignPatterns
//
//  Created by xiaopengwang on 07/30/2019.
//  Copyright (c) 2019 xiaopengwang. All rights reserved.
//

#import "XPViewController.h"

// 单利
#import "XPWann.h"

// 生成器
#import "ChasingGame.h"
#import "Character.h"
#import "CharacterBuilder.h"
#import "StandardCharacterBuilder.h"

// 适配器
#import "SetStrokeColorCommand.h"

@interface XPViewController ()

@end

@implementation XPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self builder];
    
    [self adapter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 单利

- (void)sharedInstance {
    [XPWann sharedInstance];
}

#pragma mark - 生成器模式

- (void)builder {
    
    CharacterBuilder *characterBuilder = [[StandardCharacterBuilder alloc] init];
    
    ChasingGame *game =  [[ChasingGame alloc] init];
    
    Character *player = [game createPlayer:characterBuilder];
    Character *enemy = [game createEnemy:characterBuilder];
    
    NSLog(@"%@%@",player,enemy);
}

#pragma mark - 适配器

- (void)adapter {
    SetStrokeColorCommand *command = [SetStrokeColorCommand new];
    [command execute];
}

@end
