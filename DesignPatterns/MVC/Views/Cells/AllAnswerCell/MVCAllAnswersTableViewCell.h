//
//  CDAllAnswersTableViewCell.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GKBQuestion;

@interface MVCAllAnswersTableViewCell : UITableViewCell


-(void)constructCellWithQuestion:(GKBQuestion*)question;
@end
