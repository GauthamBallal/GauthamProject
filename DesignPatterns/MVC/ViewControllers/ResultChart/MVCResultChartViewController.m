//
//  CDResultChartViewController.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "MVCResultChartViewController.h"
#import "MVCAllAnswersViewController.h"
#import "GKBQuestion.h"
#import "GKBNavigationBar.h"

@interface MVCResultChartViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)showAnswersTapped:(UIButton *)sender;
@end

@implementation MVCResultChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setResult];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    GKBNavigationBar *customNavigationBar =  (GKBNavigationBar*)[self.navigationController.navigationBar viewWithTag:kCustomNavigationBarTag];
    [customNavigationBar shouldHideBackButton:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setResult
{
    int correctAnswer = 0;
    for (GKBQuestion *question in _questionsArray) {
        if(question.userAnswer)
        {
            NSString *userAnswerAppended = [NSString stringWithString:question.userAnswer];
            userAnswerAppended = [userAnswerAppended stringByReplacingCharactersInRange:NSMakeRange(0, 3) withString:@""];
            BOOL isAnswerCorrect = [question.correctAnswer isEqualToString:userAnswerAppended] ? YES : NO;
            if(isAnswerCorrect)
                correctAnswer ++;
        }
    }
    self.resultLabel.text = [NSString stringWithFormat:@"%d/%lu",correctAnswer,(unsigned long)_questionsArray.count];
}

- (IBAction)showAnswersTapped:(UIButton *)sender {
    MVCAllAnswersViewController *allAnswers = [[UIStoryboard gameMVCStoryBoard] instantiateViewControllerWithIdentifier:@"CDAllAnswersVC"];
    allAnswers.questionsArray = self.questionsArray;
    [BASE_VIEWCONTROLLER pushViewController:allAnswers withAnimation:YES];
}
@end
