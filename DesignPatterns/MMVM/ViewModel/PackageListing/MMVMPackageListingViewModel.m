//
//  MMVMPackageListingViewModel.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MMVMPackageListingViewModel.h"
#import "GKBTest.h"
#import "MVCListingTableViewCell.h"
#import "MVCGamePlayViewController.h"
#import "GKBDataSourceManager.h"

@implementation MMVMPackageListingViewModel
@synthesize testsArray;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.testsArray = [[GKBDataSourceManager sharedGKBDataSourceManager] getAllTests];
    }
    return self;
}


#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.testsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GKBTest *test = self.testsArray[indexPath.row];
    MVCListingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListingCell" forIndexPath:indexPath];
    cell.imageTitleLabel.text = test.testName;
    cell.packageTitleLabel.text = [NSString stringWithFormat:@"Test %@",test.testID];
    cell.packageDescriptionLabel.text = test.testDescription;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCGamePlayViewController *gameViewController = [[UIStoryboard gameMVCStoryBoard] instantiateViewControllerWithIdentifier:@"CDGamePlayVC"];
    gameViewController.test = self.testsArray[indexPath.row];
    [BASE_VIEWCONTROLLER pushViewController:gameViewController withAnimation:YES];
}

@end
