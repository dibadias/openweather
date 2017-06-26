//
//  WeatherViewController.h
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"

@interface WeatherViewController : UIViewController


@property IBOutlet UIActivityIndicatorView *activityIndicator;

@property IBOutlet UIImageView *icon;

@property IBOutlet UILabel *cityName;
@property IBOutlet UILabel *temperature;
@property IBOutlet UILabel *weatherDescription;
@property IBOutlet UILabel *maxtemp;
@property IBOutlet UILabel *mintemp;


-(void)updateUI:(Weather *)weather;
-(void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message;

@end
