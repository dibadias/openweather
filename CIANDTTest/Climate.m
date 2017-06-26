//
//  Climate.m
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import "Climate.h"

@implementation Climate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"temperature" : @"temp",
             @"pressure"    : @"pressure",
             @"humidity"    : @"humidity",
             @"tempMin"     : @"temp_min",
             @"tempMax"     : @"temp_max",
             };
}

@end
