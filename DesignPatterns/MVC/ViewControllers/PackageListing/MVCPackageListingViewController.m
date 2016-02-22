//
//  CDPackageListingViewController.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "MVCPackageListingViewController.h"
#import "MVCGamePlayViewController.h"
#import "MVCListingTableViewCell.h"
#import "GKBDataSourceManager.h"

@interface MVCPackageListingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *listingHeaderLabel;
@property (weak, nonatomic) IBOutlet UITableView *listingTableView;
@property (strong, nonatomic) NSArray *testsArray;
@end

@implementation MVCPackageListingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.testsArray = [[GKBDataSourceManager sharedGKBDataSourceManager] getAllTests];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.testsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GKBTest *test = _testsArray[indexPath.row];
    MVCListingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListingCell" forIndexPath:indexPath];
    [cell constructCellWithTest:test];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCGamePlayViewController *gameViewController = [[UIStoryboard gameMVCStoryBoard] instantiateViewControllerWithIdentifier:@"CDGamePlayVC"];
    gameViewController.test = _testsArray[indexPath.row];
    [BASE_VIEWCONTROLLER pushViewController:gameViewController withAnimation:YES];
}


@end
