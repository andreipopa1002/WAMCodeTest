//
//  WAMTransportFactory.m
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import "WAMTransportFactory.h"
#import "WAMTransportBus.h"
#import "WAMTransportTrain.h"
#import "WAMTransportAirplane.h"

@implementation WAMTransportFactory


+ (WAMTransportObject *)createTransportObjectWithDictionary: (NSDictionary *)transportDictionary {
    if ([transportDictionary objectForKey:@"gate"]) {
        return [[WAMTransportAirplane alloc] initWithDictionary: transportDictionary];
    } else if ([transportDictionary objectForKey:@"seat"]) {
        return [[WAMTransportTrain alloc] initWithDictionary: transportDictionary];
    } else if ([transportDictionary objectForKey:@"transportName"]) {
        return [[WAMTransportBus alloc] initWithDictionary: transportDictionary];
    }
    NSLog(@"transport dictionary not a mode of transport known");
    return nil;
}
@end
