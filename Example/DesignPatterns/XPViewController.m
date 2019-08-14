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

// 责任链
#import "AttackHandler.h"
#import "MetalArmor.h"
#import "Avatar.h"
#import "CrystalShield.h"
#import "SwordAttack.h"
#import "MagicFireAttack.h"
#import "LightningAttack.h"

// 亨元
#import "FlowerFlyweightFactory.h"
#import "FlyweightView.h"
#import "FlyweightMode.h"

// 备忘录
#import "ScribbleManager.h"
#import "Scribble.h"

@interface XPViewController ()

@end

@implementation XPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    [self builder];
//
//    [self adapter];
//
//    [self iterator];
//
//    [self visitor];
//
//    [self chainOfResponsibility];
//
//    [self memento];
    
    [self flyweight];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - - - - - 对象创建 - - - -

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

#pragma mark - - - - - 抽象集合 - - - - -

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
        NSLog(@"迭代器--%@", childMark);
    }
    
    //
    [stroke enumerateMarksUsingBlock:^(id<XPIteratorMark>  _Nonnull item, BOOL * _Nonnull stop) {
        NSLog(@"迭代器--%@",item);
    }];
}

#pragma mark - - - - - 行为扩展 - - - -

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

#pragma mark - - - - - 装饰 - - - -

#pragma mark - 责任链

/*
 * 有多个对象可以处理请求，而处理程序只有在运行时才能确定
 * 向一组对象发出请求，而不想显式指定处理请求的特定处理程序
 */
- (void)chainOfResponsibility {
    // 创建新的人物
    AttackHandler *avatar = [[Avatar alloc] init];
    
    // 让他穿上金属盔甲
    AttackHandler *metalArmoredAvatar = [[MetalArmor alloc] init];
    metalArmoredAvatar.nextAttackHandler = avatar;
    
    // 然后给金属盔甲中的任务增加一个水晶盾牌
    AttackHandler *superAvatar = [[CrystalShield alloc] init];
    superAvatar.nextAttackHandler = metalArmoredAvatar;
    
    // 其他行动
    
    // 用剑⚔攻击人物
    Attack *swordAttack = [[SwordAttack alloc] init];
    [superAvatar handleAttak:swordAttack];
    
    // 用魔法火焰🔥攻击人物
    Attack * magicFireAttack = [[MagicFireAttack alloc] init];
    [superAvatar handleAttak:magicFireAttack];

    // 用闪电⚡️进行新的攻击
    Attack *lightningAttack = [[LightningAttack alloc] init];
    [superAvatar handleAttak:lightningAttack];
}

#pragma mark - - - - - 性能与对象访问 - - - - -

#pragma mark - 亨元

- (void)flyweight {
    FlowerFlyweightFactory *factory = [FlowerFlyweightFactory new];
    NSMutableArray *flowerList = [NSMutableArray arrayWithCapacity:500];
    
    FlyweightView *flyweightView = [[FlyweightView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:flyweightView];
    
    for (int i=0; i<500; i++) {
        
        // 使用随机花朵类型
        FlowerType type = arc4random() % kTotalNumberOfFlowerType;
        UIView *flowerView = [factory flowerViewWithType:type];
        
        // 设置花朵的显示位置和区域
        CGRect scressBounds = [[UIScreen mainScreen] bounds];
        CGFloat x = arc4random() % (NSInteger)scressBounds.size.width;
        CGFloat y = arc4random() % (NSInteger)scressBounds.size.height;
        NSInteger minSize = 10;
        NSInteger maxSize = 50;
        CGFloat size = (arc4random() & (maxSize - minSize + 1)) +minSize;
        
        // 把花朵的属性赋给一个外在状态对象
//        ExtrinesicFlowerState extrinesicState = {
//            flowerView,
//            CGRectMake(x, y, size, size)
//        };

//        [flowerList addObject:[NSValue value:&extrinesicState withObjCType:@encode(ExtrinesicFlowerState)]];

        FlyweightMode *mode = [[FlyweightMode alloc] init];
        mode.flowerView = flowerView;
        mode.area = CGRectMake(x, y, size, size);
        
        [flowerList addObject:mode];

    }
    
//    [(FlyweightView *)self.view setFlowerList:flowerList];
    [flyweightView setFlowerList:flowerList.copy];
}

#pragma mark - 代理

/*
 * 远程代理，为位于不同地址空间或网络中的对象提供本地代表。
 * 虚拟代理，来根据要求创建重型的对象。
 * 保护代理，来根据不同访问权限控制对原对象的访问。
 * 只能引用代理，通过对实体对象的引用进行计数来管理内存，也能用于锁定实体对象，让其对象不能修改它。
 */

#pragma mark - - - - - 对象状态 - - - - -

#pragma mark - 备忘录

/*
 * 需要保存一个对象（或某部分）在某一个时刻的状态，这样以后就可以恢复到先前的状态
 * 用于获取状态的接口会暴露实现细节，需要将其隐藏起来
 */
- (void)memento {
    Scribble *newScribble = [[Scribble alloc] init];
    ScribbleManager *manager = [[ScribbleManager alloc] init];
    
    [manager saveScribble:newScribble thumbnail:[UIImage imageNamed:@""]];
}
@end
