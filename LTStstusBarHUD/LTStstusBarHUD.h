//
//  LTStstusBarHUD.h
//  LTStatusBarHUD
//
//  Created by 七扇门 on 16/7/14.
//  Copyright © 2016年 luotao. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>

@interface LTStstusBarHUD : NSObject

/**
 *  显示普通信息
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示信息
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏
 */
+ (void)hide;

@end
