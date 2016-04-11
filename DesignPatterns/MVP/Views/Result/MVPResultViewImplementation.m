//
//  MVPResultViewImplementation.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 11/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MVPResultViewImplementation.h"
#import "MVPResultsPresenter.h"
#import "GKBNavigationBar.h"

@interface MVPResultViewImplementation ()
@property (nonatomic,strong) MVPResultsPresenter *presenter;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)showAnswersButtonTapped:(id)sender;
@end

@implementation MVPResultViewImplementation

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.presenter = [[MVPResultsPresenter alloc] initWithView:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.presenter loadData];
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

-(void)loadDataToView
{
    self.resultLabel.text = [self.presenter getResultText];
}

- (IBAction)showAnswersButtonTapped:(id)sender
{
    [self.presenter showAllAnswerButonTapped];
}

@end
