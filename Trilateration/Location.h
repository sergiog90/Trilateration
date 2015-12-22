//
//  Location.h
//  iBeaconDetector
//
//  Created by Sergio Garcia on 21/12/15.
//  Copyright © 2015 Sergio Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Location : NSObject

@property (assign, nonatomic) CLLocationCoordinate2D coordinates;
@property (assign, nonatomic) CLLocationDistance altitude;

- (instancetype)initWithCoordinates:(CLLocationCoordinate2D)coordinates
                        altitude:(CLLocationDistance)altitude;
@end
