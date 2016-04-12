//
//  MVPAllAnswersViewImplementation.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 12/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MVPAllAnswersViewImplementation.h"
#import "MVPAllAnswersPresenter.h"
#import "MVCAllAnswersTableViewCell.h"
#import "GKBQuestion.h"

@interface MVPAllAnswersViewImplementation ()<MVPAllAnswersView>
@property (weak, nonatomic) IBOutlet UITableView *allAnswersTableView;
- (IBAction)goToMainMenuTapped:(id)sender;
@property (nonatomic,strong) MVPAllAnswersPresenter *presenter;

@end

@implementation MVPAllAnswersViewImplementation

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.presenter = [[MVPAllAnswersPresenter alloc]initWithView:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_presenter loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)loadDataToView
{
    [self.allAnswersTableView reloadData];
}

-(float)heightForIndexPath:(NSIndexPath*)indexPath
{
    GKBQuestion *question = [_presenter itemAtIndex:indexPath.row];
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
    return [_presenter totalItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCAllAnswersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllAnswersCell" forIndexPath:indexPath];
    
    GKBQuestion *question = [_presenter itemAtIndex:indexPath.row];
    [cell constructCellWithQuestion:question];
    return cell;
}

- (IBAction)goToMainMenuTapped:(id)sender {
    [_presenter goToMainMenuTapped];
}

@end
