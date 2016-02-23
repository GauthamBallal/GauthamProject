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

-(void)constructCellWithTest:(GKBTest*)test;
@end
