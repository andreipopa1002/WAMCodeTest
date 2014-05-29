//
//  WAMDataSourceManager.m
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import "WAMDataSourceManager.h"
#import "WAMBoardingCard.h"

@interface WAMDataSourceManager()
@property (nonatomic, strong, readwrite) NSArray *unsortedBoardingCards;
@property (nonatomic, strong, readwrite) NSArray *sortedBoardingCards;

@end

@implementation WAMDataSourceManager


- (void)loadData {
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"BoardingCards" ofType:@"plist"]];
    NSMutableArray *unsortedBoardingCards = [NSMutableArray new];
    for (NSDictionary *boardingCardDictionary in plistArray) {
        WAMBoardingCard *boardingCard = [[WAMBoardingCard alloc] initWithDictionary:boardingCardDictionary];
        [unsortedBoardingCards addObject:boardingCard];
    }
    if (unsortedBoardingCards.count) {
        self.unsortedBoardingCards = [NSArray arrayWithArray: unsortedBoardingCards];
    }
}

- (void)sortBoardingCards {
    NSMutableDictionary *departures = [NSMutableDictionary new];
    NSMutableDictionary *arrivals = [NSMutableDictionary new];
    for (WAMBoardingCard *boardingCard in self.unsortedBoardingCards) {
        [departures setObject:boardingCard forKey:boardingCard.departure];
        [arrivals setObject:boardingCard forKey:boardingCard.arrival];
    }
    NSMutableArray *sortedBoardingCards = [NSMutableArray new];
    [sortedBoardingCards addObject:[self.unsortedBoardingCards objectAtIndex:self.unsortedBoardingCards.count/2]];
    
    while (sortedBoardingCards.count < self.unsortedBoardingCards.count) {
        NSString *departureKey = [[sortedBoardingCards objectAtIndex: sortedBoardingCards.count - 1] arrival];
        WAMBoardingCard *departureBoardingCard = [departures objectForKey:departureKey];
        if (departureBoardingCard) {
            [sortedBoardingCards addObject:departureBoardingCard];
        }
        NSString *arrivalKey = [[sortedBoardingCards objectAtIndex:0] departure];
        WAMBoardingCard *arrivalBoardingCard = [arrivals objectForKey:arrivalKey];
        if (arrivalBoardingCard) {
            [sortedBoardingCards insertObject:arrivalBoardingCard atIndex:0];
        }
    }
    self.sortedBoardingCards = [NSArray arrayWithArray:sortedBoardingCards];
}
@end
