//
//  OSPFavoriteTableViewCell.m
//  OneSpoon
//
//  Created by tzh_mac on 5/7/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPFavoriteTableViewCell.h"

#import "OSPColor.h"
#import "OSPFavoriteStatusView.h"
#import "OSPFont.h"

@implementation OSPFavoriteTableViewCell {
  OSPProfile *_profile;
  UIImageView *_photoImageView;
  UILabel *_nameLabel;
  UILabel *_bioInfoLabel;
  UILabel *_professionLabel;
  OSPFavoriteStatusView *_statusButton; // Could be UIImage and UILabel, but maybe touchable in the future.
}

- (instancetype)initWithProfile:(OSPProfile *)profile {
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
  if (self) {
    _profile = profile;
    
    _photoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:profile.picture]];
    _photoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_photoImageView];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.text = profile.name;
    _nameLabel.font = [OSPFont favoriteNameFont];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_nameLabel];
    
    _bioInfoLabel = [[UILabel alloc] init];
    NSString *bioText =
    [NSString stringWithFormat:@"%ld · %@ · %ldcm", (long)profile.age, profile.location, (long)profile.height];
    _bioInfoLabel.text = bioText;
    _bioInfoLabel.font = [OSPFont favoriteBioInfoFont];
    _bioInfoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_bioInfoLabel];
    
    _professionLabel = [[UILabel alloc] init];
    _professionLabel.text = _profile.education;
    _professionLabel.font = [OSPFont favoriteProfessionFont];
    _professionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_professionLabel];
    
    _statusButton = [[OSPFavoriteStatusView alloc] initWithStatus:_profile.isLikeEachOther];
    _statusButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_statusButton];
    
    [self createConstraints];
  }
  return self;
}

#pragma mark - Private

- (void)createConstraints {
  NSDictionary<NSString *, id> *metricsDictionary = @{};
  NSDictionary<NSString *, id> *viewsDictionary = NSDictionaryOfVariableBindings(
    _photoImageView,
    _nameLabel,
    _bioInfoLabel,
    _professionLabel,
    _statusButton
  );
  NSArray<NSString *> *formatStrings = @[
                                         @"V:|-(8)-[_photoImageView(==60)]-(8)-|",
                                         @"V:|-(8)-[_statusButton(==24)]",
                                         @"V:|-(8)-[_nameLabel]-(10)-[_bioInfoLabel]-(5)-[_professionLabel]",
                                         @"H:|-(30)-[_photoImageView(==60)]-(20)-[_nameLabel]",
                                         @"H:[_photoImageView]-(20)-[_bioInfoLabel]",
                                         @"H:[_photoImageView]-(20)-[_professionLabel]",
                                         @"H:[_statusButton(==72)]-(16)-|"
                                         ];
  for (NSString *formatString in formatStrings) {
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:formatString
                                                                                    options:0
                                                                                    metrics:metricsDictionary
                                                                                      views:viewsDictionary]];
  }
}

@end
