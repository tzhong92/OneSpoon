//
//  OSPRecommendationViewController.m
//  OneSpoon
//
//  Created by tzh_mac on 4/17/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import "OSPRecommendationViewController.h"

#import "OSPColor.h"
#import "OSPProfile.h"
#import "OSPRecommendationTableViewCell.h"

static const CGFloat statusBarHeight = 20.0;
static const CGFloat navigationBarHeight = 44.0;
static const CGFloat tabBarHeight = 49.0;

@interface OSPRecommendationViewController ()

@end

@implementation OSPRecommendationViewController {
  NSArray<OSPProfile *> *_recommendedProfiles;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    // Set up navigation bar title.
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"推荐·一勺";
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    
    // Set up default data
    [self setUpDefaultData];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [OSPColor screenBackgroundColor];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_recommendedProfiles count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  OSPProfile *profile = _recommendedProfiles[indexPath.row];
  return [[OSPRecommendationTableViewCell alloc] initWithProfile:profile];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
  return screenHeight - statusBarHeight - navigationBarHeight - tabBarHeight;
}

#pragma mark - Private

- (void)setUpDefaultData {
  NSMutableArray *profiles = [NSMutableArray array];
  OSPProfile *profile1 = [[OSPProfile alloc] init];
  profile1.name = @"Jenny Z.";
  profile1.location = @"北京";
  profile1.education = @"斯坦福大学 · 北京大学";
  profile1.workExperience = @"商业分析师 @ 麦肯锡咨询";
  profile1.characterLabel = @"文艺女青年 · 逗比 · 厨艺超群";
  profile1.introduction = @"容易害羞喜欢安静的我，其实有最疯狂浪漫的一面";
  profile1.age = 25;
  profile1.height = 162;
  profile1.picture = @"Jenny";
  profile1.like = false;
  [profiles addObject:profile1];
  
  OSPProfile *profile2 = [[OSPProfile alloc] init];
  profile2.name = @"Yuanyuan G.";
  profile2.location = @"北京";
  profile2.education = @"中央戏剧学院";
  profile2.workExperience = @"教师 @ 北京电影学院";
  profile2.characterLabel = @"文艺女青年 · 女神 · 厨艺超群";
  profile2.introduction = @"体验派初心撑不住表现派外形，七分清丽拂不去三分演技";
  profile2.age = 29;
  profile2.height = 168;
  profile2.picture = @"Yuanyuan";
  profile2.like = true;
  [profiles addObject:profile2];
  
  OSPProfile *profile3 = [[OSPProfile alloc] init];
  profile3.name = @"Eddie W.";
  profile3.location = @"台北";
  profile3.education = @"加拿大英属哥伦比亚大学";
  profile3.workExperience = @"MD @ 摩根斯坦利";
  profile3.characterLabel = @"文艺宅 · 健身狂魔 · 阳光暖男";
  profile3.introduction = @"很敬业，对自己也够狠，对爱人够宠溺";
  profile3.age = 32;
  profile3.height = 185;
  profile3.picture = @"Eddie";
  profile3.like = true;
  [profiles addObject:profile3];
  
  _recommendedProfiles = [NSArray arrayWithArray:profiles];
}

@end
