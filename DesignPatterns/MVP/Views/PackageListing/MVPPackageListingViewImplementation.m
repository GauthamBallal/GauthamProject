//
//  MVPPackageListingViewImplementation.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 06/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MVPPackageListingViewImplementation.h"
#import "MVPPackageListingPresenter.h"
#import "GKBTest.h"
#import "MVCListingTableViewCell.h"

@interface MVPPackageListingViewImplementation ()<MVPPackageListingView>
@property (nonatomic,strong) MVPPackageListingPresenter *presenter;
@property (weak, nonatomic) IBOutlet UILabel *listingHeaderLabel;
@property (weak, nonatomic) IBOutlet UITableView *listingTableView;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@end

@implementation MVPPackageListingViewImplementation

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.presenter = [[MVPPackageListingPresenter alloc]initWithView:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.presenter loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MVPPackageListingView -

-(void)loadDataToView
{
    [self.listingTableView reloadData];
}

-(void)noDataAvailable
{
    self.errorLabel.hidden = NO;
}

#pragma mark - UITableView -


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.presenter totalItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GKBTest *test = [self.presenter itemAtIndex:indexPath.row];
    MVCListingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListingCell" forIndexPath:indexPath];
    [cell constructCellWithTest:test];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.presenter cellTappedAtIndex:indexPath.row];
}


@end
