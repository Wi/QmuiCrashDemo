//
//  DKNavigationController.h
//  QmuiCrashDemo
//
//  Created by DengKong.Sky on 2021/6/11.
//

#import <UIKit/UIKit.h>
#import "DKNavigationProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DKNavigationController : UINavigationController

@property (nonatomic, weak) id<DKNavigationDelegate> navigationDelegate;

- (void)setNavigationBarBlack:(BOOL)isBlack;

@end

NS_ASSUME_NONNULL_END
