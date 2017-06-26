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
        [self showAlertWithTitle:NSLocalizedString(@"Ops", nil) andMessage:NSLocalizedString(@"FacebookError", nil)];
        NSLog(@"Error! : %@", error.localizedDescription);
        return;
    } else if (result.isCancelled) {
        return;
    } else {
        [self.activityIndicator stopAnimating];
        [self.view removeFromSuperview];
        [LoginManager.sharedInstance updateFacebookProfile];
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


-(void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                               }];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
