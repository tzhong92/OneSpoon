//
//  OSPProfileView.h
//  OneSpoon
//
//  Created by tzh_mac on 5/9/17.
//  Copyright © 2017 OneSpoon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OSPProfile.h"

@protocol OSPProfileViewDelegate <NSObject>

- (void)tapEditButton;

@end

@interface OSPProfileView : UIView

- (instancetype)initWithProfile:(OSPProfile *)profile delegate:(id<OSPProfileViewDelegate>)delegate;

@end
