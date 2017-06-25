//
//  UserWeatherViewController.m
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 23/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import "UserWeatherViewController.h"
#import "AppDelegate.h"
#import "LoginManager.h"

@interface UserWeatherViewController ()

@end

@implementation UserWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [LoginManager.sharedInstance userName];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark IBActions
- (IBAction)touchLogoutButton:(id)sender {
    [LoginManager.sharedInstance logoutAndClearUser];
    [self.view removeFromSuperview];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
