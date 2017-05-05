//
//  OSPProfileViewController.m
//  OneSpoon
//
//  Created by tzh_mac on 4/17/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPProfileViewController.h"

@interface OSPProfileViewController ()

@end

@implementation OSPProfileViewController

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
  self.view.backgroundColor = [UIColor blueColor];
}

@end
