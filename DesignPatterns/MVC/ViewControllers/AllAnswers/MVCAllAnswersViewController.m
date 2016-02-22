//
//  CDAllAnswersViewController.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "MVCAllAnswersViewController.h"
#import "GKBQuestion.h"
#import "MVCAllAnswersTableViewCell.h"

@interface MVCAllAnswersViewController ()
@property (weak, nonatomic) IBOutlet UITableView *allAnswersTableView;
- (IBAction)goToMainMenuTapped:(id)sender;

@end

@implementation MVCAllAnswersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(float)heightForIndexPath:(NSIndexPath*)indexPath
{
    GKBQuestion *question = [_questionsArray objectAtIndex:indexPath.row];
    float questionHeight = [question.question sizeOfStringWithFont:[UIFont helvaticaRoman55WithSize:13.0] constrainedToSize:CGSizeMake(280, FLT_MAX) lineBreakMode:NSLineBreakByTruncatingTail].height;
    float answerHeight = [question.correctAnswer sizeOfStringWithFont:[UIFont helvaticaLight45WithSize:13.0] constrainedToSize:CGSizeMake(280, FLT_MAX) lineBreakMode:NSLineBreakByTruncatingTail].height;
    
    return questionHeight + answerHeight + 65 + 30;
}


#pragma mark - UITableViewDataSource -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self heightForIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.questionsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCAllAnswersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllAnswersCell" forIndexPath:indexPath];
    
    GKBQuestion *question = [_questionsArray objectAtIndex:indexPath.row];
    [cell constructCellWithQuestion:question];
    return cell;
}

- (IBAction)goToMainMenuTapped:(id)sender {
    [BASE_VIEWCONTROLLER popViewRootViewControllerAnimated:YES];
}
@end
