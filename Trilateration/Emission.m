//
//  Transmission.m
//  
//
//  Created by Sergio Garcia on 21/12/15.
//  Copyright © 2015 Sergio Garcia. All rights reserved.
//

#import "Emission.h"

@implementation Emission

- (instancetype)initWithBeacon:(Beacon *)beacon
                     timestamp:(NSDate *)timestamp
                          rssi:(NSInteger)rssi
                      accuracy:(CGFloat)accuracy
{
    if (self = [super init]) {
        _beacon = beacon;
        _timestamp = timestamp;
        _rssi = rssi;
        _accuracy = (accuracy < 0) ? 0 : accuracy;
    }
    
    return self;
}

- (NSString *)description
{
    
    
    NSString *dateString = [NSDateFormatter localizedStringFromDate:self.timestamp
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterMediumStyle];
    return [NSString stringWithFormat:@"Beacon: %@, Timestamp: %@, RSSI: %ld, Accuracy: %f",
            self.beacon, dateString, (long)self.rssi, self.accuracy];
}

@end
