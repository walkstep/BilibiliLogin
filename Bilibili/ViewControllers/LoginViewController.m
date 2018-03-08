//
//  LoginViewController.m
//  Bilibili
//
//  Created by 杨丰 on 2018/3/7.
//  Copyright © 2018年 jucheng. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) LoginView *loginView;

@property (nonatomic, copy) NSString *user;
@property (nonatomic, copy) NSString *pwd;

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = UIColorFromAlphaRGB(kColorNavBackground, 1.0);
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self bindingViewModel];
}

- (void)initView {
    self.title = @"登录";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _leftBtn = [UIButton buttonWithNormalImage:[UIImage imageNamed:@"btn_close"] highlightImage:[UIImage imageNamed:@"btn_close"]];
    _leftBtn.frame = CGRectMake(0, 0, 15, 15);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    
    _rightBtn = [UIButton buttonWithTitle:@"忘记密码" titleColor:UIColorFromAlphaRGB(kColorFontWhite, 1.0) fontSize:15.0f];
    _rightBtn.frame = CGRectMake(0, 0, 50, 30);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    
    _loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:_loginView];
}

- (void)bindingViewModel {
    RAC(self, user) = _loginView.userTf.rac_textSignal;
    RAC(self, pwd) = _loginView.pwdTf.rac_textSignal;
    
    RAC(_loginView.loginBtn, enabled) = [RACSignal combineLatest:@[_loginView.userTf.rac_textSignal, _loginView.pwdTf.rac_textSignal] reduce:^(NSString *userStr, NSString *pwdStr){
        BOOL enable = (userStr.length > 0) && (pwdStr.length >= 6);
        
        [_loginView.loginBtn setBackgroundColor:enable ? UIColorFromAlphaRGB(kColorNavBackground, 1.0) : UIColorFromAlphaRGB(kColorNavBackground, 0.5)];
        
        return @(enable);
    }];
    
    [[_loginView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self.view endEditing:YES];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"登录成功" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

@end
