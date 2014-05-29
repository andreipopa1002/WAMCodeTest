//
//  WAMTransportAirplane.m
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import "WAMTransportAirplane.h"
@interface WAMTransportAirplane()

@property (nonatomic, copy, readwrite) NSString *gate;
@property (nonatomic, copy, readwrite) NSString *baggage;

@end

@implementation WAMTransportAirplane

- (id)initWithDictionary:(NSDictionary *)transportationDictionary {
    self = [super initWithDictionary:transportationDictionary];
    if (self) {
        _gate = [transportationDictionary objectForKey:@"gate"];
        _baggage = [transportationDictionary objectForKey:@"baggage"];
    }
    return self;
}

- (NSString *)transportDescriptionForDeparture: (NSString *)departure andArrival: (NSString *)arrival {
    return [NSString stringWithFormat:@"From %@, take %@ %@ to %@ gate %@, seat %@. %@",departure,self.transportName,self.number,arrival,self.gate,self.seat,self.baggage];
}

@end
