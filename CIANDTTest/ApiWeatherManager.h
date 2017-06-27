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


/**
 Get Weather by the user location

 @param lat latitude of the location
 @param longitude longitude of the location
 @param completion success block
 @param errorCallback error block
 */
- (void)getWeatherByUserLocationWithLatidute:(NSString *)lat andLongitude:(NSString *)longitude
                                  completion:(void (^)(Weather *weater)) completion
                               errorCallback:(void (^)(NSError *error)) errorCallback;


/**
 Get the weater based on a city (in this case, London)

 @param completion success block callback
 @param errorCallback error block callback
 */
- (void)getLondonWeatherWithCompletion:(void (^)(Weather *weater)) completion
                               errorCallback:(void (^)(NSError *error)) errorCallback;


@end
