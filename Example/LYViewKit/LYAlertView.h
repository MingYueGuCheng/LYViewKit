//
//  LYAlertView.h
//  LYViewKit_Example
//
//  Created by 似水灵修 on 2020/6/13.
//  Copyright © 2020 yyly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYAlertView : UIView

+ (instancetype)showInView:(UIView *)inView;
@property (nonatomic, copy) void (^touchDidDismiss)(void);
- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
