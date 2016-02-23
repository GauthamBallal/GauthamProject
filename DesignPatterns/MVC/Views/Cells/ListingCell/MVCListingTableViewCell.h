//
//  CDListingTableViewCell.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GKBTest;

@interface MVCListingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *imageTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *packageTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *packageDescriptionLabel;

-(void)constructCellWithTest:(GKBTest*)test;
@end
