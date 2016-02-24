//
//  MMVMGamePlayViewController.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MMVMGamePlayViewController.h"
#import "GKBNavigationBar.h"
#import "MVCOptionsTableViewCell.h"
#import "GKBQuestion.h"
#import "MVCResultViewController.h"
#import "GKBDataSourceManager.h"

#define kMinimumHintHeight 128
#define kExtraHeightAfterHint 86

@interface MMVMGamePlayViewController ()

@property (weak, nonatomic) IBOutlet UIButton *timerButton;
@property (weak, nonatomic) IBOutlet UIButton *packageNameButton;
@property (weak, nonatomic) IBOutlet UIView *questionView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *hintHolderView;
@property (weak, nonatomic) IBOutlet UIView *hintView;
@property (weak, nonatomic) IBOutlet UIImageView *hintPopUpImageView;
@property (weak, nonatomic) IBOutlet UILabel *hintLabel;

@property (strong,nonatomic) MMVMTimerCallack updateTimeCallback;

- (IBAction)submitButtonPressed:(UIButton *)sender;
- (IBAction)nextButtonPressed:(UIButton *)sender;
- (IBAction)hintGotItButtonPressed:(UIButton *)sender;

@end

@implementation MMVMGamePlayViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.viewModel = [[MMVMGamePlayViewModel alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hintTapped:) name:kHintNotification object:nil];
    
    // Do any additional setup after loading the view.
//    [self.timerButton setTitle:[self getTimeForSeconds:kTotalGameTime] forState:UIControlStateNormal];
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerChanged) userInfo:nil repeats:YES];
    
    self.questionLabel.numberOfLines = 0;
    [self loadViewWithQuestion];
    
    __weak typeof(self) weakSelf = self;
    [self.viewModel setInitialTime:^(NSString *timeToSet) {
        [weakSelf.timerButton setTitle:timeToSet forState:UIControlStateNormal];
    }];
    
    self.updateTimeCallback = ^(NSString *timeToSet)
    {
        [weakSelf setTimerText:timeToSet];
    };
    self.viewModel.timerCallback = self.updateTimeCallback;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    GKBNavigationBar *customNavigationBar =  (GKBNavigationBar*)[self.navigationController.navigationBar viewWithTag:kCustomNavigationBarTag];
    [customNavigationBar shouldHideHintButton:NO];
    [customNavigationBar shouldHideBackButton:YES];
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - Private Methods -

-(void)setTimerText:(NSString*)timetoSet
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(timetoSet == nil)
            [self submitButtonPressed:nil];
        else if(_timerButton)
            [self.timerButton setTitle:timetoSet forState:UIControlStateNormal];
    });
}

-(void)loadViewWithQuestion
{
    self.tableView.alpha = 0.1;
    NSString *questionText = [NSString stringWithFormat:@"Q %d.%@",[_viewModel getQuestionNumber]+1,[_viewModel getQuestionText]];
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
    NSString *option = [_viewModel optionForRow:indexPath.row];
    return ([self heightForText:option]+45);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCOptionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OptionsCell" forIndexPath:indexPath];
    
    NSString *option = [_viewModel optionForRow:indexPath.row];
    [cell setOptionText:option];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_viewModel selectedAnswerAtIndexPath:indexPath];
    [self nextButtonPressed:nil];
}

#pragma mark - Action Methods -

- (IBAction)submitButtonPressed:(UIButton *)sender {
    _viewModel.timerCallback = nil;
    [_viewModel submitButtonTapped];
}

- (IBAction)nextButtonPressed:(UIButton *)sender
{    
    [_viewModel nextButtonTapped];
    if([_viewModel shouldLoadNextQuestion])
        [self loadViewWithQuestion];
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
        float heightForLabel = [[_viewModel getHint] sizeOfStringWithFont:self.hintLabel.font constrainedToSize:CGSizeMake(self.hintLabel.frame.size.width, FLT_MAX) lineBreakMode:self.hintLabel.lineBreakMode].height;
        float heightForView = heightForLabel + kExtraHeightAfterHint;
        heightForView = heightForView < kMinimumHintHeight ? kMinimumHintHeight : heightForView;
        
        [self.hintView setHeight:heightForView];
        [self.hintLabel setHeight:heightForLabel];
        
        UIImage *editedImage = [self.hintPopUpImageView.image resizableImageWithCapInsets:UIEdgeInsetsMake(50.0, 10.0, 20.0, 10.0)];
        self.hintPopUpImageView.image = editedImage;
        self.hintView.center = self.hintHolderView.center;
        
        self.hintLabel.text = [_viewModel getHint];
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
