//
//  OSPTabBarController.m
//  OneSpoon
//
//  Created by tzh_mac on 4/17/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPTabBarController.h"

#import "Discovery/OSPDiscoveryViewController.h"
#import "Favorite/OSPFavoriteViewController.h"
#import "Preferences/OSPPreferencesViewController.h"
#import "Profile/OSPProfileViewController.h"
#import "Settings/OSPSettingsViewController.h"

@interface OSPTabBarController ()

@end

@implementation OSPTabBarController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  OSPDiscoveryViewController *discoveryViewController = [[OSPDiscoveryViewController alloc] init];
  OSPProfileViewController *profileViewController = [[OSPProfileViewController alloc] init];
  OSPPreferencesViewController *preferencesViewController = [[OSPPreferencesViewController alloc] init];
  OSPFavoriteViewController *favoriteViewController = [[OSPFavoriteViewController alloc] init];
  OSPSettingsViewController *settingsViewController = [[OSPSettingsViewController alloc] init];
  self.viewControllers = @[
    discoveryViewController,
    profileViewController,
    preferencesViewController,
    favoriteViewController,
    settingsViewController
  ];
  
  self.tabBar.barTintColor = [UIColor whiteColor];
  self.tabBar.tintColor = [UIColor blackColor];
  [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:12]}
                                           forState:UIControlStateNormal];
}

@end
