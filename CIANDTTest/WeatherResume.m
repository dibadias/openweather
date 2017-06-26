//
//  Weather.m
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import "WeatherResume.h"

@implementation WeatherResume

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identifier"         : @"id",
             @"main"               : @"main",
             @"weatherDescription" : @"description",
             @"icon"               : @"icon"
             };
}

@end
