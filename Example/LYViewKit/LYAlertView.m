//
//  LYAlertView.m
//  LYViewKit_Example
//
//  Created by 似水灵修 on 2020/6/13.
//  Copyright © 2020 yyly. All rights reserved.
//

#import "LYAlertView.h"
#import <LYViewKit/LYViewKit.h>
@import Masonry;

@interface LYAlertView ()
@property (nonatomic, weak) LYCoverView *coverView;

@end

@implementation LYAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%@", self);
}

+ (instancetype)showInView:(UIView *)inView {
    LYAlertView *view = [[self alloc] init];
    view.frame = CGRectMake(0, 0, 100, 200);
    LYCoverView *coverView = [LYCoverView showContentView:view inView:inView];
    view.coverView = coverView;
    __weak typeof(view) weakView = view;
    coverView.touchCallback = ^(LYCoverView * _Nonnull coverView) {
        [coverView dismiss];
        if (weakView.touchDidDismiss) {
            weakView.touchDidDismiss();
        }
    };
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(view.superview);
//        make.centerX.equalTo(view.superview);
//        make.size.mas_offset(CGSizeMake(200, 100));
//    }];
    return view;
}

- (void)dismiss {
    [self.coverView dismiss];
}

- (void)configUI {
    self.backgroundColor = [UIColor greenColor];
}

@end
