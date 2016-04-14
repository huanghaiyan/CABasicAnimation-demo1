//
//  ViewController.m
//  CABasicAnimation-demo1
//
//  Created by huanghy on 16/4/14.
//  Copyright © 2016年 huanghy. All rights reserved.
//

#import "ViewController.h"
//长按图片触发CABasicAnimation晃动动画； 点击任意位置停止动画。
@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *shakeImageView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //No.1
    //开始写代码，给_shakeImageView添加长按手势
    UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
    longPressGr.delegate = self;
    [_shakeImageView setUserInteractionEnabled:YES];
    [_shakeImageView addGestureRecognizer:longPressGr];
    //end_code
}
//No.2
//开始写代码，使用CABasicAnimation使图片长按时无限左右晃动
-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture {
    
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    shake.duration = 1;
    shake.autoreverses = YES;
    shake.repeatCount = MAXFLOAT;
    shake.delegate = self;
    shake.fromValue = [NSNumber numberWithFloat:-50];
    shake.toValue = [NSNumber numberWithFloat:50];
    [[_shakeImageView layer] addAnimation:shake forKey:@"shareAnimation"];
    
    
    
}

//end_code


//No.3
//开始写代码，点击任意位置取消晃动动画
- (void)touchesBegan:(UITouch *)touches withEvent:(UIEvent *)event
{
    [_shakeImageView.layer removeAllAnimations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
