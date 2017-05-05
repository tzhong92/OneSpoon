//
//  OSPFont.m
//  OneSpoon
//
//  Created by tzh_mac on 5/4/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPFont.h"

@implementation OSPFont

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

@end
