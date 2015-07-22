//
//  ViewController.m
//  仿京东键盘
//
//  Created by 汤义 on 15/7/22.
//  Copyright (c) 2015年 汤义. All rights reserved.
//

#import "ViewController.h"
#import "TYkeyboard.h"
#define TYwidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *TextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, TYwidth, 50)];
    TextField.delegate = self;
    TextField.placeholder = @"rtuil;";
    TextField.backgroundColor = [UIColor redColor];
    [self.view addSubview:TextField];
    
    //引入键盘
    TYkeyboard * view = [TYkeyboard header];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
