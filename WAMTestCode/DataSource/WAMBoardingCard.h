//
//  WAMBoardingCard.h
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WAMTransportObject.h"

@interface WAMBoardingCard : NSObject
@property (nonatomic, copy, readonly) NSString *departure;
@property (nonatomic, copy, readonly) NSString *arrival;
@property (nonatomic, strong, readonly) WAMTransportObject *transport;

- (id)initWithDictionary: (NSDictionary *)boardingCardDictionary;
- (NSString *)boardingCardDescription;

@end
