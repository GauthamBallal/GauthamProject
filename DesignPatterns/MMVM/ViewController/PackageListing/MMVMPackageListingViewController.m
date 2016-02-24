//
//  MMVMPackageListingViewController.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MMVMPackageListingViewController.h"
#import "MMVMPackageListingViewModel.h"

@interface MMVMPackageListingViewController ()
@property (weak, nonatomic) IBOutlet UITableView *packageListingTableView;
@property (strong, nonatomic) MMVMPackageListingViewModel *viewModel;
@end

@implementation MMVMPackageListingViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.viewModel = [[MMVMPackageListingViewModel alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListingCell" forIndexPath:indexPath];
    ((UILabel*)[cell viewWithTag:121]).text = [_viewModel titleForRow:indexPath.row];
    ((UILabel*)[cell viewWithTag:122]).text = [_viewModel imageTitleForRow:indexPath.row];
    ((UILabel*)[cell viewWithTag:123]).text = [_viewModel descriptionForRow:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_viewModel tableCellTapped:indexPath];
}

@end
