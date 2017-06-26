//
//  Weather.m
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import "Weather.h"
@implementation Weather 

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identifier"    : @"id",
             @"climate"       : @"main",
             @"weatherResume" : @"weather",
             @"name"          : @"name"
             };
}

+ (NSValueTransformer *)climateJSONTransformer {
    return [MTLValueTransformer mtl_JSONDictionaryTransformerWithModelClass:Climate.class];
}

+ (NSValueTransformer *)weatherResumeJSONTransformer {
    return [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:WeatherResume.class];
}


@end
