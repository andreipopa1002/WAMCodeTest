//
//  WAMTransportObject.h
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WAMTransportObject : NSObject
@property (nonatomic, copy, readonly) NSString *transportName;

- (id)initWithDictionary: (NSDictionary*)transportationDictionary;
- (NSString *)transportDescriptionForDeparture: (NSString *)departure andArrival: (NSString *)arrival;

@end
