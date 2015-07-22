//
//  TYkeyboard.m
//  仿京东键盘
//
//  Created by 汤义 on 15/7/22.
//  Copyright (c) 2015年 汤义. All rights reserved.
//

#import "TYkeyboard.h"
#define TYwidth [UIScreen mainScreen].bounds.size.width
#define TYheight [UIScreen mainScreen].bounds.size.height
@interface TYkeyboard ()
@property (nonatomic, strong)UITextField *TextField;
@property (nonatomic, strong)UIView *views;
@end
@implementation TYkeyboard
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        self.hidden = YES;
        [self KeyboardNotifications];
    }
    return self;
}
+(instancetype)header
{
    return [[TYkeyboard alloc] init];
}
-(void)KeyboardNotifications
{
    //使用NSNotificationCenter 鍵盤出現時
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    //使用NSNotificationCenter 鍵盤隐藏時
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillBeHidden:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];

}
//出现键盘
-(void)keyboardWasShown:(NSNotification *)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    
    self.frame = CGRectMake(0, (TYheight - kbSize.height) - 50, TYwidth, 100);
    self.hidden = NO;
    [self AddBttonView];
}
//退出键盘
-(void)keyboardWillBeHidden:(NSNotification *)aNotification
{
    
}
-(void)AddBttonView
{
    _views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TYwidth, 100)];
    [self addSubview:_views];
    
    UIButton *button1 = [UIButton buttonWithType: UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 0, 100, 50);
    [button1 setTitle:@"取消" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1) forControlEvents: UIControlEventTouchUpInside];
    [_views addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType: UIButtonTypeCustom];
    button2.frame = CGRectMake(TYwidth - 100, 0, 100, 50);
    [button2 setTitle:@"确定" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2) forControlEvents: UIControlEventTouchUpInside];
    [_views addSubview:button2];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 49, TYwidth, 0.5)];
    view.backgroundColor = [UIColor lightGrayColor];
    [_views addSubview:view];
}
-(void)button1
{
    [_TextField resignFirstResponder];
    [_views removeFromSuperview];
    self.hidden = YES;
}
-(void)button2
{
    [_TextField resignFirstResponder];
    [_views removeFromSuperview];
    self.hidden = YES;
}
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    NSArray *Array = newSuperview.subviews;
    _TextField = (UITextField *)Array[0];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
