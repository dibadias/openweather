//
//  Weather.h
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface WeatherResume : MTLModel <MTLJSONSerializing>

@property NSNumber *identifier;
@property NSString *main;
@property NSString *weatherDescription;
@property NSString *icon;

@end
