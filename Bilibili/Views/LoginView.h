//
//  LoginView.h
//  Bilibili
//
//  Created by 杨丰 on 2018/3/8.
//  Copyright © 2018年 jucheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

@property (nonatomic, strong) UIImageView *topImgV;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *lineView1;
@property (nonatomic, strong) UIView *lineView2;
@property (nonatomic, strong) UIImageView *userImgV;
@property (nonatomic, strong) UIImageView *pwdImgV;
@property (nonatomic, strong) UITextField *userTf;
@property (nonatomic, strong) UITextField *pwdTf;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) UIButton *loginBtn;

@end
