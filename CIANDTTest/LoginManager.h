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


/**
 Method to check if the user is logged.
 */
- (void)checkLogin;


/**
 Logout the user and clear the references
 */
- (void)logoutAndClearUser;


/**
 Update the the user profile info. Photo, name and id.
 */
- (void)updateFacebookProfile;

@end
