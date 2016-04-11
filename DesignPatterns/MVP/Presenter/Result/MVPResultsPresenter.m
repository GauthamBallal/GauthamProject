//
//  MVPresultsPresenter.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 11/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MVPResultsPresenter.h"
#import "GKBQuestion.h"
#import "MVPInteractor.h"
#import "MVPResultViewImplementation.h"

@interface MVPResultsPresenter ()
@property (nonatomic,strong) NSArray *answers;
@end

@implementation MVPResultsPresenter

- (instancetype)initWithView:(id<MVPResultView>)view
{
    self = [super init];
    if (self) {
        self.view = view;
        self.interactor = [MVPInteractor sharedMVPInteractor];
    }
    return self;
}

-(void)loadData
{
    self.answers = [self.interactor getAllAnswers];
    if(self.answers.count > 0)
        [self.view loadDataToView];
}

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
//    MVPResultViewImplementation *allAnswers = [[UIStoryboard gameMVPStoryBoard] instantiateViewControllerWithIdentifier:@"CDAllAnswersVC"];
//    [BASE_VIEWCONTROLLER pushViewController:allAnswers withAnimation:YES];
}

@end
