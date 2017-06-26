//
//  WeatherViewController.m
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import "WeatherViewController.h"
#import "Weather.h"
#import "ApiWeatherManager.h"
#import "UIImageView+AFNetworking.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UI
-(void)updateUI:(Weather *)weather {
    [self.cityName setText: weather.name];
    
    int temperature = (int)weather.climate.temperature.intValue;
    int maxTemp = (int)weather.climate.tempMax.intValue;
    int minTemp = (int)weather.climate.tempMin.intValue;

    [self.temperature setText: [NSString stringWithFormat:@"%i ºC", temperature]];
    [self.maxtemp setText:[NSString stringWithFormat:@"max %i ºC", maxTemp]];
    [self.mintemp setText:[NSString stringWithFormat:@"min %i ºC", minTemp]];
    
    WeatherResume *wResume = weather.weatherResume[0];
    self.weatherDescription.text = wResume.weatherDescription;
    
    NSString *stringImageUrl = [NSString stringWithFormat:ICONS_URL, wResume.icon];
    NSURL *url = [NSURL URLWithString:stringImageUrl];
    [self.icon setImageWithURL:url];
}

-(void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                               }];
    [alert addAction:noButton];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
