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

// 组合
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

// 迭代器
#import "XPIteratorStroke.h"
#import "XPMarkEnumerator.h"

// 访问者
#import "CanvasView.h"

@interface XPViewController ()

@end

@implementation XPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self builder];
    
    [self adapter];
    
    [self iterator];
    
    [self visitor];
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

#pragma mark - 抽象集合

#pragma mark - 组合

/*
* 获得对象抽象的树形表示（部分-整体层次结构）
* 客户端统一处理组合结构中的所有对象
*/

- (void)composize {
    
    Dot *newDat = [[Dot alloc] init];
    Stroke *parentStroke = [[Stroke alloc] init];
    
    [parentStroke addMark:newDat];
    
    Vertex *newVertex = [[Vertex alloc] init];
    Stroke *newStroke = [[Stroke alloc] init];
    
    [newStroke addMark:newVertex];
    
    [parentStroke addMark:newStroke];
}

#pragma mark - 迭代器

/*
 * 需要访问组合对象的内容，而又不暴露其内部表示
 * 需要通过多种方式遍历组合对象
 * 需要提供一个统一接口，用来遍历各种类型的组合对象
 */

- (void)iterator {
    XPIteratorStroke *stroke = [XPIteratorStroke new];
    [stroke addMark:stroke];
    [stroke addMark:stroke];
    [stroke addMark:stroke];

    //
    NSEnumerator *enumerator = [stroke enumerator];
    
    id <XPIteratorMark> childMark;
    // 获取下一个需要遍历的元素
    while (childMark = [enumerator nextObject]) {
        NSLog(@"--%@", childMark);
    }
    
    //
    [stroke enumerateMarksUsingBlock:^(id<XPIteratorMark>  _Nonnull item, BOOL * _Nonnull stop) {
        NSLog(@"--%@",item);
    }];
}

#pragma mark - 行为扩展

#pragma mark - 访问者

/*
 * 一个复杂的对象结构包含很多其他对象，他们有不同的接口（比如组合体），但是想对这些对象实施一些依赖于其具体类型的操作
 *需要对一个组合结构中的对象进行很多不相关的操作，但是不想让这些操作污染这些对象的类。可以将相关操作集中起来，定义在一个访问者类中，并在需要在访问者中定义的操作时使用他
 *定义复杂结构的类很少做修改，但经常需要向其添加新操作
 */

- (void)visitor {
    Stroke *stroke = [Stroke new];
    stroke.color = [UIColor redColor];
    stroke.size = 10;
    stroke.location = self.view.center;
    
    CGRect aFrame = CGRectMake(100, 100, 100, 100);
    CanvasView *aCanvasView = [[CanvasView alloc] initWithFrame:aFrame];
    aCanvasView.mark = stroke;
    [self.view addSubview:aCanvasView];
}

@end
