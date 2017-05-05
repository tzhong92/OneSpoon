//
//  OSPTabBarController.m
//  OneSpoon
//
//  Created by tzh_mac on 4/17/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPTabBarController.h"

#import "Recommendation/OSPRecommendationViewController.h"
#import "Favorite/OSPFavoriteViewController.h"
#import "Preferences/OSPPreferencesViewController.h"
#import "Profile/OSPProfileViewController.h"
#import "Util/OSPColor.h"

@interface OSPTabBarController ()

@end

@implementation OSPTabBarController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  OSPRecommendationViewController *recommendationViewController =
      [[OSPRecommendationViewController alloc] initWithStyle:UITableViewStylePlain];
  UINavigationController *recommendationNavigationVC =
      [[UINavigationController alloc] initWithRootViewController:recommendationViewController];
  UITabBarItem *brandBarItem = [[UITabBarItem alloc] initWithTitle:@"推荐" image:nil tag:0];
  recommendationNavigationVC.tabBarItem = brandBarItem;
  
  OSPProfileViewController *profileViewController = [[OSPProfileViewController alloc] init];
  OSPPreferencesViewController *preferencesViewController = [[OSPPreferencesViewController alloc] init];
  OSPFavoriteViewController *favoriteViewController = [[OSPFavoriteViewController alloc] init];
  self.viewControllers = @[
    recommendationNavigationVC,
    profileViewController,
    preferencesViewController,
    favoriteViewController
  ];
  
  self.tabBar.barTintColor = [OSPColor tabBarBackgroundColor];
  self.tabBar.tintColor = [UIColor whiteColor];
  // The default tranlucent of tab bar is YES.
  self.tabBar.translucent = NO;
  [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:12]}
                                           forState:UIControlStateNormal];
}

@end
