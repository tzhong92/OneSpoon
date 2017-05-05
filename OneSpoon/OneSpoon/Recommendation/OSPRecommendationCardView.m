//
//  OSPRecommendationCardView.m
//  OneSpoon
//
//  Created by tzh_mac on 5/3/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPRecommendationCardView.h"

#import "OSPColor.h"
#import "OSPFont.h"
#import "OSPIcon.h"

static const CGFloat kCardViewMarginHorizontal = 1.0;
static const CGFloat kImageViewMarginHorizontal = 20.0;
static const CGFloat kImageViewMarginVertical = 5.0;
static const CGFloat kNameMarginTop = 10.0;
static const CGFloat kNameMarginBottom = 3.0;
static const CGFloat kBioInfoMarginBottom = 15.0;
static const CGFloat kInfoLabelMarginVertical = 3.0;
static const CGFloat kTitleLabelMarginLeft = 60.0;
static const CGFloat kTitleLabelMarginRight = 10.0;
static const CGFloat kChooseButtonSize = 30.0;

@implementation OSPRecommendationCardView {
  OSPProfile *_profile;
  UIImageView *_photoImageView;
  UIImageView *_favoriteIcon;
  UIImageView *_passIcon;
  UILabel *_nameLabel;
  UILabel *_bioInfoLabel;
  UILabel *_educationTitleLabel;
  UILabel *_educationLabel;
  UILabel *_workTitleLabel;
  UILabel *_workExperienceLabel;
  UILabel *_charactorTitleLabel;
  UILabel *_charactorLabel;
  UILabel *_introductionTitleLabel;
  UILabel *_introductionLabel;
}

- (instancetype)initWithProfile:(OSPProfile *)profile {
  self = [super initWithFrame:CGRectZero];
  if (self) {
    self.backgroundColor = [UIColor whiteColor];
    
    // Set up shadow
    [self.layer setCornerRadius:0.0f];
    [self.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.layer setBorderWidth:0.5f];
    [self.layer setShadowColor:[UIColor grayColor].CGColor];
    [self.layer setShadowOpacity:1.0];
    [self.layer setShadowRadius:0.0];
    [self.layer setShadowOffset:CGSizeZero];
    
    // init with profile
    _profile = profile;
    
    _photoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:profile.picture]];
    _photoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_photoImageView];
    
    UIImage *favoriteIconImage = [OSPIcon iconWithName:@"ic_favorite" withColor:[UIColor redColor]];
    _favoriteIcon = [[UIImageView alloc] initWithImage:favoriteIconImage];
    _favoriteIcon.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_favoriteIcon];
    
    UIImage *passIconImage = [OSPIcon iconWithName:@"ic_clear" withColor:[OSPColor cardViewPassIconColor]];
    _passIcon = [[UIImageView alloc] initWithImage:passIconImage];
    _passIcon.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_passIcon];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.text = profile.name;
    _nameLabel.font = [OSPFont cardNameFont];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_nameLabel];
    
    _bioInfoLabel = [[UILabel alloc] init];
    NSString *bioText =
        [NSString stringWithFormat:@"%ld · %@ · %ldcm", (long)profile.age, profile.location, (long)profile.height];
    _bioInfoLabel.text = bioText;
    _bioInfoLabel.font = [OSPFont cardBioInfoFont];
    _bioInfoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_bioInfoLabel];
    
    _educationTitleLabel = [self titleLabelWithTitle:@"教育背景"];
    [self addSubview:_educationTitleLabel];
    _educationLabel = [self infoLabelWithInformation:profile.education];
    [self addSubview:_educationLabel];
    
    _workTitleLabel = [self titleLabelWithTitle:@"职业背景"];
    [self addSubview:_workTitleLabel];
    _workExperienceLabel = [self infoLabelWithInformation:profile.workExperience];
    [self addSubview:_workExperienceLabel];
    
    _charactorTitleLabel = [self titleLabelWithTitle:@"个性标签"];
    [self addSubview:_charactorTitleLabel];
    _charactorLabel = [self infoLabelWithInformation:profile.characterLabel];
    [self addSubview:_charactorLabel];
    
    _introductionTitleLabel = [self titleLabelWithTitle:@"自我介绍"];
    [self addSubview:_introductionTitleLabel];
    _introductionLabel = [self infoLabelWithInformation:profile.introduction];
    _introductionLabel.numberOfLines = 0;
    [self addSubview:_introductionLabel];
    
    [self createConstraints];
  }
  return self;
}

# pragma mark - Private

- (UILabel *)titleLabelWithTitle:(NSString *)title {
  UILabel *label = [[UILabel alloc] init];
  label.text = title;
  label.font = [OSPFont cardInfoTitleFont];
  label.translatesAutoresizingMaskIntoConstraints = NO;
  return label;
}

