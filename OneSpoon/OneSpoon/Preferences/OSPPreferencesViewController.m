//
//  OSPPreferencesViewController.m
//  OneSpoon
//
//  Created by tzh_mac on 4/17/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPPreferencesViewController.h"

@interface OSPPreferencesViewController ()

@end

@implementation OSPPreferencesViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Set up tab bar item.
    UITabBarItem *brandBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:nil tag:2];
    self.tabBarItem = brandBarItem;
    
    // Set up navigation bar title.
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"个人·设置";
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
}

@end
