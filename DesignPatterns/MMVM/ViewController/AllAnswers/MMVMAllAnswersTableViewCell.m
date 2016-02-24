//
//  MMVMAllAnswersTableViewCell.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 24/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MMVMAllAnswersTableViewCell.h"
#import "GKBQuestion.h"

@implementation MMVMAllAnswersTableViewCell

- (void)awakeFromNib {
    // Initialization code
    UIImage *editedImage = [[UIImage imageNamed:@"btn_norml"] resizableImageWithCapInsets:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [self.backgroundImageView setImage:editedImage];
    self.answerButton.titleLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)setBackgroundForState:(BOOL)selected
{
    NSString *imageName = nil;
    imageName = selected ? @"btn_on" : @"btn_off";
    UIImage *editedImage = [[UIImage imageNamed:imageName] resizableImageWithCapInsets:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [self.answerButton setBackgroundImage:editedImage forState:UIControlStateNormal];
}
@end
