//
//  MMVMAllAnswersViewController.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 24/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MMVMAllAnswersView.h"
#import "GKBQuestion.h"
#import "MMVMAllAnswersTableViewCell.h"

@interface MMVMAllAnswersView ()
@property (weak, nonatomic) IBOutlet UITableView *allAnswersTableView;

- (IBAction)goToMainMenuTapped:(id)sender;
@end

@implementation MMVMAllAnswersView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.viewModel = [[MMVMAllAnswersViewModel alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.allAnswersTableView reloadData];
}

-(float)heightForIndexPath:(NSIndexPath*)indexPath
{
    NSString *question = [_viewModel getQuestionTextForRow:indexPath.row];
    float questionHeight = [question sizeOfStringWithFont:[UIFont helvaticaRoman55WithSize:13.0] constrainedToSize:CGSizeMake(280, FLT_MAX) lineBreakMode:NSLineBreakByTruncatingTail].height;
    NSString *answer = [_viewModel getAnswerTextForRow:indexPath.row];
    float answerHeight = [answer sizeOfStringWithFont:[UIFont helvaticaLight45WithSize:13.0] constrainedToSize:CGSizeMake(280, FLT_MAX) lineBreakMode:NSLineBreakByTruncatingTail].height;
    
    return questionHeight + answerHeight + 65 + 30;
}


#pragma mark - UITableViewDataSource -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self heightForIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_viewModel numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMVMAllAnswersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllAnswersCell" forIndexPath:indexPath];
    
    NSString *question = [_viewModel getQuestionTextForRow:indexPath.row];
    NSString *answer = [_viewModel getAnswerTextForRow:indexPath.row];
    NSString *userAnswer = [_viewModel getUserAnswerTextForRow:indexPath.row];

    [cell.backgroundImageView setY:10];
    [cell.backgroundImageView setHeight:(cell.frame.size.height - 10)];
    
    float questionHeight = [question sizeOfStringWithFont:[UIFont helvaticaRoman55WithSize:13.0] constrainedToSize:CGSizeMake(280, FLT_MAX) lineBreakMode:NSLineBreakByTruncatingTail].height;
    float answerHeight = [answer sizeOfStringWithFont:[UIFont helvaticaLight45WithSize:13.0] constrainedToSize:CGSizeMake(280, FLT_MAX) lineBreakMode:NSLineBreakByTruncatingTail].height;
    [cell.questionLabel setHeight:questionHeight];
    
    [cell.answerButton setY:(cell.questionLabel.frame.origin.y + questionHeight + 20)];
    [cell.answerButton setHeight:(answerHeight+30)];
    cell.questionLabel.text = question;
    
    if(userAnswer)
    {
        BOOL correctAnswer = [_viewModel isUserAnswerCorrectForRow:indexPath.row];
        [cell setBackgroundForState:correctAnswer];
        [cell.answerButton setAttributedTitle:[[NSAttributedString alloc]initWithString:answer] forState:UIControlStateNormal];
    }
    else
    {
        [cell setBackgroundForState:NO];
        [cell.answerButton setAttributedTitle:[[NSAttributedString alloc]initWithString:@"Not Answered"] forState:UIControlStateNormal];
    }
    
    return cell;
}

- (IBAction)goToMainMenuTapped:(id)sender {
    [_viewModel goToMainMenuTapped];

}
@end
