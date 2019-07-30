//
//  PaletteViewController.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/7/30.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "PaletteViewController.h"
#import "SetStrokeColorCommand.h"

@interface PaletteViewController ()<SetStrokeColorCommandDelegate>

@end

@implementation PaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - SetStrokeColorCommandDelegate

- (void)command:(SetStrokeColorCommand *)command
            didRequestColorComponentsForRed:(CGFloat)red
                                      green:(CGFloat)green
                                       blue:(CGFloat)blue {
    red = 122;
    green = 122;
    blue = 122;
}

- (void)command:(SetStrokeColorCommand *)commadn didFinishColorUpdateWithColor:(UIColor *)color {
    [self.view setBackgroundColor:color];
}

@end
