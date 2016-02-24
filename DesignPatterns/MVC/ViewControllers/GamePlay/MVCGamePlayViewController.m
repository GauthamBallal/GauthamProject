//
//  CDGamePlayViewController.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "MVCGamePlayViewController.h"
#import "GKBNavigationBar.h"
#import "MVCOptionsTableViewCell.h"
#import "GKBQuestion.h"
#import "MVCResultViewController.h"
#import "GKBDataSourceManager.h"
#import "GKBTest.h"


#define kMinimumHintHeight 128
#define kExtraHeightAfterHint 86

@interface MVCGamePlayViewController ()
@property (weak, nonatomic) IBOutlet UIButton *timerButton;
@property (weak, nonatomic) IBOutlet UIButton *packageNameButton;
@property (weak, nonatomic) IBOutlet UIView *questionView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITextView *testTextView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *hintHolderView;
@property (weak, nonatomic) IBOutlet UIView *hintView;
@property (weak, nonatomic) IBOutlet UIImageView *hintPopUpImageView;
@property (weak, nonatomic) IBOutlet UILabel *hintLabel;

@property (assign,nonatomic) int currentTime;
@property (nonatomic,strong) NSString *userSelectedAnswer;
@property (nonatomic,strong) NSTimer *timer;
@property (strong,nonatomic) NSArray *questionsArray;
@property (assign,nonatomic) int currentQuestion;

- (IBAction)submitButtonPressed:(UIButton *)sender;
- (IBAction)nextButtonPressed:(UIButton *)sender;
- (IBAction)hintGotItButtonPressed:(UIButton *)sender;

@end

@implementation MVCGamePlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hintTapped:) name:kHintNotification object:nil];
    
    // Do any additional setup after loading the view.
    [self.timerButton setTitle:[self getTimeForSeconds:kTotalGameTime] forState:UIControlStateNormal];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerChanged) userInfo:nil repeats:YES];
    


    self.currentQuestion = 0;

    self.questionsArray = [self.test.questions allObjects];
    
    self.questionLabel.numberOfLines = 0;
    [self loadViewWithQuestion];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    GKBNavigationBar *customNavigationBar =  (GKBNavigationBar*)[self.navigationController.navigationBar viewWithTag:kCustomNavigationBarTag];
    [customNavigationBar shouldHideHintButton:NO];
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

#pragma mark - Pivate Methods -

-(void)loadViewWithQuestion
{
    GKBQuestion *question = [_questionsArray objectAtIndex:self.currentQuestion];
    self.tableView.alpha = 0.1;
    NSString *questionText = [NSString stringWithFormat:@"Q %d.%@",self.currentQuestion+1,question.question];
    CGSize sizeForText = [questionText sizeOfStringWithFont:self.questionLabel.font constrainedToSize:CGSizeMake(self.questionLabel.frame.size.width, FLT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    [self.questionView setHeight:sizeForText.height + 30];
    [self.questionLabel setHeight:sizeForText.height];
    self.questionLabel.text = questionText;
    
    [self.tableView setTableHeaderView:self.questionView];
    [self.tableView reloadData];
    [UIView animateWithDuration:0.5 animations:^{
        self.tableView.alpha = 1.0;
    }];
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
    [self.timerButton setTitle:[self getTimeForSeconds:timeLeft] forState:UIControlStateNormal];
}

-(float)heightForText:(NSString*)string
{
    CGSize sizeForText = [string sizeOfStringWithFont:[UIFont helvaticaLight45WithSize:13.0] constrainedToSize:CGSizeMake(self.tableView.frame.size.width - 30.0, FLT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    
    float height = sizeForText.height;
    
    if(IR_SYS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
        height += 2;
    
    return height;
}

#pragma mark - UITableViewDataSource -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GKBQuestion *question = [_questionsArray objectAtIndex:self.currentQuestion];
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
    return ([self heightForText:option]+45);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.questionsArray ? 4 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCOptionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OptionsCell" forIndexPath:indexPath];
    
    GKBQuestion *question = [_questionsArray objectAtIndex:self.currentQuestion];
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
    
    [cell setOptionText:option];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GKBQuestion *question = [_questionsArray objectAtIndex:self.currentQuestion];

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
    [self nextButtonPressed:nil];
}

#pragma mark - Action Methods -

- (IBAction)submitButtonPressed:(UIButton *)sender {
    MVCResultViewController *allAnswers = [[UIStoryboard gameMVCStoryBoard] instantiateViewControllerWithIdentifier:@"CDResultChartVC"];
    allAnswers.questionsArray = self.questionsArray;
    [BASE_VIEWCONTROLLER pushViewController:allAnswers withAnimation:YES];
}

- (IBAction)nextButtonPressed:(UIButton *)sender
{
    ((GKBQuestion*)self.questionsArray[self.currentQuestion]).userAnswer = self.userSelectedAnswer;

    if(self.questionsArray.count > (self.currentQuestion+1))
    {
        self.currentQuestion++;
        self.userSelectedAnswer = nil;
        [self loadViewWithQuestion];
    }
    else
    {
        [self submitButtonPressed:nil];
    }
}

- (IBAction)hintGotItButtonPressed:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.hintHolderView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.hintHolderView.superview sendSubviewToBack:self.hintHolderView];
    }];
    [[NSNotificationCenter defaultCenter] postNotificationName:kHintNotification object:nil userInfo:nil];
}

-(void)hintTapped:(NSNotification*)hintNotification
{
    NSNumber *hintTapped = hintNotification.userInfo[@"selected"];
    
    if([hintTapped intValue] == 1)
    {
        GKBQuestion *question = [_questionsArray objectAtIndex:self.currentQuestion];
        
        float heightForLabel = [question.hint sizeOfStringWithFont:self.hintLabel.font constrainedToSize:CGSizeMake(self.hintLabel.frame.size.width, FLT_MAX) lineBreakMode:self.hintLabel.lineBreakMode].height;
        float heightForView = heightForLabel + kExtraHeightAfterHint;
        heightForView = heightForView < kMinimumHintHeight ? kMinimumHintHeight : heightForView;
        
        [self.hintView setHeight:heightForView];
        [self.hintLabel setHeight:heightForLabel];
        
        UIImage *editedImage = [self.hintPopUpImageView.image resizableImageWithCapInsets:UIEdgeInsetsMake(50.0, 10.0, 20.0, 10.0)];
        self.hintPopUpImageView.image = editedImage;
        self.hintView.center = self.hintHolderView.center;
        
        self.hintLabel.text = question.hint;
        [self.hintHolderView.superview bringSubviewToFront:self.hintHolderView];
        [UIView animateWithDuration:0.5 animations:^{
            self.hintHolderView.alpha = 1.0;
        } completion:^(BOOL finished) {
            
        }];
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.hintHolderView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self.hintHolderView.superview sendSubviewToBack:self.hintHolderView];
        }];
    }
}
@end
