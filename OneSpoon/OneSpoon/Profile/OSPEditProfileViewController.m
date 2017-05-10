//
//  OSPEditProfileViewController.m
//  OneSpoon
//
//  Created by tzh_mac on 5/10/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPEditProfileViewController.h"

#import "OSPColor.h"
#import "OSPIcon.h"

@interface OSPEditProfileViewController ()

@end

@implementation OSPEditProfileViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Set up navigation bar title.
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"编辑个人信息";
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    
    UIImage *backImage = [[OSPIcon iconWithName:@"ic_chevron_left" withColor:[OSPColor signInScreenBackgroundColor]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:backImage
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(didTapBackButton)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton setFrame:CGRectMake(0, 0, 60, 25)];
    [saveButton setTitle:@"完成保存" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [saveButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [saveButton addTarget:self action:@selector(didTapSaveButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *saveBarButton = [[UIBarButtonItem alloc] initWithCustomView:saveButton];
    self.navigationItem.rightBarButtonItem = saveBarButton;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Private

- (void)didTapBackButton {
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)didTapSaveButton {
}

@end
