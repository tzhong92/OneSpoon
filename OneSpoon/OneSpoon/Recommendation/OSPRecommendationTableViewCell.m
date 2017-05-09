//
//  OSPRecommendationTableViewCell.m
//  OneSpoon
//
//  Created by tzh_mac on 5/2/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPRecommendationTableViewCell.h"

#import "OSPColor.h"
#import "OSPRecommendationCardView.h"

static const CGFloat kCardViewMarginVertical = 4.0;
static const CGFloat kCardViewMarginHorizontal = 1.0;

@implementation OSPRecommendationTableViewCell {
  OSPProfile *_profile;
  OSPRecommendationCardView *_cardView;
}

- (instancetype)initWithProfile:(OSPProfile *)profile {
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
  if (self) {
    _profile = profile;
    
    self.backgroundColor = [OSPColor screenBackgroundColor];
    
    _cardView = [[OSPRecommendationCardView alloc] initWithProfile:profile];
    _cardView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_cardView];
    
    [self createConstraints];
  }
  return self;
}

# pragma mark - Private

- (void)createConstraints {
  NSDictionary<NSString *, id> *metricsDictionary = @{
    @"kCardViewMarginHorizontal" : @(kCardViewMarginHorizontal),
    @"kCardViewMarginVertical" : @(kCardViewMarginVertical)
  };
  NSDictionary<NSString *, id> *viewsDictionary = NSDictionaryOfVariableBindings(_cardView);
  NSArray<NSString *> *formatStrings = @[
    @"V:|-(kCardViewMarginVertical)-[_cardView]-(kCardViewMarginVertical)-|",
    @"H:|-(kCardViewMarginHorizontal)-[_cardView]-(kCardViewMarginHorizontal)-|"
  ];
  for (NSString *formatString in formatStrings) {
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:formatString
                                                                 options:0
                                                                 metrics:metricsDictionary
                                                                   views:viewsDictionary]];
  }
}

@end
