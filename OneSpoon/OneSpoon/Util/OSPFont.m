//
//  OSPFont.m
//  OneSpoon
//
//  Created by tzh_mac on 5/4/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPFont.h"

@implementation OSPFont

#pragma mark - Card view in recommendation screen

+ (UIFont *)cardNameFont {
  return [UIFont systemFontOfSize:19 weight:UIFontWeightSemibold];
}

+ (UIFont *)cardBioInfoFont {
  return [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
}

+ (UIFont *)cardInfoTitleFont {
  return [UIFont systemFontOfSize:10 weight:UIFontWeightBold];
}

+ (UIFont *)cardInfoFont {
  return [UIFont systemFontOfSize:10 weight:UIFontWeightLight];
}

#pragma mark - Sign in flow

+ (UIFont *)signInLogoFont {
  return [UIFont systemFontOfSize:13 weight:UIFontWeightBold];
}

+ (UIFont *)signInTextTitleFont {
  return [UIFont systemFontOfSize:13 weight:UIFontWeightSemibold];
}

+ (UIFont *)signInTextFieldFont {
  return [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
}

+ (UIFont *)signUpScreenTitleFont {
  return [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
}

#pragma mark - Favorite screen

+ (UIFont *)favoriteNameFont {
  return [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
}

+ (UIFont *)favoriteBioInfoFont {
  return [UIFont systemFontOfSize:9 weight:UIFontWeightRegular];
}

+ (UIFont *)favoriteProfessionFont {
  return [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
}

+ (UIFont *)favoriteStatusFont {
  return [UIFont systemFontOfSize:11 weight:UIFontWeightRegular];
}

@end
