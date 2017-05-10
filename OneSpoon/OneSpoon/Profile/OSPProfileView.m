//
//  OSPProfileView.m
//  OneSpoon
//
//  Created by tzh_mac on 5/9/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPProfileView.h"

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

@implementation OSPProfileView {
  id<OSPProfileViewDelegate> _delegate;
  OSPProfile *_profile;
  UIImageView *_photoImageView;
  UIButton *_editButton;
  UIImageView *_editIcon;
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

- (instancetype)initWithProfile:(OSPProfile *)profile delegate:(id<OSPProfileViewDelegate>)delegate {
  self = [super initWithFrame:CGRectZero];
  if (self) {
    self.backgroundColor = [UIColor whiteColor];
    _delegate = delegate;
    
    // init with profile
    _profile = profile;
    
    _photoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:profile.picture]];
    _photoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_photoImageView];
    
    UIImage *editIconImage = [OSPIcon iconWithName:@"ic_pencil" withColor:[UIColor redColor]];
    _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_editButton setImage:editIconImage forState:UIControlStateNormal];
    _editButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_editButton addTarget:self action:@selector(didTapEditButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_editButton];
    
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

- (void)didTapEditButton {
  [_delegate tapEditButton];
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
    _editButton,
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
    @"V:[_photoImageView]-(kNameMarginTop)-[_editButton(==kChooseButtonSize)]",
    @"H:|-(kImageViewMarginHorizontal)-[_photoImageView]-(kImageViewMarginHorizontal)-|",
    @"H:|-(kTitleLabelMarginLeft)-[_educationTitleLabel]-(kTitleLabelMarginRight)-[_educationLabel]",
    @"H:|-(kTitleLabelMarginLeft)-[_workTitleLabel]-(kTitleLabelMarginRight)-[_workExperienceLabel]",
    @"H:|-(kTitleLabelMarginLeft)-[_charactorTitleLabel]-(kTitleLabelMarginRight)-[_charactorLabel]",
    @"H:|-(kTitleLabelMarginLeft)-[_introductionTitleLabel]-(kTitleLabelMarginRight)-[_introductionLabel(<=150)]",
    @"H:[_editButton(==kChooseButtonSize)]-(kImageViewMarginHorizontal)-|"
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
