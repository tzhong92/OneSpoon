//
//  OSPTabBarController.m
//  OneSpoon
//
//  Created by tzh_mac on 4/17/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPTabBarController.h"

#import "OSPProfileViewController.h"

@interface OSPTabBarController ()

@end

@implementation OSPTabBarController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  OSPProfileViewController *firstTabViewController = [[OSPProfileViewController alloc] init];
  OSPProfileViewController *secondViewController = [[OSPProfileViewController alloc] init];
  OSPProfileViewController *thirdViewController = [[OSPProfileViewController alloc] init];
  OSPProfileViewController *fourthViewController = [[OSPProfileViewController alloc] init];
  self.viewControllers = @[firstTabViewController, secondViewController, thirdViewController, fourthViewController];
  
  self.tabBar.barTintColor = [UIColor whiteColor];
  self.tabBar.tintColor = [UIColor blackColor];
  [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:12]}
                                           forState:UIControlStateNormal];
}

@end
