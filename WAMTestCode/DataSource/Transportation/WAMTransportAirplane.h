//
//  WAMTransportAirplane.h
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import "WAMTransportTrain.h"

@interface WAMTransportAirplane : WAMTransportTrain

@property (nonatomic, copy, readonly) NSString *gate;
@property (nonatomic, copy, readonly) NSString *baggage;

@end
