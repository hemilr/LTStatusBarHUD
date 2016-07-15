//
//  LTStstusBarHUD.m
//  LTStatusBarHUD
//
//  Created by 七扇门 on 16/7/14.
//  Copyright © 2016年 luotao. All rights reserved.
//

#import "LTStstusBarHUD.h"

#define LTMessageFon [UIFont systemFontOfSize:12]

/** 消息停留时间 */
static CGFloat const LTMessageDuration = 2.0; 

/** 消息显示\隐藏的动画时间 */
static CGFloat const LTAnimationDuration = 0.25;

@implementation LTStstusBarHUD

static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

/**
 *  全局窗口
 */
+ (void)setupWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert; // 最高级
    window_.frame = frame;
    window_.hidden = NO;

    frame.origin.y = 0;
    [UIView animateWithDuration:LTAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *  显示普通信息
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    
    [timer_ invalidate];

    
    // 显示窗口
    [self setupWindow];    
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = LTMessageFon;
    [button setTitle:msg forState:UIControlStateNormal];
    
    if (image) { // 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时消失
    timer_ = [NSTimer scheduledTimerWithTimeInterval:LTMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *  显示信息
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"sussess"]];
}

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"error"]];
}

/**
 *  显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self setupWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = LTMessageFon;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    
    [window_ addSubview:label];
    
    // 添加加载
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : LTMessageFon}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}

/**
 *  隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:LTAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
   
}

@end
