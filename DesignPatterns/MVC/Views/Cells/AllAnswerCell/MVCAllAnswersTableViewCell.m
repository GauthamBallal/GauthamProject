//
//  CDAllAnswersTableViewCell.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "MVCAllAnswersTableViewCell.h"
#import "GKBQuestion.h"

@interface MVCAllAnswersTableViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *optionsButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *questionsLabel;

@end

@implementation MVCAllAnswersTableViewCell

- (void)awakeFromNib {
    // Initialization code
    UIImage *editedImage = [[UIImage imageNamed:@"btn_norml"] resizableImageWithCapInsets:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [self.backgroundImageView setImage:editedImage];
    self.optionsButton.titleLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


-(NSAttributedString*)getAttributedStringFromString:(NSString*)string
{
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:string attributes:@{NSFontAttributeName:[UIFont helvaticaLight45WithSize:13.0],NSForegroundColorAttributeName: [UIColor blackColor]}];
    if(string.length > 4)
        [attString addAttributes:@{NSFontAttributeName:[UIFont helvaticaRoman55WithSize:13.0]} range:NSMakeRange(0, 3)];
    
    return attString;
}


-(void)setBackgroundForState:(BOOL)selected
{
    NSString *imageName = nil;
    imageName = selected ? @"btn_on" : @"btn_off";
    UIImage *editedImage = [[UIImage imageNamed:imageName] resizableImageWithCapInsets:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [self.optionsButton setBackgroundImage:editedImage forState:UIControlStateNormal];
}


-(void)constructCellWithQuestion:(GKBQuestion*)question
{
    [self.backgroundImageView setY:10];
    [self.backgroundImageView setHeight:(self.frame.size.height - 10)];

    float questionHeight = [question.question sizeOfStringWithFont:[UIFont helvaticaRoman55WithSize:13.0] constrainedToSize:CGSizeMake(280, FLT_MAX) lineBreakMode:NSLineBreakByTruncatingTail].height;
    float answerHeight = [question.correctAnswer sizeOfStringWithFont:[UIFont helvaticaLight45WithSize:13.0] constrainedToSize:CGSizeMake(280, FLT_MAX) lineBreakMode:NSLineBreakByTruncatingTail].height;
    [self.questionsLabel setHeight:questionHeight];
    
    [self.optionsButton setY:(self.questionsLabel.frame.origin.y + questionHeight + 20)];
    [self.optionsButton setHeight:(answerHeight+30)];
    self.questionsLabel.text = question.question;
    if(question.userAnswer)
    {
        NSString *userAnswerAppended = [NSString stringWithString:question.userAnswer];
        userAnswerAppended = [userAnswerAppended stringByReplacingCharactersInRange:NSMakeRange(0, 3) withString:@""];
        BOOL correctAnswer = [question.correctAnswer isEqualToString:userAnswerAppended] ? YES : NO;
        [self setBackgroundForState:correctAnswer];
        
        [self.optionsButton setAttributedTitle:[[NSAttributedString alloc]initWithString:question.correctAnswer] forState:UIControlStateNormal];
    }
    else
    {
        [self setBackgroundForState:NO];
        [self.optionsButton setAttributedTitle:[[NSAttributedString alloc]initWithString:@"Not Answered"] forState:UIControlStateNormal];
    }

}

@end
