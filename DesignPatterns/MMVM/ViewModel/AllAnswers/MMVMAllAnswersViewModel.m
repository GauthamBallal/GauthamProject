//
//  MMVMAllAnswersViewModel.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 24/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MMVMAllAnswersViewModel.h"
#import "GKBQuestion.h"

@implementation MMVMAllAnswersViewModel

-(NSInteger)numberOfRows
{
    return self.questionsArray.count;
}

-(NSString*)getQuestionTextForRow:(NSInteger)row
{
    GKBQuestion *question = self.questionsArray[row];
    return question.question;
}

-(NSString*)getAnswerTextForRow:(NSInteger)row
{
    GKBQuestion *question = self.questionsArray[row];
    return question.correctAnswer;
}

-(NSString*)getUserAnswerTextForRow:(NSInteger)row
{
    GKBQuestion *question = self.questionsArray[row];
    return question.userAnswer;
}

-(void)goToMainMenuTapped
{
    [BASE_VIEWCONTROLLER popViewRootViewControllerAnimated:YES];
}

-(BOOL)isUserAnswerCorrectForRow:(NSInteger)row
{
    GKBQuestion *question = self.questionsArray[row];
    NSString *userAnswer = question.userAnswer;
    NSString *answer = question.correctAnswer;
    
    NSString *userAnswerAppended = [NSString stringWithString:userAnswer];
    userAnswerAppended = [userAnswerAppended stringByReplacingCharactersInRange:NSMakeRange(0, 3) withString:@""];
    BOOL correctAnswer = [answer isEqualToString:userAnswerAppended] ? YES : NO;
    
    return correctAnswer;
}

@end
