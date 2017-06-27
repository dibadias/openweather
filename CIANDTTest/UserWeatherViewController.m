//
//  UserWeatherViewController.m
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 23/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import "UserWeatherViewController.h"
#import "LoginManager.h"
#import "ApiWeatherManager.h"
#import "Weather.h"
#import "UIImageView+AFNetworking.h"
#import <QuartzCore/QuartzCore.h>

@interface UserWeatherViewController ()

@property CLLocationManager * locationManager;

@end

@implementation UserWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"MyWeather", nil);

    UIButton *profileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    profileButton.frame = CGRectMake(0, 0, 30, 30);
    [profileButton setImage:[LoginManager.sharedInstance profilePhoto] forState:UIControlStateNormal];
    profileButton.layer.masksToBounds = NO;
    profileButton.clipsToBounds = YES;
    profileButton.layer.cornerRadius = 15;
    [profileButton addTarget:self action:@selector(touchLogoutButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:profileButton];
    [self.navigationItem setRightBarButtonItems:@[barButton]];
}

- (void)viewWillAppear:(BOOL)animated {
    [self getUserLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark CLLocationManager
-(void)getUserLocation {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    if (([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]))
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    
    [self.locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation* location = [locations lastObject];
    [self.locationManager stopUpdatingLocation];
    [self getApiRequestWithLocation:location];
}

#pragma mark API

-(void)getApiRequestWithLocation:(CLLocation *)location {
    NSString *latitude = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f", location.coordinate.longitude];

    __weak UserWeatherViewController *weakSelf = self;

    [self.activityIndicator startAnimating];
    [ApiWeatherManager.sharedInstance getWeatherByUserLocationWithLatidute:latitude andLongitude:longitude completion:^(Weather *weather) {
        [weakSelf.activityIndicator stopAnimating];
        [weakSelf updateUI:weather];
    } errorCallback:^(NSError *error) {
        [weakSelf showAlertWithTitle:NSLocalizedString(@"Ops", nil) andMessage:NSLocalizedString(@"ConnectionError", nil)];
        [weakSelf.activityIndicator stopAnimating];
    }];
}

#pragma mark IBActions
- (void)touchLogoutButton {

    NSString *message = [NSString stringWithFormat: NSLocalizedString(@"LogoutMessage", @""), [LoginManager.sharedInstance userName]];
    
    UIAlertController * alertController = [UIAlertController
                                 alertControllerWithTitle:NSLocalizedString(@"Logout", @"")
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* confirmButton = [UIAlertAction
                                actionWithTitle:NSLocalizedString(@"Logout", @"")
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    [LoginManager.sharedInstance logoutAndClearUser];
                                    [self.view removeFromSuperview];
                                }];
    
    UIAlertAction* cancelButton = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Cancel", @"")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action){}];
    
    [alertController addAction:confirmButton];
    [alertController addAction:cancelButton];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
