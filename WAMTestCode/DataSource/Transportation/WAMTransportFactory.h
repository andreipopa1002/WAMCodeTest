//
//  WAMTransportFactory.h
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WAMTransportObject.h"
#import "WAMTransportObject.h"

@interface WAMTransportFactory : NSObject

+ (WAMTransportObject *)createTransportObjectWithDictionary: (NSDictionary *)transportDictionary;

@end
