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
#import "Util/OSPIcon.h"

static const CGFloat kTabBarItemImageInset = 7.0;

@interface OSPTabBarController ()

@end

@implementation OSPTabBarController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  OSPRecommendationViewController *recommendationViewController =
      [[OSPRecommendationViewController alloc] initWithStyle:UITableViewStylePlain];
  UINavigationController *recommendationNavigationVC =
      [[UINavigationController alloc] initWithRootViewController:recommendationViewController];
  recommendationNavigationVC.tabBarItem = [self tabBarItemWithName:@"ic_binoculars"];
  
  OSPProfileViewController *profileViewController = [[OSPProfileViewController alloc] init];
  profileViewController.tabBarItem = [self tabBarItemWithName:@"ic_user"];
  
  OSPPreferencesViewController *preferencesViewController = [[OSPPreferencesViewController alloc] init];
  preferencesViewController.tabBarItem = [self tabBarItemWithName:@"ic_sliders"];
  
  OSPFavoriteViewController *favoriteViewController = [[OSPFavoriteViewController alloc] init];
  favoriteViewController.tabBarItem = [self tabBarItemWithName:@"ic_heart_solid"];
  
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

- (UITabBarItem *)tabBarItemWithName:(NSString *)name {
  UIImage *unselectedImage = [OSPIcon iconWithName:name withColor:[UIColor whiteColor]];
  UIImage *selectedImage = [OSPIcon iconWithName:name withColor:[OSPColor iconGeneralSelectedColor]];
  UIImage *unselectedImageWrapper = [unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  UIImage *selectedImageWrapper = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  UITabBarItem *barItem =
      [[UITabBarItem alloc] initWithTitle:nil image:unselectedImageWrapper selectedImage:selectedImageWrapper];
  barItem.imageInsets = UIEdgeInsetsMake(kTabBarItemImageInset, 0, -kTabBarItemImageInset, 0);
  return barItem;
}

@end
