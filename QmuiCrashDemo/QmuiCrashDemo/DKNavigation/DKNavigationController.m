//
//  DKNavigationController.m
//  QmuiCrashDemo
//
//  Created by DengKong.Sky on 2021/6/11.
//

#import "DKNavigationController.h"
#import <QMUIKit/QMUIKit.h>

@interface DKNavigationController ()

@property (nonatomic, strong) UIBarButtonItem *leftBarButtonItemBlack;
@property (nonatomic, strong) UIBarButtonItem *leftBarButtonItemWhite;

@property (nonatomic, assign) BOOL isNavigationBarBlack;


@end

@implementation DKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 在viewWillAppear处理导航栏的隐藏
    BOOL hiddenNav = [self hiddenNavigationController:self.topViewController];
    [self setNavigationBarHidden:hiddenNav animated:NO];
    
    [self setBackBarButtonItem];
    
}

- (BOOL)hiddenNavigationController:(UIViewController *)viewController {
    if (self.navigationDelegate && [self.navigationDelegate respondsToSelector:@selector(navigation:hiddenNavigationController:)]) {
        return [self.navigationDelegate navigation:self hiddenNavigationController:viewController];
    }
    return NO;
}

- (void)setBackBarButtonItem {
    BOOL isHiddenBackBarButtonItem = NO;
    if (self.navigationDelegate
        && [self.navigationDelegate respondsToSelector:@selector(navigation:hiddenBackBarButtonItem:)]) {
        isHiddenBackBarButtonItem = [self.navigationDelegate navigation:self hiddenBackBarButtonItem:self.topViewController];
    }
    if (isHiddenBackBarButtonItem) {
        self.topViewController.navigationItem.hidesBackButton = YES;
        self.topViewController.navigationItem.leftBarButtonItem = nil;
    }else {
        self.topViewController.navigationItem.hidesBackButton = NO;
        self.topViewController.navigationItem.leftBarButtonItem = self.isNavigationBarBlack ? self.leftBarButtonItemWhite : self.leftBarButtonItemBlack;
    }
}

- (void)setNavigationBarBlack:(BOOL)isBlack {
    self.isNavigationBarBlack = isBlack;
    if (isBlack) {
        self.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
        self.topViewController.navigationItem.leftBarButtonItem = self.leftBarButtonItemWhite;
    } else {
        self.navigationBar.tintColor = [UIColor blackColor];
        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
        self.topViewController.navigationItem.leftBarButtonItem = self.leftBarButtonItemBlack;
    }
    
}

- (UIBarButtonItem *)leftBarButtonItemBlack {
    if (!_leftBarButtonItemBlack) {
        UIImage *blackImage = [UIImage imageNamed:@"back_icon_black"];//(@"sh_nav_back_black");
        if (self.navigationDelegate && [self.navigationDelegate respondsToSelector:@selector(navigationBackButtonImageSourceWithType:)]) {
            blackImage = [self.navigationDelegate navigationBackButtonImageSourceWithType:SHNavigationBarButtonItemTypeBlack];
        }
        //增大按钮点击区域
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:blackImage forState:UIControlStateNormal];
        btn.bounds = CGRectMake(0, 0, 60,40);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        [btn addTarget:self action:@selector(sh_popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
        _leftBarButtonItemBlack = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return _leftBarButtonItemBlack;
}

- (UIBarButtonItem *)leftBarButtonItemWhite {
    if (!_leftBarButtonItemWhite) {
        UIImage *whiteImage = [UIImage imageNamed:@"back_icon_white"];
        if (self.navigationDelegate && [self.navigationDelegate respondsToSelector:@selector(navigationBackButtonImageSourceWithType:)]) {
            whiteImage = [self.navigationDelegate navigationBackButtonImageSourceWithType:SHNavigationBarButtonItemTypeWhite];
        }
        //增大按钮点击区域
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:whiteImage forState:UIControlStateNormal];
        btn.bounds = CGRectMake(0, 0, 60,40);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        [btn addTarget:self action:@selector(sh_popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
        _leftBarButtonItemWhite = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return _leftBarButtonItemWhite;
}

- (void)sh_popViewControllerAnimated:(id)sender {
    [self popViewControllerAnimated:YES];
}


+ (UIViewController *)topViewController {
    UIWindow *window =  [UIApplication sharedApplication].keyWindow;
    UIViewController *rootViewController = window.rootViewController;
    if ([rootViewController isKindOfClass:[UITabBarController class]]){
        UIViewController *vc = ((UITabBarController *)rootViewController).selectedViewController;
        if ([vc isKindOfClass:[UINavigationController class]]) {
            return ((UINavigationController *)vc).topViewController;
        }else {
            return vc;
        }
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        return ((UINavigationController *)rootViewController).topViewController;
    } else {
        return rootViewController;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.topViewController == viewController) {
        NSLog( @"pushViewController failed: PushViewController is topViewController");
        return;
    }
    
    if ([self.viewControllers count] != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    NSLog( @"pushViewController:%@, viewControllers:%@", viewController, self.viewControllers);
    [super pushViewController:viewController animated:animated];
    
    // 在pushViewController之后处理导航栏的隐藏
    BOOL hiddenNav = [self hiddenNavigationController:viewController];
    [self setNavigationBarHidden:hiddenNav animated:NO];
}

@end
