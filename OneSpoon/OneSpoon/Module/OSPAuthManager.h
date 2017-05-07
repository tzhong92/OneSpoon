//
//  OPSAuthManager.h
//  OneSpoon
//
//  Created by tzh_mac on 5/5/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OSPAuthManager : NSObject

+ (instancetype)sharedInstance;

- (BOOL)isUserSignIn;

- (void)signUserIn;

@end
