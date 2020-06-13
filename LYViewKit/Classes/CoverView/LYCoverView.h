//
//  LYCoverView.h
//  LYUI
//
//  Created by 似水灵修 on 16/6/7.
//  Copyright © 2016年 LY. All rights reserved.
//  遮罩层

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYCoverView : UIView

/// 呈现带有遮罩层的内容视图
/// @param contentView 内容视图，默认：居中显示
/// @param inView 遮罩层的父视图
+ (instancetype)showContentView:(UIView *)contentView inView:(UIView *)inView;

/// 取消遮罩层
- (void)dismiss;

@property (nonatomic, strong) UIColor *coverColor;
/// 点击遮罩层回调
@property (nonatomic, copy) void (^touchCallback)(LYCoverView *coverView);

@end

NS_ASSUME_NONNULL_END
