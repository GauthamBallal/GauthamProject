//
//  MMVMPackageListingViewController.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMVMPackageListingProtocol <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray *testsArray;


@end

@interface MMVMPackageListingViewController : UIViewController

@end
