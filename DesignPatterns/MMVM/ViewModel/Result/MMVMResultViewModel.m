//
//  MMVMResultViewModel.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 24/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MMVMResultViewModel.h"
#import "GKBQuestion.h"
#import "MMVMAllAnswersView.h"
#import "GKBTest.h"

@implementation MMVMResultViewModel

-(NSString*)getResultText
{
    int correctAnswer = 0;
    for (GKBQuestion *question in _answers) {
        if(question.userAnswer)
        {
            NSString *userAnswerAppended = [NSString stringWithString:question.userAnswer];
            userAnswerAppended = [userAnswerAppended stringByReplacingCharactersInRange:NSMakeRange(0, 3) withString:@""];
            BOOL isAnswerCorrect = [question.correctAnswer isEqualToString:userAnswerAppended] ? YES : NO;
            if(isAnswerCorrect)
                correctAnswer ++;
        }
    }
    return [NSString stringWithFormat:@"%d/%lu",correctAnswer,(unsigned long)_answers.count];
}

-(void)showAllAnswerButonTapped
{
    MMVMAllAnswersView *allAnswers = [[UIStoryboard gameMMVMStoryBoard] instantiateViewControllerWithIdentifier:@"CDAllAnswersVC"];
    allAnswers.viewModel.questionsArray = _answers;
    [BASE_VIEWCONTROLLER pushViewController:allAnswers withAnimation:YES];
}

@end
