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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewModel = [[MMVMPackageListingViewModel alloc]init];
    self.packageListingTableView.delegate = _viewModel;
    self.packageListingTableView.dataSource = _viewModel;
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

@end
