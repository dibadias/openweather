//
//  LoginViewController.h
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 23/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "LoginManager.h"

@interface LoginViewController : UIViewController <FBSDKLoginButtonDelegate>

@property IBOutlet FBSDKLoginButton *facebookLoginView;
@property IBOutlet UIActivityIndicatorView *activityIndicator;


@end
