//
//  Beacon.m
//  iBeaconDetector
//
//  Created by Sergio Garcia on 21/12/15.
//  Copyright © 2015 Sergio Garcia. All rights reserved.
//

#import "Beacon.h"

@implementation Beacon

- (instancetype)initWithMajor:(NSUInteger)major
                        minor:(NSUInteger)minor
                     location:(Location *)location
{
    if (self = [super init]) {
        _major = major;
        _minor = minor;
        _location = location;
    }
    return self;
}

- (BOOL)isEqualToBeacon:(Beacon *)beacon
{
    return beacon && beacon.major == self.major && beacon.minor == self.minor;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Minor: %ld, Major: %ld",
            (long)self.minor, (long)self.major];
}

@end
