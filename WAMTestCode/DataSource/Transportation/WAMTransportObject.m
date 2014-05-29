//
//  WAMTransportObject.m
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import "WAMTransportObject.h"

@interface WAMTransportObject()
@property (nonatomic, copy, readwrite) NSString *transportName;

@end

@implementation WAMTransportObject

- (id)initWithDictionary: (NSDictionary*)transportationDictionary {
    self = [super init];
    if (self) {
        _transportName = [transportationDictionary objectForKey:@"transportName"];
    }
    return self;
}

- (NSString *)transportDescriptionForDeparture: (NSString *)departure andArrival: (NSString *)arrival {
    return @"No implementation - please add implementation";
}
@end
