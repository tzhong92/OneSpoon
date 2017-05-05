//
//  OSPIcon.h
//  OneSpoon
//
//  Created by tzh_mac on 5/4/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface OSPIcon : NSObject

+ (UIImage *)iconWithName:(NSString *)name withColor:(UIColor *)color;
+ (UIImage *)blendImage:(UIImage *)image withColor:(UIColor *)color;

@end
