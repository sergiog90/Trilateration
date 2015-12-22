//
//  Trilateration.h
//  
//
//  Created by Sergio Garcia on 21/12/15.
//  Copyright © 2015 Sergio Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "Emission.h"
#import "Location.h"

@interface Trilateration : NSObject

+ (void)trilaterate:(NSArray<Emission *> *)transmissions
            success:(void (^)(Location *location))success
            failure:(void (^)(NSError *error))failure;

@end