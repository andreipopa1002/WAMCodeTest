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
#import "WAMDetailsViewController.h"

CGFloat const SortButtonLeftRightPadding    = 20.0;
CGFloat const SortButtonTopPadding          = 10.0;
CGFloat const SortButtonHeight              = 20.0;
CGFloat const TitleLableHeight              = 20.0;
CGFloat const TableViewLeftRightPadding     = 10.0;
CGFloat const TableViewTopPadding           = 10.0;

@interface WAMViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong, readwrite) WAMDataSourceManager *dataSource;
@property (nonatomic, strong, readwrite) UIButton *sortBoardingCardsButton;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UITableView *tableView;

- (void)updateUIForSortedDataSource: (BOOL)sorted;
@end

@implementation WAMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = [WAMDataSourceManager new];
    [self.dataSource addObserver:self forKeyPath:@"unsortedBoardingCards"
                         options:NSKeyValueObservingOptionNew
                         context:nil];
    [self.dataSource addObserver:self forKeyPath:@"sortedBoardingCards"
                         options:NSKeyValueObservingOptionNew
                         context:nil];
    [self.dataSource loadData];
    // sort button
    CGFloat startingPointY = self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height;
    self.sortBoardingCardsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.sortBoardingCardsButton.frame =  CGRectMake(SortButtonTopPadding,
                                                     startingPointY +SortButtonLeftRightPadding,
                                                     self.view.bounds.size.width - 2*SortButtonLeftRightPadding,
                                                     SortButtonHeight);
    [self.sortBoardingCardsButton setTitle:@"Sort Trip" forState:UIControlStateNormal];
    [self.sortBoardingCardsButton setTitle:@"Sort Trip" forState:UIControlStateSelected];
    [self.sortBoardingCardsButton addTarget:self action:@selector(sortBoardingCards:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.sortBoardingCardsButton];
    // top label
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(TableViewLeftRightPadding,
                                                                CGRectGetMaxY(self.sortBoardingCardsButton.frame) + TableViewTopPadding,
                                                                self.view.bounds.size.width - 2*TableViewLeftRightPadding,
                                                                TitleLableHeight)];
    self.titleLabel.text = @"Unsorted Boarding Cards:";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.titleLabel];
    // tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(TableViewLeftRightPadding,
                                                                   CGRectGetMaxY(self.titleLabel.frame) + TableViewTopPadding,
                                                                   self.view.bounds.size.width - 2*TableViewLeftRightPadding,
                                                                   self.view.bounds.size.height - CGRectGetMaxY(self.titleLabel.frame) + TableViewTopPadding)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - TableView DataSource & Delegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataSource.sortedBoardingCards) {
        return self.dataSource.sortedBoardingCards.count;
    } else {
        return self.dataSource.unsortedBoardingCards.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"boadingCard";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
    }
    WAMBoardingCard *boardingCard = [self.dataSource.sortedBoardingCards ? self.dataSource.sortedBoardingCards : self.dataSource.unsortedBoardingCards objectAtIndex:indexPath.row];
    cell.textLabel.text = boardingCard.shortCardDescription;
    cell.userInteractionEnabled = self.dataSource.sortedBoardingCards ? YES : NO;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"details" sender:[self.dataSource.sortedBoardingCards objectAtIndex:indexPath.row]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [[segue destinationViewController] setDetails:[sender boardingCardDescription]];
}

# pragma mark - Internal methods
- (void)updateUIForSortedDataSource: (BOOL)sorted {
    // sort button
    CGFloat startingPointY = self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height;
    self.sortBoardingCardsButton.hidden = sorted;
    // top label
    self.titleLabel.frame = CGRectMake(TableViewLeftRightPadding,
                                       (sorted ? startingPointY : CGRectGetMaxY(self.sortBoardingCardsButton.frame)) + TableViewTopPadding,
                                       self.view.bounds.size.width - 2*TableViewLeftRightPadding,
                                       TitleLableHeight);
    self.titleLabel.text = sorted ? @"Sorted Boarding Cards" : @"Unsorted Boarding Cards:";
    // tableView
    self.tableView.frame = CGRectMake(TableViewLeftRightPadding,
                                      CGRectGetMaxY(self.titleLabel.frame) + TableViewTopPadding,
                                      self.view.bounds.size.width - 2*TableViewLeftRightPadding,
                                      self.view.bounds.size.height - CGRectGetMaxY(self.titleLabel.frame) + TableViewTopPadding);
}

- (void)sortBoardingCards: (id)sender {
    [self.dataSource sortBoardingCards];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"unsortedBoardingCards"]) {
        [self updateUIForSortedDataSource:NO];
        [self.tableView reloadData];
    } else if ([keyPath isEqualToString:@"sortedBoardingCards"]) {
        [self updateUIForSortedDataSource:YES];
        [self.tableView reloadData];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self.dataSource removeObserver:self forKeyPath:@"unsortedBoardingCards" context:nil];
    [self.dataSource removeObserver:self forKeyPath:@"sortedBoardingCards" context:nil];
}

@end
