//
//  UserManager.m
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import "LoginManager.h"
#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@implementation LoginManager

static LoginManager *loginManager;
static dispatch_once_t onceUserManager;

+ (LoginManager *)sharedInstance {
    dispatch_once(&onceUserManager, ^{
        loginManager = [[self alloc] init];
    });
    return loginManager;
}

- (void)checkLogin{
    
    NSString *storyBoardName;
    NSString *viewControllerIdentifier;
    
    if ([FBSDKAccessToken currentAccessToken]) {
        if (!self.userId) {
            [self updateFacebookProfile];
        }
        storyBoardName           = @"Main";
        viewControllerIdentifier = @"MainTabbarID";
    } else {
        storyBoardName           = @"Login";
        viewControllerIdentifier = @"LoginViewControllerIdentifier";
    }
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate openStoryboardScene:storyBoardName andViewControllerIdentifier:viewControllerIdentifier];
}

- (void)setUpUserInfo:(NSDictionary *)userDict  {
    if (userDict[@"id"]) {
        self.userId = userDict[@"id"];
    }
    
    if (userDict[@"name"]) {
        self.userName = userDict[@"name"];
    }
    
    if (userDict[@"picture"][@"data"][@"url"]) {
        
        NSURL *url = [[NSURL alloc] initWithString: userDict[@"picture"][@"data"][@"url"]];
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
        self.profilePhoto = [[UIImage alloc] initWithData:imageData];
    }

    [self checkLogin];
}

- (void)logoutAndClearUser {
    
    FBSDKLoginManager *loginFBManager = [[FBSDKLoginManager alloc] init];
    loginFBManager.logOut;

    self.userName     = nil;
    self.userId       = nil;
    self.profilePhoto = nil;
    
    [self checkLogin];
}

-(void)updateFacebookProfile {
    
        NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys: @"id, email, name, picture.type(large)", @"fields", nil];
        
        FBSDKGraphRequest *graphRequest = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters];
        
        [graphRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            } else {
                NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:result];
                [LoginManager.sharedInstance setUpUserInfo:dict];
            }
        }];
}

@end
