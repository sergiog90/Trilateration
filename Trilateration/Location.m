//
//  Location.m
//  iBeaconDetector
//
//  Created by Sergio Garcia on 21/12/15.
//  Copyright © 2015 Sergio Garcia. All rights reserved.
//

#import "Location.h"

@implementation Location

- (instancetype)initWithCoordinates:(CLLocationCoordinate2D)coordinates
                           altitude:(CLLocationDistance)altitude
{
    if (self = [super init]) {
        _coordinates = coordinates;
        _altitude = altitude;
    }
    return self;
}

@end