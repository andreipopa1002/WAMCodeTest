//
//  WAMViewController.m
//  WAMTestCode
//
//  Created by Andrei Popa on 28/05/2014.
//  Copyright (c) 2014 Andrei Popa. All rights reserved.
//

#import "WAMViewController.h"
#import "WAMDataSourceManager.h"
#import "WAMBoardingCard.h"

@interface WAMViewController ()
@property (nonatomic, strong, readwrite) WAMDataSourceManager *dataSource;

@end

@implementation WAMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataSource = [WAMDataSourceManager new];
    [self.dataSource loadData];
    [self.dataSource sortBoardingCards];
    // debug code - to be removed
    for (WAMBoardingCard *boardingCard in self.dataSource.sortedBoardingCards) {
        NSLog(@"%@",boardingCard.boardingCardDescription);
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
