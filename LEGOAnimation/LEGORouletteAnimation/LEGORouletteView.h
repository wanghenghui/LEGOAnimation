//
//  LEGORouletteView.h
//  LEGOAnimation
//
//  Created by 杨庆人 on 2019/8/16.
//  Copyright © 2019年 杨庆人. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LEGORouletteView : UIControl
@property (nonatomic, copy) void (^change)(CGFloat value);
@end

NS_ASSUME_NONNULL_END
