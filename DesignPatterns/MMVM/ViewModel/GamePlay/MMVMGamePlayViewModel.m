//
//  MMVMGamePlayViewModel.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MMVMGamePlayViewModel.h"
#import "MVCResultChartViewController.h"
#import "GKBQuestion.h"


@implementation MMVMGamePlayViewModel
@synthesize currentTime,currentQuestion;
@synthesize questionsArray;
@synthesize userSelectedAnswer;
@synthesize timer;
@synthesize timerCallback;

-(void)setTest:(GKBTest *)test
{
    _test = test;
    if(_test)
        self.questionsArray = [_test.questions allObjects];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentQuestion = 0;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerChanged) userInfo:nil repeats:YES];

    }
    return self;
}

-(NSString*)getTimeForSeconds:(int)time
{
    if(time == 0 || time < 0)
    {
        [self.timer invalidate];
        self.timer = nil;
        return nil;
    }
    int minute = floor( time / 60.0);
    int seconds = time - (60*minute);
    return [NSString stringWithFormat:@"%@:%@",minute<10 ? [NSString stringWithFormat:@"0%d",minute] : [NSString stringWithFormat:@"%d",minute],seconds<10 ? [NSString stringWithFormat:@"0%d",seconds] : [NSString stringWithFormat:@"%d",seconds]];
}

-(void)timerChanged
{
    self.currentTime ++;

    if(self.timerCallback)
    {
        int timeLeft = (kTotalGameTime - self.currentTime);
        self.timerCallback([self getTimeForSeconds:timeLeft]);
    }
}

-(void)setInitialTime:(MMVMTimerCallack)callback
{
    callback([self getTimeForSeconds:kTotalGameTime]);
}


-(NSInteger)numberOfRows
{
    return 4;
}

-(int)getQuestionNumber
{
    return self.currentQuestion;
}

-(NSString*)optionForRow:(NSInteger)row
{
    GKBQuestion *question = [self.questionsArray objectAtIndex:self.currentQuestion];
    NSString *option = @"";
    switch (row) {
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
    return option;
}

-(void)selectedAnswerAtIndexPath:(NSIndexPath*)indexPath
{
    GKBQuestion *question = [self.questionsArray objectAtIndex:self.currentQuestion];
    
    NSString *option = @"";
    switch (indexPath.row) {
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

-(NSString*)getHint
{
    GKBQuestion *question = self.questionsArray[self.currentQuestion];
    return question.hint;
}

-(NSString*)getQuestionText
{
    GKBQuestion *question = self.questionsArray[self.currentQuestion];
    return question.question;
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
    MVCResultChartViewController *allAnswers = [[UIStoryboard gameMVCStoryBoard] instantiateViewControllerWithIdentifier:@"CDResultChartVC"];
    allAnswers.questionsArray = self.questionsArray;
    [BASE_VIEWCONTROLLER pushViewController:allAnswers withAnimation:YES];
}

@end
