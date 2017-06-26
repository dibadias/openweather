//
//  Weather.h
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import <Mantle/MTLJSONAdapter.h>
#import "WeatherResume.h"
#import "Climate.h"

@interface Weather : MTLModel <MTLJSONSerializing>

@property NSNumber      *identifier;
@property NSString      *name;
@property NSArray <WeatherResume*> *weatherResume;
@property Climate       *climate;

@end
