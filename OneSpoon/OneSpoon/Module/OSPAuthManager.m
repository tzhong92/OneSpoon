//
//  OPSAuthManager.m
//  OneSpoon
//
//  Created by tzh_mac on 5/5/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPAuthManager.h"

@implementation OSPAuthManager {
  BOOL _didSignIn;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    _didSignIn = NO;
  }
  return self;
}

+ (instancetype)sharedInstance
{
  static OSPAuthManager *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[OSPAuthManager alloc] init];
  });
  return sharedInstance;
}

- (BOOL)isUserSignIn {
  return _didSignIn;
}

// TODO: Implement true sign in flow, return bool value.
- (void)signUserIn {
  _didSignIn = YES;
}

@end
