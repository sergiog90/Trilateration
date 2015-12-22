//
//  Beacon.h
//  
//
//  Created by Sergio Garcia on 21/12/15.
//  Copyright © 2015 Sergio Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "Location.h"
#import "Beacon.h"

@interface Beacon : NSObject

@property (assign, nonatomic) NSUInteger major;
@property (assign, nonatomic) NSUInteger minor;
@property (strong, nonatomic) Location *location;

- (instancetype)initWithMajor:(NSUInteger)major
                        minor:(NSUInteger)minor
                     location:(Location *)location;

- (BOOL)isEqualToBeacon:(Beacon *)beacon;

@end
