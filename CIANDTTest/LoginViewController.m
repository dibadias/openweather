//
//  LoginViewController.m
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 23/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController () <FBSDKLoginButtonDelegate>

@end

@implementation LoginViewController


#pragma mark Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureFacebook];
    
    self.activityIndicator.hidesWhenStopped = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Helpers
- (void)configureFacebook {
    self.facebookLoginView = [[FBSDKLoginButton alloc] init];
    self.facebookLoginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.facebookLoginView.delegate = self;
    
}

#pragma mark Facebook Delegates

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    if (error) {
        //Melhorar
        NSLog(@"Error! : %@", error.localizedDescription);
        return;
    } else if (result.isCancelled) {
        //Melhorar
        NSLog(@"User cancel login");
        return;
    } else {
        [self completFacebookLogin];
    }
}

- (BOOL)loginButtonWillLogin:(FBSDKLoginButton *)loginButton {
    NSLog(@"WillLogin");
    [self.activityIndicator startAnimating];
    return true;
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    NSLog(@"ButtonDidLogout");
}

-(void)completFacebookLogin {
    
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys: @"id, email, name, picture.type(large)", @"fields", nil];
    
    FBSDKGraphRequest *graphRequest = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters];
    
    [graphRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        [self.activityIndicator stopAnimating];
        if (error) {
            //Melhorar
            NSLog(@"%@",error);
        } else {
            NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:result];
            [LoginManager.sharedInstance setUpUserInfo:dict];
            [self.view removeFromSuperview];
        }
    }];
}

@end
