//
//  UserManager.h
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LoginManager : NSObject

+ (LoginManager *)sharedInstance;

@property NSString * userName;
@property NSString * userId;
@property UIImage  * profilePhoto;

- (void)setUpUserInfo:(NSDictionary *)userDict;
- (void)checkLogin;
- (void)logoutAndClearUser;
- (void)updateFacebookProfile;

@end
