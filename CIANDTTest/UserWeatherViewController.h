//
//  UserWeatherViewController.h
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 23/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "WeatherViewController.h"

@interface UserWeatherViewController : WeatherViewController <CLLocationManagerDelegate>

- (void)touchLogoutButton;

@end
