//
//  DetailViewController.m
//  QmuiCrashDemo
//
//  Created by DengKong.Sky on 2021/6/10.
//

#import "DetailViewController.h"
#import "DKNavigationController.h"

#import "DKNavigationController.h"

@interface DetailViewController () <DKNavigationDelegate>

@end

@implementation DetailViewController

- (void)viewDidLoad {
    self.view.backgroundColor = UIColor.lightGrayColor;
    
    DKNavigationController *nav = (DKNavigationController *)self.navigationController;
    [nav setNavigationBarBlack:NO];
    nav.navigationDelegate = self;
}

- (BOOL)isHiddenNavigation {
    return NO;
}

- (BOOL)navigation:(DKNavigationController *)navigation hiddenNavigationController:(UIViewController *)vc {
    return NO;
}

@end
