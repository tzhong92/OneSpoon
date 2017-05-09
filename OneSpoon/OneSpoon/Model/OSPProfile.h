//
//  OSPProfile.h
//  OneSpoon
//
//  Created by tzh_mac on 5/2/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OSPProfile : NSObject

@property(nonatomic) NSString *name;
@property(nonatomic) NSString *location;
@property(nonatomic) NSString *education;
@property(nonatomic) NSString *workExperience;
@property(nonatomic) NSString *characterLabel;
@property(nonatomic) NSString *introduction;

@property(nonatomic) NSInteger age;
@property(nonatomic) NSInteger height;

// ???
@property(nonatomic) BOOL isLikeEachOther;

// Replace with the url in the future.
@property(nonatomic) NSString *picture;

@end
