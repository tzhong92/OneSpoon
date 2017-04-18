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
    self.title = @"Favorite";
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor yellowColor];
}

@end
