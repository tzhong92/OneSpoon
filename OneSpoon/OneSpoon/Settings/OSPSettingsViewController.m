//
//  OSPSettingsViewController.m
//  OneSpoon
//
//  Created by tzh_mac on 4/17/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPSettingsViewController.h"

@interface OSPSettingsViewController ()

@end

@implementation OSPSettingsViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Set up tab bar item.
    self.title = @"Settings";
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor grayColor];
}

@end
