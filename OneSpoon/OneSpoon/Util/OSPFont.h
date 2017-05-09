//
//  OSPFont.h
//  OneSpoon
//
//  Created by tzh_mac on 5/4/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface OSPFont : NSObject

+ (UIFont *)cardNameFont;
+ (UIFont *)cardBioInfoFont;
+ (UIFont *)cardInfoTitleFont;
+ (UIFont *)cardInfoFont;

+ (UIFont *)signInLogoFont;
+ (UIFont *)signInTextTitleFont;
+ (UIFont *)signInTextFieldFont;
+ (UIFont *)signUpScreenTitleFont;

+ (UIFont *)favoriteNameFont;
+ (UIFont *)favoriteBioInfoFont;
+ (UIFont *)favoriteProfessionFont;

@end
