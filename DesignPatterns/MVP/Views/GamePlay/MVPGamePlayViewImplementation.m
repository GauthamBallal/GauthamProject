//
//  MVPGamePlayViewImplementation.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 07/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MVPGamePlayViewImplementation.h"
#import "GKBNavigationBar.h"
#import "GKBQuestion.h"
#import "MVPGamePlayPresenter.h"
#import "MVCOptionsTableViewCell.h"

#define kMinimumHintHeight 128
#define kExtraHeightAfterHint 86

@interface MVPGamePlayViewImplementation ()
@property (weak, nonatomic) IBOutlet UIButton *timerButton;
@property (weak, nonatomic) IBOutlet UIButton *packageNameButton;
@property (weak, nonatomic) IBOutlet UIView *questionView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *hintHolderView;
@property (weak, nonatomic) IBOutlet UIView *hintView;
@property (weak, nonatomic) IBOutlet UIImageView *hintPopUpImageView;
@property (weak, nonatomic) IBOutlet UILabel *hintLabel;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@property (nonatomic,strong) MVPGamePlayPresenter *presenter;

- (IBAction)submitButtonPressed:(UIButton *)sender;
- (IBAction)nextButtonPressed:(UIButton *)sender;
- (IBAction)hintGotItButtonPressed:(UIButton *)sender;
@end

@implementation MVPGamePlayViewImplementation

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.presenter = [[MVPGamePlayPresenter alloc]initWithView:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hintTapped:) name:kHintNotification object:nil];
    
    self.questionLabel.numberOfLines = 0;
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
    [self.presenter loadData];
}

#pragma mark - MVPGamePlayView

-(void)loadDataToView
{
    [self loadViewWithQuestion];
}

-(void)setTimerText:(NSString*)timetoSet
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(timetoSet == nil)
            [self submitButtonPressed:nil];
        else if(_timerButton)
            [self.timerButton setTitle:timetoSet forState:UIControlStateNormal];
    });
}

-(void)noDataAvailable
{
    self.errorLabel.hidden = NO;
}


#pragma mark - Private Methods -

-(NSString*)getOptionForQuestion:(GKBQuestion*)question atIndex:(NSInteger)index
{
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
    return option;
}


-(void)loadViewWithQuestion
{
    self.tableView.alpha = 0.1;
    GKBQuestion *question = [self.presenter itemAtIndex:0];
    NSString *questionText = [NSString stringWithFormat:@"Q %d.%@",[self.presenter getQuestionNumber]+1,question.question];
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
    NSString *option = [self getOptionForQuestion:[self.presenter itemAtIndex:indexPath.row] atIndex:indexPath.row];
    return ([self heightForText:option]+45);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.presenter totalItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCOptionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OptionsCell" forIndexPath:indexPath];
    
    NSString *option = [self getOptionForQuestion:[self.presenter itemAtIndex:indexPath.row] atIndex:indexPath.row];
    [cell setOptionText:option];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_presenter cellTappedAtIndex:indexPath.row];
    [self nextButtonPressed:nil];
}

#pragma mark - Action Methods -

- (IBAction)submitButtonPressed:(UIButton *)sender {
    [_presenter submitButtonTapped];
}

- (IBAction)nextButtonPressed:(UIButton *)sender
{
    [_presenter nextButtonTapped];
    if([_presenter shouldLoadNextQuestion])
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
        GKBQuestion *question = [self.presenter itemAtIndex:0];

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
