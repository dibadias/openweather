//
//  CityWeatherViewController.m
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 23/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import "CityWeatherViewController.h"
#import "ApiWeatherManager.h"

@interface CityWeatherViewController ()

@end

@implementation CityWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"London", nil);
}

- (void)viewWillAppear:(BOOL)animated {
    [self getApiCityWeather];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark API
-(void)getApiCityWeather {
    [self.activityIndicator startAnimating];

    __weak CityWeatherViewController *weakSelf = self;

    [ApiWeatherManager.sharedInstance getLondonWeatherWithCompletion:^(Weather *weather) {
        [weakSelf.activityIndicator stopAnimating];
        [weakSelf updateUI:weather];
    } errorCallback:^(NSError *error) {
        [weakSelf showAlertWithTitle:NSLocalizedString(@"Ops", nil) andMessage:NSLocalizedString(@"ConnectionError", nil)];
        [weakSelf.activityIndicator stopAnimating];
    }];
}

@end