- (UILabel *)infoLabelWithInformation:(NSString *)content {
  UILabel *label = [[UILabel alloc] init];
  label.text = content;
  label.font = [OSPFont cardInfoFont];
  label.translatesAutoresizingMaskIntoConstraints = NO;
  return label;
}

- (void)createConstraints {
  CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
  CGFloat cardViewWidth = screenWidth - 2 * kCardViewMarginHorizontal;
  CGFloat imageViewSize = cardViewWidth - 2 * kImageViewMarginHorizontal;
  NSDictionary<NSString *, id> *metricsDictionary = @{
    @"kImageViewMarginHorizontal" : @(kImageViewMarginHorizontal),
    @"kImageViewMarginVertical" : @(kImageViewMarginVertical),
    @"imageViewSize" : @(imageViewSize),
    @"kNameMarginTop" : @(kNameMarginTop),
    @"kNameMarginBottom" : @(kNameMarginBottom),
    @"kBioInfoMarginBottom" : @(kBioInfoMarginBottom),
    @"kInfoLabelMarginVertical" : @(kInfoLabelMarginVertical),
    @"kTitleLabelMarginLeft" : @(kTitleLabelMarginLeft),
    @"kTitleLabelMarginRight" : @(kTitleLabelMarginRight),
    @"kChooseButtonSize" : @(kChooseButtonSize),
  };
  NSDictionary<NSString *, id> *viewsDictionary = NSDictionaryOfVariableBindings(
    _photoImageView,
    _favoriteIcon,
    _passIcon,
    _nameLabel,
    _bioInfoLabel,
    _educationTitleLabel,
    _educationLabel,
    _workTitleLabel,
    _workExperienceLabel,
    _charactorTitleLabel,
    _charactorLabel,
    _introductionTitleLabel,
    _introductionLabel
  );
  NSArray<NSString *> *formatStrings = @[
    @"V:|-(kImageViewMarginVertical)-[_photoImageView(==imageViewSize)]-(kNameMarginTop)-[_nameLabel]",
    @"V:[_nameLabel]-(kNameMarginBottom)-[_bioInfoLabel]",
    @"V:[_bioInfoLabel]-(kBioInfoMarginBottom)-[_educationTitleLabel]-(kInfoLabelMarginVertical)-[_workTitleLabel]",
    @"V:[_workTitleLabel]-(kInfoLabelMarginVertical)-[_charactorTitleLabel]-(kInfoLabelMarginVertical)-[_introductionTitleLabel]",
    @"V:[_bioInfoLabel]-(kBioInfoMarginBottom)-[_educationLabel]-(kInfoLabelMarginVertical)-[_workExperienceLabel]",
    @"V:[_workExperienceLabel]-(kInfoLabelMarginVertical)-[_charactorLabel]-(kInfoLabelMarginVertical)-[_introductionLabel]",
    @"V:[_photoImageView]-(kNameMarginTop)-[_passIcon(==kChooseButtonSize)]",
    @"V:[_photoImageView]-(kNameMarginTop)-[_favoriteIcon(==kChooseButtonSize)]",
    @"H:|-(kImageViewMarginHorizontal)-[_photoImageView]-(kImageViewMarginHorizontal)-|",
    @"H:|-(kTitleLabelMarginLeft)-[_educationTitleLabel]-(kTitleLabelMarginRight)-[_educationLabel]",
    @"H:|-(kTitleLabelMarginLeft)-[_workTitleLabel]-(kTitleLabelMarginRight)-[_workExperienceLabel]",
    @"H:|-(kTitleLabelMarginLeft)-[_charactorTitleLabel]-(kTitleLabelMarginRight)-[_charactorLabel]",
    @"H:|-(kTitleLabelMarginLeft)-[_introductionTitleLabel]-(kTitleLabelMarginRight)-[_introductionLabel(<=150)]",
    @"H:|-(kImageViewMarginHorizontal)-[_passIcon(==kChooseButtonSize)]",
    @"H:[_favoriteIcon(==kChooseButtonSize)]-(kImageViewMarginHorizontal)-|"
  ];
  for (NSString *formatString in formatStrings) {
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:formatString
                                                                                   options:0
                                                                                   metrics:metricsDictionary
                                                                                      views:viewsDictionary]];
  }
  [self makeCentralItem:_nameLabel];
  [self makeCentralItem:_bioInfoLabel];
}

- (void)makeCentralItem:(UIView *)item {
  NSLayoutConstraint *centerConstraint = [NSLayoutConstraint constraintWithItem:item
                                                                      attribute:NSLayoutAttributeCenterX
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeCenterX
                                                                     multiplier:1
                                                                       constant:0];
  [NSLayoutConstraint activateConstraints:@[centerConstraint]];
}

@end
