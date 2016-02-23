//
//  CDListingTableViewCell.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "MVCListingTableViewCell.h"
#import "GKBTest.h"

@interface MVCListingTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *freeOrPaiedImageView;
@property (weak, nonatomic) IBOutlet UIImageView *packageImageView;


@end

@implementation MVCListingTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)constructCellWithTest:(GKBTest*)test
{
    _imageTitleLabel.text = test.testName;
    _packageTitleLabel.text = [NSString stringWithFormat:@"Test %@",test.testID];
    _packageDescriptionLabel.text = test.testDescription;
}

@end
