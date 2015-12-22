//
//  Transmission.h
//  
//
//  Created by Sergio Garcia on 21/12/15.
//  Copyright © 2015 Sergio Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "Beacon.h"

@interface Emission : NSObject

@property (strong, nonatomic) Beacon *beacon;
@property (strong, nonatomic) NSDate *timestamp;
@property (assign, nonatomic) NSInteger rssi;
@property (assign, nonatomic) CGFloat accuracy;

- (instancetype)initWithBeacon:(Beacon *)beacon
                     timestamp:(NSDate *)timestamp
                          rssi:(NSInteger)rssi
                      accuracy:(CGFloat)accuracy;

@end
