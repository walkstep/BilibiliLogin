//
//  LoginView.m
//  Bilibili
//
//  Created by 杨丰 on 2018/3/8.
//  Copyright © 2018年 jucheng. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()<UITextFieldDelegate>

@end

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initView];
        [self setupLayout];
    }
    
    return self;
}

- (void)initView {
    self.backgroundColor = UIColorFromAlphaRGB(kColorViewBackground, 1.0);
    
    _topImgV = [UIImageView imageViewWithImage:[UIImage imageNamed:@"img_openeye"]];
    _bgView = [UIView viewWithBackgroundColor:UIColorFromAlphaRGB(kColorFontWhite, 1.0)];
    _lineView1 = [UIView viewWithBackgroundColor:UIColorFromAlphaRGB(kColorViewBackground, 1.0)];
    _lineView2 = [UIView viewWithBackgroundColor:UIColorFromAlphaRGB(kColorViewBackground, 1.0)];
    _userImgV = [UIImageView imageViewWithImage:[UIImage imageNamed:@"img_account"]];
    _pwdImgV = [UIImageView imageViewWithImage:[UIImage imageNamed:@"img_password"]];
    
    _userTf = [UITextField textFieldWithPlaceholder:@"在这里输入手机号或者邮箱" fontSize:15.0f];
    _userTf.keyboardType = UIKeyboardTypeAlphabet;
    _userTf.clearButtonMode = UITextFieldViewModeWhileEditing;
    _userTf.delegate = self;
    
    _pwdTf = [UITextField textFieldWithPlaceholder:@"请输入密码" fontSize:15.0f];
    _pwdTf.keyboardType = UIKeyboardTypeAlphabet;
    _pwdTf.clearButtonMode = UITextFieldViewModeWhileEditing;
    _pwdTf.secureTextEntry = YES;
    _pwdTf.delegate = self;
    
    _registerBtn = [UIButton buttonWithTitle:@"注册" titleColor:UIColorFromAlphaRGB(kColorFontDarkGray, 1.0) fontSize:17];
    _registerBtn.backgroundColor = UIColorFromAlphaRGB(kColorFontWhite, 1.0);
    _registerBtn.layer.cornerRadius = 5.0f;
    
    _loginBtn = [UIButton buttonWithTitle:@"登录" titleColor:UIColorFromAlphaRGB(kColorFontWhite, 1.0) fontSize:17];
    _loginBtn.backgroundColor = UIColorFromAlphaRGB(kColorNavBackground, 0.5);
    _loginBtn.layer.cornerRadius = 5.0f;
    
    [self addSubview:_topImgV];
    [self addSubview:_bgView];
    [_bgView addSubview:_lineView1];
    [_bgView addSubview:_lineView2];
    [_bgView addSubview:_userImgV];
    [_bgView addSubview:_pwdImgV];
    [_bgView addSubview:_userTf];
    [_bgView addSubview:_pwdTf];
    [self addSubview:_registerBtn];
    [self addSubview:_loginBtn];
}

- (void)setupLayout {
    [_topImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.and.right.mas_equalTo(0);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_topImgV.mas_bottom);
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    
    [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(0.7);
    }];
    
    [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(0.7);
        make.bottom.mas_equalTo(0);
    }];
    
    [_userImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(20);
    }];
    
    [_userTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_userImgV);
        make.left.mas_equalTo(_userImgV.mas_right).mas_equalTo(20);
        make.width.mas_equalTo(kScreenWidth-19-40);
        make.height.mas_equalTo(20);
    }];
    
    [_pwdImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_lineView1.mas_bottom).mas_equalTo(15);
        make.left.mas_equalTo(_userImgV);
    }];
    
    [_pwdTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_pwdImgV);
        make.left.mas_equalTo(_pwdImgV.mas_right).mas_equalTo(20);
        make.width.mas_equalTo(kScreenWidth-19-40);
        make.height.mas_equalTo(20);
    }];
    
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_bgView.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo((kScreenWidth - 10 - 40)/2);
        make.height.mas_equalTo(40);
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_registerBtn);
        make.right.mas_equalTo(-20);
        make.width.mas_equalTo(_registerBtn);
        make.height.mas_equalTo(_registerBtn);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _userImgV.image = [UIImage imageNamed:@"img_account"];
    _pwdImgV.image = [UIImage imageNamed:@"img_password"];
    _topImgV.image = [UIImage imageNamed:@"img_openeye"];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if ([textField isEqual:_userTf]) {
        _userImgV.image = [UIImage imageNamed:@"img_account_selected"];
        _pwdImgV.image = [UIImage imageNamed:@"img_password"];
        _topImgV.image = [UIImage imageNamed:@"img_openeye"];
        NSLog(@"开始编辑用户");
    } else {
        _userImgV.image = [UIImage imageNamed:@"img_account"];
        _pwdImgV.image = [UIImage imageNamed:@"img_password_selected"];
        _topImgV.image = [UIImage imageNamed:@"img_closeeye"];
        NSLog(@"开始编辑密码");
    }
    
    return YES;
}

@end
