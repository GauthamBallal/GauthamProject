//
//  CDAnswerTableViewCell.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "MVCOptionsTableViewCell.h"

@interface MVCOptionsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *optionButton;
@end

@implementation MVCOptionsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.optionButton.titleLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    [self setBackgroundForState:selected];

    // Configure the view for the selected state
}


-(void)setBackgroundForState:(BOOL)selected
{
    NSString *imageName = nil;
    imageName = selected ? @"btn_on" : @"btn_norml";
    UIImage *editedImage = [[UIImage imageNamed:imageName] resizableImageWithCapInsets:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [self.optionButton setBackgroundImage:editedImage forState:UIControlStateNormal];
}

-(NSAttributedString*)getAttributedStringFromString:(NSString*)string
{
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:string attributes:@{NSFontAttributeName:[UIFont helvaticaLight45WithSize:13.0],NSForegroundColorAttributeName: [UIColor blackColor]}];
    if(string.length > 4)
        [attString addAttributes:@{NSFontAttributeName:[UIFont helvaticaRoman55WithSize:13.0]} range:NSMakeRange(0, 3)];

    return attString;
}


-(void)setOptionText:(NSString*)optionText
{
    [self.optionButton setHeight:(self.frame.size.height - 15)];

    [self.optionButton setAttributedTitle:[self getAttributedStringFromString:optionText] forState:UIControlStateNormal];
}


@end
