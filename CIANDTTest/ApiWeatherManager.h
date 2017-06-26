//
//  ApiWeatherManager.h
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import "Weather.h"

static NSString * const ICONS_URL = @"http://openweathermap.org/img/w/%@.png";

@interface ApiWeatherManager : AFHTTPSessionManager

+ (ApiWeatherManager *)sharedInstance;

- (void)getWeatherByUserLocationWithLatidute:(NSString *)lat andLongitude:(NSString *)longitude
                                  completion:(void (^)(Weather *weater)) completion
                               errorCallback:(void (^)(NSError *error)) errorCallback;

- (void)getLondonWeatherWithCompletion:(void (^)(Weather *weater)) completion
                               errorCallback:(void (^)(NSError *error)) errorCallback;


@end
