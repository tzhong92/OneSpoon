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
    self.title = @"Preferences";
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor redColor];
}

@end
