//
//  DKNavigationProtocol.h
//  QmuiCrashDemo
//
//  Created by DengKong.Sky on 2021/6/11.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SHNavigationBarButtonItemType){
    SHNavigationBarButtonItemTypeNone,
    SHNavigationBarButtonItemTypeWhite,
    SHNavigationBarButtonItemTypeBlack
};

@class DKNavigationController;

@protocol DKNavigationDelegate <NSObject>

@optional

/**
 根据页面判断是否隐藏导航栏
 */
- (BOOL)navigation:(DKNavigationController *)navigation hiddenNavigationController:(UIViewController *)vc;

/**
 根据页面隐藏左侧返回按钮
 */
- (BOOL)navigation:(DKNavigationController *)navigation hiddenBackBarButtonItem:(UIViewController *)vc;

/**
 根据左侧按钮样式：是否暗黑系，返回按钮图片
 */
- (UIImage *)navigationBackButtonImageSourceWithType:(SHNavigationBarButtonItemType)type;

@end
