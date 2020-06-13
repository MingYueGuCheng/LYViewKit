//
//  LYViewController.m
//  LYViewKit
//
//  Created by yyly on 06/12/2020.
//  Copyright (c) 2020 yyly. All rights reserved.
//

#import "LYViewController.h"
#import <LYViewKit/LYViewKit.h>
#import "LYAlertView.h"

@interface LYViewController ()
@property (nonatomic, strong) UIButton *addBtn;

@end

@implementation LYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.addBtn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [self.addBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addBtn];
}

- (void)btnClick {
    LYAlertView *alertView = [LYAlertView showInView:self.view];
    alertView.touchDidDismiss = ^{
        NSLog(@"====>");
    };
}

- (void)viewDidLayoutSubviews {
    self.addBtn.center = self.view.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
