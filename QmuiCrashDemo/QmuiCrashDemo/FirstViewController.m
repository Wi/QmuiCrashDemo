//
//  FirstViewController.m
//  QmuiCrashDemo
//
//  Created by DengKong.Sky on 2021/6/10.
//

#import "FirstViewController.h"
#import "DetailViewController.h"
#import "DKNavigationController.h"

@interface FirstViewController () <DKNavigationDelegate>

@end

@implementation FirstViewController

- (void)viewDidLoad {
    self.view.backgroundColor = UIColor.brownColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = UIColor.blueColor;
    [btn addTarget:self action:@selector(goDetailVc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)viewWillAppear:(BOOL)animated {
    DKNavigationController *firstNav = (DKNavigationController *)self.navigationController;
    firstNav.navigationDelegate = self;
}

- (void)goDetailVc {
    DetailViewController *vc = [[DetailViewController alloc] init];
    DKNavigationController *firstNav = (DKNavigationController *)self.navigationController;
    firstNav.navigationDelegate = vc;
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)navigation:(DKNavigationController *)navigation hiddenNavigationController:(UIViewController *)vc {
    return YES;
}


@end
