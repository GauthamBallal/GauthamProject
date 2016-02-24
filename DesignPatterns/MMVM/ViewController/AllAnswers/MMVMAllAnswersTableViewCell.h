//
//  MMVMAllAnswersTableViewCell.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 24/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GKBQuestion;

@interface MMVMAllAnswersTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *answerButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
-(void)setBackgroundForState:(BOOL)selected;
@end
