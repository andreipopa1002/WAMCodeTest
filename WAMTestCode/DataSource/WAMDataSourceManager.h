//
//  WAMDataSourceManager.h
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WAMDataSourceManager : NSObject
@property (nonatomic, strong, readonly) NSArray *unsortedBoardingCards;
@property (nonatomic, strong, readonly) NSArray *sortedBoardingCards;

- (void)loadData;
- (void)sortBoardingCards;

@end
