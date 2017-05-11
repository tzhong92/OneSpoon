//
//  OSPProfileViewController.m
//  OneSpoon
//
//  Created by tzh_mac on 4/17/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPProfileViewController.h"

#import "OSPProfileEditViewController.h"
#import "OSPProfile.h"

static const CGFloat kStatusBarHeight = 20.0;
static const CGFloat kNavigationBarHeight = 44.0;

@interface OSPProfileViewController ()

@end

@implementation OSPProfileViewController {
  OSPProfile *_profile;
  OSPProfileView *_profileView;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Set up tab bar item.
    UITabBarItem *brandBarItem = [[UITabBarItem alloc] initWithTitle:@"主页" image:nil tag:1];
    self.tabBarItem = brandBarItem;
    
    // Set up navigation bar title.
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"个人·主页";
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  
  // TODO: Access to OSPProfileManager to get self profile.
  [self setUpDefaultData];
  
  _profileView = [[OSPProfileView alloc] initWithProfile:_profile delegate:self];
  _profileView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:_profileView];
  
  [self createConstrants];
}

#pragma mark - OSPProfileViewDelegate

- (void)tapEditButton {
  OSPProfileEditViewController *profileEditVC = [[OSPProfileEditViewController alloc] init];
  [self.navigationController pushViewController:profileEditVC animated:YES];
}

#pragma mark - Private

- (void)setUpDefaultData {
  _profile= [[OSPProfile alloc] init];
  _profile.name = @"Jenny Z.";
  _profile.location = @"北京";
  _profile.education = @"斯坦福大学 · 北京大学";
  _profile.workExperience = @"商业分析师 @ 麦肯锡咨询";
  _profile.characterLabel = @"文艺女青年 · 逗比 · 厨艺超群";
  _profile.introduction = @"容易害羞喜欢安静的我，其实有最疯狂浪漫的一面";
  _profile.age = 25;
  _profile.height = 162;
  _profile.picture = @"Jenny";
}

- (void)createConstrants {
  CGFloat topMargin = kStatusBarHeight + kNavigationBarHeight;
  NSDictionary<NSString *, id> *metricsDictionary = @{@"topMargin" : @(topMargin)};
  NSDictionary<NSString *, id> *viewsDictionary = NSDictionaryOfVariableBindings(_profileView);
  // TODO: Using constant to store the paddings
  NSArray<NSString *> *formatStrings = @[
    @"V:|-(topMargin)-[_profileView]|",
    @"H:|[_profileView]|"
  ];
  for (NSString *formatString in formatStrings) {
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:formatString
                                                                                    options:0
                                                                                    metrics:metricsDictionary
                                                                                      views:viewsDictionary]];
  }
}

@end
