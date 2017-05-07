//
//  OSPSignUpViewController.m
//  OneSpoon
//
//  Created by tzh_mac on 5/6/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPSignUpViewController.h"

#import "OSPColor.h"
#import "OSPFont.h"
#import "OSPIcon.h"

@interface OSPSignUpViewController ()

@end

@implementation OSPSignUpViewController {
  UILabel *_screenTitleLabel;
  UIButton *_backButton;
  UIImageView *_logoImageView;
  UILabel *_logoTitle;
  UILabel *_emailTitle;
  UITextField *_emailTextField;
  UILabel *_passwordTitle;
  UITextField *_passwordTextField;
  UILabel *_confirmEmailTitle;
  UITextField *_confirmEmailTextField;
  UILabel *_invitationCodeTitle;
  UITextField *_invitationCodeTextField;
  UIButton *_checkButton;
  BOOL _checkButtonSelected;
  UILabel *_agreementLabel;
  UIButton *_signUpButton;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.navigationController.navigationBarHidden = YES;
  self.view.backgroundColor = [OSPColor signInScreenBackgroundColor];
  
  _screenTitleLabel = [[UILabel alloc] init];
  _screenTitleLabel.text = @"注册新用户";
  _screenTitleLabel.textColor = [UIColor whiteColor];
  _screenTitleLabel.font = [OSPFont signUpScreenTitleFont];
  _screenTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:_screenTitleLabel];
  
  _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  UIImage *backButtonImage = [[OSPIcon iconWithName:@"ic_chevron_left" withColor:[UIColor whiteColor]]
                                  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  [_backButton setImage:backButtonImage forState:UIControlStateNormal];
  _backButton.translatesAutoresizingMaskIntoConstraints = NO;
  [_backButton addTarget:self action:@selector(didTapBackButton) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_backButton];
  
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
  
  _emailTitle = [self titleLabelWithTitle:@"注册邮箱"];
  _passwordTitle = [self titleLabelWithTitle:@"登录密码"];
  _confirmEmailTitle = [self titleLabelWithTitle:@"确认密码"];
  _invitationCodeTitle = [self titleLabelWithTitle:@"    邀请码"];
  
  _emailTextField = [self textFieldWithPlaceholder:@"注册邮箱"];
  _passwordTextField = [self textFieldWithPlaceholder:@"至少8个字符"];
  _confirmEmailTextField = [self textFieldWithPlaceholder:@"至少8个字符"];
  _invitationCodeTextField = [self textFieldWithPlaceholder:@"6个字符"];
  
  _checkButton = [[UIButton alloc] initWithFrame:CGRectZero];
  _checkButtonSelected = NO;
  _checkButton.backgroundColor = [UIColor whiteColor];
  UIImage *checkButtonImage = [[OSPIcon iconWithName:@"ic_check" withColor:[UIColor blackColor]]
                                  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  [_checkButton setImage:checkButtonImage forState:UIControlStateHighlighted];
  [_checkButton setImage:checkButtonImage forState:UIControlStateSelected];
  _checkButton.adjustsImageWhenHighlighted = YES;
  _checkButton.translatesAutoresizingMaskIntoConstraints = NO;
  [_checkButton addTarget:self action:@selector(didTapCheckButton) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_checkButton];
  
  _agreementLabel = [[UILabel alloc] init];
  _agreementLabel.text = @"同意一勺服务及隐私协议";
  _agreementLabel.textColor = [UIColor whiteColor];
  _agreementLabel.font = [UIFont systemFontOfSize:7];
  _agreementLabel.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:_agreementLabel];
  
  _signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  _signUpButton.layer.cornerRadius = 5;
  [_signUpButton setTitle:@"注    册" forState:UIControlStateNormal];
  [_signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  _signUpButton.titleLabel.font = [OSPFont signInTextTitleFont];
  _signUpButton.backgroundColor = [OSPColor signInButtonColor];
  _signUpButton.translatesAutoresizingMaskIntoConstraints = NO;
  [_signUpButton addTarget:self action:@selector(didTapSignUpButton) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_signUpButton];
  
  [self createConstraints];
}

#pragma mark - Private

- (UILabel *)titleLabelWithTitle:(NSString *)title {
  UILabel *titleLabel = [[UILabel alloc] init];
  titleLabel.text = title;
  titleLabel.textColor = [UIColor whiteColor];
  titleLabel.font = [OSPFont signInTextTitleFont];
  titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:titleLabel];
  return titleLabel;
}

