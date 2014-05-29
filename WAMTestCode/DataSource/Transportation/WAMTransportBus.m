//
//  WAMTransportBus.m
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import "WAMTransportBus.h"

@interface WAMTransportBus()
@property (nonatomic, copy, readwrite) NSString *number;

@end

@implementation WAMTransportBus

- (id)initWithDictionary:(NSDictionary *)transportationDictionary {
    self = [super initWithDictionary: transportationDictionary];
    if (self) {
        _number = [transportationDictionary objectForKey: @"number"];
    }
    return self;
}

- (NSString *)transportDescriptionForDeparture: (NSString *)departure andArrival: (NSString *)arrival {
    NSString *description = nil;
    if (self.number.length) {
        description = [NSString stringWithFormat: @"Take %@ number %@ from %@ to %@. No seat assignament.",self.transportName,self.number,departure, arrival];
    } else {
        return [NSString stringWithFormat: @"Take %@ from %@ to %@. No seat assignament.",self.transportName,departure, arrival];
    }
    return description;
}

@end
