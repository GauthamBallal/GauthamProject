//
//  MVPGamePlayPresenter.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 07/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MVPGamePlayPresenter.h"
#import "MVPInteractor.h"
#import "GKBQuestion.h"

@interface MVPGamePlayPresenter ()
@property (assign,nonatomic) int currentTime;
@property (nonatomic,strong) NSString *userSelectedAnswer;
@property (nonatomic,strong) NSTimer *timer;
@property (strong,nonatomic) NSArray *questionsArray;
@property (assign,nonatomic) int currentQuestion;
@end

@implementation MVPGamePlayPresenter

- (instancetype)initWithView:(id<MVPGamePlayView>)view
{
    self = [super init];
    if (self) {
        self.view = view;
        self.interactor = [MVPInteractor sharedMVPInteractor];
        self.currentQuestion = 0;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerChanged) userInfo:nil repeats:YES];
    }
    return self;
}

-(void)loadData
{
    self.questionsArray = [self.interactor getAllQuestions];
    if(self.questionsArray.count > 0)
        [self.view loadDataToView];
    else
        [self.view noDataAvailable];
}

-(NSInteger)totalItems
{
    return 4;
}

-(id)itemAtIndex:(NSInteger)index
{
    GKBQuestion *question = [self.questionsArray objectAtIndex:self.currentQuestion];
    return question;
}

-(int)getQuestionNumber
{
    return self.currentQuestion;
}


-(void)cellTappedAtIndex:(NSInteger)index
{
    GKBQuestion *question = [self.questionsArray objectAtIndex:self.currentQuestion];
    
    NSString *option = @"";
    switch (index) {
        case 0:
            option = question.optionOne;
            break;
        case 1:
            option = question.optionTwo;
            break;
        case 2:
            option = question.optionThree;
            break;
        case 3:
            option = question.optionFour;
            break;
        default:
            break;
    }
    self.userSelectedAnswer = option;
}

-(BOOL)shouldLoadNextQuestion
{
    return !(self.questionsArray.count == self.currentQuestion);
}

-(void)nextButtonTapped
{
    ((GKBQuestion*)self.questionsArray[self.currentQuestion]).userAnswer = self.userSelectedAnswer;
    
    if(self.questionsArray.count > (self.currentQuestion+1))
    {
        self.currentQuestion++;
        self.userSelectedAnswer = nil;
    }
    else
    {
        [self submitButtonTapped];
    }
}

-(void)submitButtonTapped
{
    if(self.timer)
    {
        [self.timer invalidate];
        self.timer = nil;
    }
    
//    MMVMResultView *allAnswers = [[UIStoryboard gameMMVMStoryBoard] instantiateViewControllerWithIdentifier:@"CDResultChartVC"];
//    allAnswers.viewModel.answers = self.questionsArray;
//    [BASE_VIEWCONTROLLER pushViewController:allAnswers withAnimation:YES];
}

-(NSString*)getTimeForSeconds:(int)time
{
    int minute = floor( time / 60.0);
    int seconds = time - (60*minute);
    return [NSString stringWithFormat:@"%@:%@",minute<10 ? [NSString stringWithFormat:@"0%d",minute] : [NSString stringWithFormat:@"%d",minute],seconds<10 ? [NSString stringWithFormat:@"0%d",seconds] : [NSString stringWithFormat:@"%d",seconds]];
}

-(void)timerChanged
{
    self.currentTime ++;
    int timeLeft = (kTotalGameTime - self.currentTime);
    [self.view setTimerText:[self getTimeForSeconds:timeLeft]];
}


@end
