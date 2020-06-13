//
//  LYCoverView.m
//  LYUI
//
//  Created by 似水灵修 on 16/6/7.
//  Copyright © 2016年 LY. All rights reserved.
//

#import "LYCoverView.h"
#import <Masonry/Masonry.h>

@interface LYCoverView ()
@property (nonatomic, weak) UIView *bgView;

@end

@implementation LYCoverView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [bgView addGestureRecognizer:tap];
        [self addSubview:bgView];
        _bgView = bgView;

        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (void)setCoverColor:(UIColor *)coverColor {
    _coverColor = coverColor;
    self.bgView.backgroundColor = _coverColor;
}

+ (instancetype)showContentView:(UIView *)contentView inView:(UIView *)inView {
    if (inView) {
        LYCoverView *coverView = [[self alloc] init];
        [inView addSubview:coverView];
        [coverView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(inView);
        }];
        
        if (contentView) {
            [coverView addSubview:contentView];
            [coverView layoutIfNeeded];
            contentView.center = coverView.bgView.center;
            contentView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        }

        return coverView;
    } else {
        NSAssert(inView, @"inView is nil");
        return nil;
    }
}

- (void)tapAction {
    if (self.touchCallback) {
        self.touchCallback(self);
    }
}

- (void)dismiss {
    if (self.superview) {
        [self removeFromSuperview];
    }
}

@end
