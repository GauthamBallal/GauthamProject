//
//  MMVMPackageListingViewController.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MMVMPackageListingViewController.h"
#import "MMVMPackageListingViewModel.h"
#import "MMVMProductListingTableCell.h"

@interface MMVMPackageListingViewController ()
@property (weak, nonatomic) IBOutlet UITableView *packageListingTableView;
@property (strong, nonatomic) MMVMPackageListingViewModel *viewModel;
@end

@implementation MMVMPackageListingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewModel = [[MMVMPackageListingViewModel alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_viewModel numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMVMProductListingTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListingCell" forIndexPath:indexPath];
    cell.imageTitleLabel.text = [_viewModel imageTitleForRow:indexPath.row];
    cell.packageTitleLabel.text = [_viewModel titleForRow:indexPath.row];
    cell.packageDescriptionLabel.text = [_viewModel descriptionForRow:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_viewModel tableCellTapped:indexPath];
}

@end
