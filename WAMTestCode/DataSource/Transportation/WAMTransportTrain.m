//
//  WAMTransportTrain.m
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import "WAMTransportTrain.h"

@interface WAMTransportTrain()
@property (nonatomic, copy, readwrite) NSString *seat;

@end

@implementation WAMTransportTrain

- (id)initWithDictionary:(NSDictionary *)transportationDictionary {
    self = [super initWithDictionary: transportationDictionary];
    if (self) {
        _seat = [transportationDictionary objectForKey: @"seat"];
    }
    return self;
}

- (NSString *)transportDescriptionForDeparture: (NSString *)departure andArrival: (NSString *)arrival {
    return [NSString stringWithFormat:@"Take %@ %@ from %@ to %@. Sit in seat %@",self.transportName, self.number,departure, arrival, self.seat];
}
@end
