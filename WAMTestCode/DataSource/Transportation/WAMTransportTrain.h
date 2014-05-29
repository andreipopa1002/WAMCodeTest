//
//  WAMTransportTrain.h
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import "WAMTransportBus.h"

@interface WAMTransportTrain : WAMTransportBus

@property (nonatomic, copy, readonly) NSString *seat;

@end
