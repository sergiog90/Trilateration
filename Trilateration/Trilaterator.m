//
//  Trilaterator.m
//  
//
//  Created by Sergio Garcia on 21/12/15.
//  Copyright © 2015 Sergio Garcia. All rights reserved.
//

#import "Trilaterator.h"

#define radians(angle) ((angle) / 180.0 * M_PI)
#define degrees(radians) ((radians) * (180.0 / M_PI))

@implementation Trilaterator

+ (void)trilaterate:(NSArray<Emission *> *)emissions
            success:(void (^)(Location *location))success
            failure:(void (^)(NSError *error))failure;
{
    if ([emissions count] >= 3) {
        // use always only three beacons / transmits
        Emission *emission1 = emissions[0];
        Emission *emission2 = emissions[1];
        Emission *emission3 = emissions[2];
        
        CGFloat latA = emission1.beacon.location.coordinates.latitude;
        CGFloat lonA = emission1.beacon.location.coordinates.longitude;
        CGFloat distA = emission1.accuracy;
        
        CGFloat latB = emission2.beacon.location.coordinates.latitude;
        CGFloat lonB = emission2.beacon.location.coordinates.longitude;
        CGFloat distB = emission2.accuracy;
        
        CGFloat latC = emission3.beacon.location.coordinates.latitude;
        CGFloat lonC = emission3.beacon.location.coordinates.longitude;
        CGFloat distC = emission3.accuracy;
        
        CGFloat P1[] = { lonA, latA, 0 };
        CGFloat P2[] = { lonB, latB, 0 };
        CGFloat P3[] = { lonC, latC, 0 };
        
        // ex = (P2 - P1)/(numpy.linalg.norm(P2 - P1))
        CGFloat ex[] = { 0, 0, 0 };
        CGFloat P2P1 = 0;
        
        for (NSUInteger i = 0; i < 3; i++) {
            P2P1 += pow(P2[i] - P1[i], 2);
        }
        
        for (NSUInteger i = 0; i < 3; i++) {
            ex[i] = (P2[i] - P1[i]) / sqrt(P2P1);
        }
        
        // i = dot(ex, P3 - P1)
        CGFloat p3p1[] = { 0, 0, 0 };
        
        for (NSUInteger i = 0; i < 3; i++) {
            p3p1[i] = P3[i] - P1[i];
        }
        
        CGFloat ivar = 0;
        
        for (NSUInteger i = 0; i < 3; i++) {
            ivar += (ex[i] * p3p1[i]);
        }
        
        // ey = (P3 - P1 - i*ex)/(numpy.linalg.norm(P3 - P1 - i*ex))
        CGFloat p3p1i = 0;
        
        for (NSUInteger  i = 0; i < 3; i++) {
            p3p1i += pow(P3[i] - P1[i] - ex[i] * ivar, 2);
        }
        
        CGFloat ey[] = { 0, 0, 0};
        
        for (NSUInteger i = 0; i < 3; i++) {
            ey[i] = (P3[i] - P1[i] - ex[i] * ivar) / sqrt(p3p1i);
        }
        
        // ez = numpy.cross(ex,ey)
        // if 2-dimensional vector then ez = 0
        CGFloat ez[] = { 0, 0, 0 };
        
        // d = numpy.linalg.norm(P2 - P1)
        CGFloat d = sqrt(P2P1);
        
        // j = dot(ey, P3 - P1)
        CGFloat jvar = 0;
        
        for (NSUInteger i = 0; i < 3; i++) {
            jvar += (ey[i] * p3p1[i]);
        }
        
        // from wikipedia
        // plug and chug using above values
        CGFloat x = (pow(distA, 2) - pow(distB, 2) + pow(d, 2)) / (2 * d);
        CGFloat y = ((pow(distA, 2) - pow(distC, 2) + pow(ivar, 2)
                      + pow(jvar, 2)) / (2 * jvar)) - ((ivar / jvar) * x);
        
        // only one case shown here
        CGFloat z = sqrt(pow(distA, 2) - pow(x, 2) - pow(y, 2));
        
        if (isnan(z)) z = 0;
        
        // triPt is an array with ECEF x,y,z of trilateration point
        // triPt = P1 + x*ex + y*ey + z*ez
        CGFloat triPt[] = { 0, 0, 0 };
        
        for (NSUInteger i = 0; i < 3; i++) {
            triPt[i] =  P1[i] + ex[i] * x + ey[i] * y + ez[i] * z;
        }
        
        // convert back to lat/long from ECEF
        // convert to degrees
        CGFloat lon = triPt[0];
        CGFloat lat = triPt[1];
        
        success([[Location alloc] initWithCoordinates:CLLocationCoordinate2DMake(lat, lon) altitude:z]);
    }
    else {
        failure([NSError errorWithDomain:@"At least 3 useful beacons are required"
                                    code:101
                                userInfo:nil]);
    }
}

@end