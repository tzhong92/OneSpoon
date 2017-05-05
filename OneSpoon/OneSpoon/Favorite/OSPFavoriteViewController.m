//
//  OSPFavoriteViewController.m
//  OneSpoon
//
//  Created by tzh_mac on 4/17/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPFavoriteViewController.h"

@interface OSPFavoriteViewController ()

@end

@implementation OSPFavoriteViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Set up tab bar item.
    UITabBarItem *brandBarItem = [[UITabBarItem alloc] initWithTitle:@"喜欢" image:nil tag:3];
    self.tabBarItem = brandBarItem;
    
    // Set up navigation bar title.
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"我的·喜欢";
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor yellowColor];
}

@end
