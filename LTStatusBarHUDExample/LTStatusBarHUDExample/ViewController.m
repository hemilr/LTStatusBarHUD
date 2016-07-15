//
//  ViewController.m
//  LTStatusBarHUDExample
//
//  Created by Seven Door on 16/7/15.
//  Copyright © 2016年 luotao. All rights reserved.
//

#import "ViewController.h"
#import "LTStstusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sussess {
    [LTStstusBarHUD showSuccess:@"加载成功"];
}

- (IBAction)failed {
    [LTStstusBarHUD showError:@"加载失败"];
}

- (IBAction)loading {
    [LTStstusBarHUD showLoading:@"正在加载..."];
}

- (IBAction)dissmiss {
    [LTStstusBarHUD hide];
}

- (IBAction)normal {
    [LTStstusBarHUD showMessage:@"HAHAHA"];
}

@end
