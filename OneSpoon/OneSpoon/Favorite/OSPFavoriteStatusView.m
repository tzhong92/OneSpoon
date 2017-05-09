//
//  OSPFavoriteStatusButton.m
//  OneSpoon
//
//  Created by tzh_mac on 5/8/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPFavoriteStatusView.h"

#import "OSPColor.h"
#import "OSPIcon.h"
#import "OSPFont.h"

@implementation OSPFavoriteStatusView {
  UIImageView *_heartImageView;
  UILabel *_textLabel;
}

- (instancetype)initWithStatus:(BOOL)status {
  self = [super initWithFrame:CGRectZero];
  if (self) {
    _textLabel = [[UILabel alloc] init];
    _textLabel.font = [OSPFont favoriteStatusFont];
    _textLabel.textColor = [UIColor redColor];
    _textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_textLabel];
    
    // Like each other
    if (status) {
      UIImage *solidHeartIcon = [OSPIcon iconWithName:@"ic_heart_solid" withColor:[UIColor redColor]];
      _heartImageView = [[UIImageView alloc] initWithImage:solidHeartIcon];
      _heartImageView.translatesAutoresizingMaskIntoConstraints = NO;
      [self addSubview:_heartImageView];
      
      _textLabel.text = @"马上联系";
    } else {
      UIImage *outlineHeartIcon = [OSPIcon iconWithName:@"ic_heart" withColor:[UIColor redColor]];
      _heartImageView = [[UIImageView alloc] initWithImage:outlineHeartIcon];
      _heartImageView.translatesAutoresizingMaskIntoConstraints = NO;
      [self addSubview:_heartImageView];
      
      _textLabel.text = @"等待回复";
    }
    
    [self createConstraints];
  }
  return self;
}

- (void)createConstraints {
  NSDictionary<NSString *, id> *metricsDictionary = @{};
  NSDictionary<NSString *, id> *viewsDictionary = NSDictionaryOfVariableBindings(
    _heartImageView,
    _textLabel
  );
  NSArray<NSString *> *formatStrings = @[
    @"V:|[_heartImageView(==24)]|",
    @"H:|[_heartImageView(==24)]",
    @"H:[_textLabel]|"
  ];
  for (NSString *formatString in formatStrings) {
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:formatString
                                                                                    options:0
                                                                                    metrics:metricsDictionary
                                                                                      views:viewsDictionary]];
  }
  NSLayoutConstraint *centerConstraint = [NSLayoutConstraint constraintWithItem:_heartImageView
                                                                      attribute:NSLayoutAttributeCenterY
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:_textLabel
                                                                      attribute:NSLayoutAttributeCenterY
                                                                     multiplier:1
                                                                       constant:0];
  [NSLayoutConstraint activateConstraints:@[centerConstraint]];
}

@end
