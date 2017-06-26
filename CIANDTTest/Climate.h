//
//  Climate.h
//  CIANDTTest
//
//  Created by Diego Batista Dias Leite on 25/06/17.
//  Copyright © 2017 Diego Batista Dias Leite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Climate : MTLModel <MTLJSONSerializing>

@property NSNumber *temperature;
@property NSNumber *pressure;
@property NSNumber *humidity;
@property NSNumber *tempMin;
@property NSNumber *tempMax;

@end
