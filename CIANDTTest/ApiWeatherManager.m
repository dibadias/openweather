//
//  ApiWeatherManager.m
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import "ApiWeatherManager.h"

@implementation ApiWeatherManager

// CONSTANTS
NSString * const BASE_URL  = @"http://api.openweathermap.org/data/2.5/weather";
NSString * const API_ID    = @"&APPID=24c53ed0e57768f8be860881fc931b39";

// API PARAMS
static NSString * const USER_WEATHER_PARAM = @"?lat=%@&lon=%@&units=metric&&lang=pt";
static NSString * const CITY_WEATHER_PARAM = @"?id=%@&units=metric&lang=pt";
static NSString * const LONDON_CODE        = @"2643741";

//Singleton Method
+ (ApiWeatherManager *)sharedInstance {
    static ApiWeatherManager *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super initWithBaseURL: [NSURL URLWithString: BASE_URL]];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer  = [AFJSONRequestSerializer serializer];
    }
    return self;
}

- (void)getWeatherByUserLocationWithLatidute:(NSString *)lat andLongitude:(NSString *)longitude
                        completion:(void (^)(Weather *weather)) completion
                     errorCallback:(void (^)(NSError *error)) errorCallback {
    
    NSString *getParams = [NSString stringWithFormat:USER_WEATHER_PARAM, lat, longitude];
    NSString *url       = [NSString stringWithFormat:@"%@%@%@",self.baseURL, getParams, API_ID];
    
    [self GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSError *error;
        Weather *weather = [MTLJSONAdapter modelOfClass:[Weather class] fromJSONDictionary:responseObject error:&error];
        completion(weather);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorCallback(error);
    }];
}

- (void)getLondonWeatherWithCompletion:(void (^)(Weather *weater)) completion
                         errorCallback:(void (^)(NSError *error)) errorCallback {

    NSString *getParams = [NSString stringWithFormat:CITY_WEATHER_PARAM, LONDON_CODE];
    NSString *url       = [NSString stringWithFormat:@"%@%@%@",self.baseURL, getParams, API_ID];
    
    [self GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSError *error;
        Weather *weather = [MTLJSONAdapter modelOfClass:[Weather class] fromJSONDictionary:responseObject error:&error];
        completion(weather);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorCallback(error);
    }];
}


@end
