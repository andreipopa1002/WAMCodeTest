//
//  WAMBoardingCard.m
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import "WAMBoardingCard.h"
#import "WAMTransportFactory.h"
#import "WAMTransportBus.h"

@interface WAMBoardingCard()
@property (nonatomic, copy, readwrite) NSString *departure;
@property (nonatomic, copy, readwrite) NSString *arrival;
@property (nonatomic, strong, readwrite) WAMTransportObject *transport;
@end

@implementation WAMBoardingCard


- (id)initWithDictionary :(NSDictionary *)boardingCardDictionary {
    self = [super init];
    if (self) {
        _departure = [boardingCardDictionary objectForKey:@"departure"];
        _arrival = [boardingCardDictionary objectForKey:@"arrival"];
        _transport = [WAMTransportFactory createTransportObjectWithDictionary:[boardingCardDictionary objectForKey:@"transport"]];
    }
    return self;
}

- (NSString *)boardingCardDescription {
    return [self.transport transportDescriptionForDeparture:self.departure andArrival:self.arrival];
}

- (NSString *)shortCardDescription {
    return [NSString stringWithFormat:@"%@ - %@ > %@",self.transport.transportName,self.departure,self.arrival];
}
@end