- (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder {
  UITextField *textField = [[UITextField alloc] initWithFrame:CGRectZero];
  textField.placeholder = placeholder;
  textField.font = [OSPFont signInTextFieldFont];
  textField.backgroundColor = [UIColor whiteColor];
  textField.borderStyle = UITextBorderStyleRoundedRect;
  textField.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:textField];
  return textField;
}

- (void)didTapBackButton {
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)didTapCheckButton {
  _checkButtonSelected = !_checkButtonSelected;
  [_checkButton setSelected:_checkButtonSelected];
}

- (void)didTapSignUpButton {
  
}

- (void)createConstraints {
  NSDictionary<NSString *, id> *metricsDictionary = @{};
  NSDictionary<NSString *, id> *viewsDictionary = NSDictionaryOfVariableBindings(
    _screenTitleLabel,
    _backButton,
    _logoImageView,
    _logoTitle,
    _emailTitle,
    _emailTextField,
    _passwordTitle,
    _passwordTextField,
    _confirmEmailTitle,
    _confirmEmailTextField,
    _invitationCodeTitle,
    _invitationCodeTextField,
    _checkButton,
    _agreementLabel,
    _signUpButton
  );
  // TODO: Using constant to store the paddings
  NSArray<NSString *> *formatStrings = @[
    @"V:[_backButton(==20)]",
    @"V:|-(25)-[_screenTitleLabel]",
    @"V:[_logoImageView(==100)]",
    @"V:|-(115)-[_logoImageView]-(10)-[_logoTitle]",
    @"V:[_logoTitle]-(60)-[_emailTitle]-(20)-[_passwordTitle]-(20)-[_confirmEmailTitle]-(20)-[_invitationCodeTitle]",
    @"V:[_emailTextField(==25)]",
    @"V:[_passwordTextField(==25)]",
    @"V:[_confirmEmailTextField(==25)]",
    @"V:[_invitationCodeTextField(==25)]",
    @"V:[_invitationCodeTitle]-(15)-[_agreementLabel]",
    @"V:[_checkButton(==8)]",
    @"V:[_invitationCodeTitle]-(50)-[_signUpButton(==25)]",
    @"H:|-(15)-[_backButton(==20)]",
    @"H:[_logoImageView(==100)]",
    @"H:|-(55)-[_emailTitle(==55)]-(5)-[_emailTextField]-(55)-|",
    @"H:|-(55)-[_passwordTitle(==55)]-(5)-[_passwordTextField]-(55)-|",
    @"H:|-(55)-[_confirmEmailTitle(==55)]-(5)-[_confirmEmailTextField]-(55)-|",
    @"H:|-(55)-[_invitationCodeTitle(==55)]-(5)-[_invitationCodeTextField]-(55)-|",
    @"H:[_checkButton(==8)]-(5)-[_agreementLabel]",
    @"H:[_signUpButton(==90)]",
  ];
  for (NSString *formatString in formatStrings) {
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:formatString
                                                                                    options:0
                                                                                    metrics:metricsDictionary
                                                                                      views:viewsDictionary]];
  }
  [self makeCentralItem:_screenTitleLabel];
  [self makeCentralItem:_logoImageView];
  [self makeCentralItem:_logoTitle];
  [self makeCentralItem:_signUpButton];
  [self horizontalAlignItem:_backButton withItem:_screenTitleLabel];
  [self horizontalAlignItem:_emailTitle withItem:_emailTextField];
  [self horizontalAlignItem:_passwordTitle withItem:_passwordTextField];
  [self horizontalAlignItem:_confirmEmailTitle withItem:_confirmEmailTextField];
  [self horizontalAlignItem:_invitationCodeTitle withItem:_invitationCodeTextField];
  [self horizontalAlignItem:_checkButton withItem:_agreementLabel];
  NSLayoutConstraint *checkButtonConstraint = [NSLayoutConstraint constraintWithItem:_checkButton
                                                                           attribute:NSLayoutAttributeLeft
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:_invitationCodeTextField
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1
                                                                            constant:0];
  [NSLayoutConstraint activateConstraints:@[checkButtonConstraint]];
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
