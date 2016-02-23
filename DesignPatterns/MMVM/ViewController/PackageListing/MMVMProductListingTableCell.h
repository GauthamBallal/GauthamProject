//
//  MMVMProductListingTableCell.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMVMProductListingTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *imageTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *packageTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *packageDescriptionLabel;
@end
