//
//  MMVMPackageListingViewModel.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MMVMPackageListingViewModel.h"
#import "GKBTest.h"
#import "MMVMGamePlayViewController.h"
#import "GKBDataSourceManager.h"

@interface MMVMPackageListingViewModel ()
@property (strong, nonatomic) NSArray *testsArray;

@end

@implementation MMVMPackageListingViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.testsArray = [[GKBDataSourceManager sharedGKBDataSourceManager] getAllTests];
    }
    return self;
}

-(NSInteger)numberOfRows
{
    return _testsArray.count;
}

-(NSString*)titleForRow:(NSInteger)row
{
    GKBTest *test = self.testsArray[row];
    return test.testName;
}
-(NSString*)descriptionForRow:(NSInteger)row
{
    GKBTest *test = self.testsArray[row];
    return test.testDescription;
}

-(NSString*)imageTitleForRow:(NSInteger)row
{
    GKBTest *test = self.testsArray[row];
    return [NSString stringWithFormat:@"Test %@",test.testID];
}

-(void)tableCellTapped:(NSIndexPath*)indexPath
{
    MMVMGamePlayViewController *gameViewController = [[UIStoryboard gameMMVMStoryBoard] instantiateViewControllerWithIdentifier:@"CDGamePlayVC"];
    gameViewController.viewModel.test = self.testsArray[indexPath.row];
    [BASE_VIEWCONTROLLER pushViewController:gameViewController withAnimation:YES];
}

@end
