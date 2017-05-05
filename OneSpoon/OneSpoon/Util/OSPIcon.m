//
//  OSPIcon.m
//  OneSpoon
//
//  Created by tzh_mac on 5/4/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPIcon.h"

@implementation OSPIcon

+ (UIImage *)iconWithName:(NSString *)name withColor:(UIColor *)color {
  UIImage *icon = [UIImage imageNamed:name];
  return [self blendImage:icon withColor:color];
}

+ (UIImage *)blendImage:(UIImage *)image withColor:(UIColor *)color {
  CGSize size = [image size];
  CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
  
  UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetShouldAntialias(context, true);
  CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
  
  CGContextScaleCTM(context, 1, -1);
  CGContextTranslateCTM(context, 0, -rect.size.height);
  
  CGContextDrawImage(context, rect, image.CGImage);
  CGContextSetBlendMode(context, kCGBlendModeSourceIn);
  CGContextSetFillColorWithColor(context, color.CGColor);
  CGContextFillRect(context, rect);
  
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  if (!UIEdgeInsetsEqualToEdgeInsets(image.capInsets, UIEdgeInsetsZero)) {
    newImage = [newImage resizableImageWithCapInsets:image.capInsets];
  }
  
  return newImage;
}

@end
