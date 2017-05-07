//
//  OSPSignInViewController.m
//  OneSpoon
//
//  Created by tzh_mac on 5/5/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPSignInViewController.h"

#import "OSPAuthManager.h"
#import "OSPColor.h"
#import "OSPFont.h"
#import "OSPSignUpViewController.h"

@interface OSPSignInViewController ()

@end

@implementation OSPSignInViewController {
  UIImageView *_logoImageView;
  UILabel *_logoTitle;
  UILabel *_userNameTitle;
  UITextField *_userNameTextField;
  UILabel *_passwordTitle;
  UITextField *_passwordTextField;
  UIButton *_forgetPasswordButton;
  UIButton *_signUpButton;
  UIButton *_loginButton;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.navigationController.navigationBarHidden = YES;
  self.view.backgroundColor = [OSPColor signInScreenBackgroundColor];
  
  // TODO: Currently the logo is a screenshot, replace with more clear picture in the future.
  _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SignInLogo"]];
  _logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:_logoImageView];
  
  _logoTitle = [[UILabel alloc] init];
  _logoTitle.text = @"弱水三千，只爱一勺";
  _logoTitle.textColor = [UIColor whiteColor];
  _logoTitle.font = [OSPFont signInLogoFont];
  _logoTitle.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:_logoTitle];
  
  _userNameTitle = [[UILabel alloc] init];
  _userNameTitle.text = @"用户名";
  _userNameTitle.textColor = [UIColor whiteColor];
  _userNameTitle.font = [OSPFont signInTextTitleFont];
  _userNameTitle.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:_userNameTitle];
  
  _passwordTitle = [[UILabel alloc] init];
  _passwordTitle.text = @"密    码";
  _passwordTitle.textColor = [UIColor whiteColor];
  _passwordTitle.font = [OSPFont signInTextTitleFont];
  _passwordTitle.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:_passwordTitle];
  
  _userNameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
  _userNameTextField.placeholder = @"注册邮箱";
  _userNameTextField.font = [OSPFont signInTextFieldFont];
  _userNameTextField.backgroundColor = [UIColor whiteColor];
  _userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
  _userNameTextField.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:_userNameTextField];
  
  _passwordTextField = [[UITextField alloc] initWithFrame:CGRectZero];
  _passwordTextField.placeholder = @"至少8个字符";
  _passwordTextField.font = [OSPFont signInTextFieldFont];
  _passwordTextField.backgroundColor = [UIColor whiteColor];
  _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
  _passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:_passwordTextField];
  
  _forgetPasswordButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [_forgetPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
  [_forgetPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  _forgetPasswordButton.titleLabel.font = [UIFont systemFontOfSize:7];
  _forgetPasswordButton.translatesAutoresizingMaskIntoConstraints = NO;
  [_forgetPasswordButton addTarget:self
                            action:@selector(didTapForgetPasswordButton)
                  forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_forgetPasswordButton];
  
  _signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  _signUpButton.layer.cornerRadius = 5;
  [_signUpButton setTitle:@"注    册" forState:UIControlStateNormal];
  [_signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  _signUpButton.titleLabel.font = [OSPFont signInTextTitleFont];
  _signUpButton.backgroundColor = [OSPColor signInButtonColor];
  _signUpButton.translatesAutoresizingMaskIntoConstraints = NO;
  [_signUpButton addTarget:self action:@selector(didTapSignUpButton) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_signUpButton];

  _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  _loginButton.layer.cornerRadius = 5;
  [_loginButton setTitle:@"登    录" forState:UIControlStateNormal];
  [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  _loginButton.titleLabel.font = [OSPFont signInTextTitleFont];
  _loginButton.backgroundColor = [OSPColor signInButtonColor];
  _loginButton.translatesAutoresizingMaskIntoConstraints = NO;
  [_loginButton addTarget:self action:@selector(didTapLoginButton) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_loginButton];
  
  [self createConstrants];
}

#pragma mark - Private

- (void)didTapForgetPasswordButton {
  
}

- (void)didTapSignUpButton {
  OSPSignUpViewController *signUpVC = [[OSPSignUpViewController alloc] init];
  [self.navigationController pushViewController:signUpVC animated:YES];
}

- (void)didTapLoginButton {
  [[OSPAuthManager sharedInstance] signUserIn];
  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)createConstrants {
  NSDictionary<NSString *, id> *metricsDictionary = @{};
  NSDictionary<NSString *, id> *viewsDictionary = NSDictionaryOfVariableBindings(
    _logoImageView,
    _logoTitle,
    _userNameTitle,
    _userNameTextField,
    _passwordTitle,
    _passwordTextField,
    _forgetPasswordButton,
    _signUpButton,
    _loginButton
  );
  // TODO: Using constant to store the paddings
  NSArray<NSString *> *formatStrings = @[
    @"V:[_logoImageView(==100)]",
    @"V:|-(115)-[_logoImageView]-(10)-[_logoTitle]",
    @"V:[_logoTitle]-(110)-[_userNameTitle]-(20)-[_passwordTitle]",
    @"V:[_userNameTextField(==25)]",
    @"V:[_passwordTextField(==25)]",
    @"V:[_passwordTitle]-(30)-[_signUpButton(==25)]",
    @"V:[_passwordTitle]-(30)-[_loginButton(==25)]",
    @"V:[_passwordTitle]-(5)-[_forgetPasswordButton]",
    @"H:[_logoImageView(==100)]",
    @"H:|-(60)-[_userNameTitle(==50)]-(10)-[_userNameTextField]-(60)-|",
    @"H:|-(60)-[_passwordTitle(==50)]-(10)-[_passwordTextField]-(60)-|",
    @"H:[_forgetPasswordButton]-(60)-|",
    @"H:|-(60)-[_signUpButton(==_loginButton)]-(20)-[_loginButton]-(60)-|",
  ];
  for (NSString *formatString in formatStrings) {
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:formatString
                                                                                    options:0
                                                                                    metrics:metricsDictionary
                                                                                      views:viewsDictionary]];
  }
  [self makeCentralItem:_logoImageView];
  [self makeCentralItem:_logoTitle];
  [self horizontalAlignItem:_userNameTitle withItem:_userNameTextField];
  [self horizontalAlignItem:_passwordTitle withItem:_passwordTextField];
}

- (void)makeCentralItem:(UIView *)item {
  NSLayoutConstraint *centerConstraint = [NSLayoutConstraint constraintWithItem:item
                                                                      attribute:NSLayoutAttributeCenterX
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeCenterX
                                                                     multiplier:1
                                                                       constant:0];
  [NSLayoutConstraint activateConstraints:@[centerConstraint]];
}

- (void)horizontalAlignItem:(UIView *)item1 withItem:(UIView *)item2 {
  NSLayoutConstraint *centerConstraint = [NSLayoutConstraint constraintWithItem:item1
                                                                      attribute:NSLayoutAttributeCenterY
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:item2
                                                                      attribute:NSLayoutAttributeCenterY
                                                                     multiplier:1
                                                                       constant:0];
  [NSLayoutConstraint activateConstraints:@[centerConstraint]];
}

@end
