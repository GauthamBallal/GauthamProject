//
//  MMVMResultViewController.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 24/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MMVMResultView.h"
#import "GKBNavigationBar.h"

@interface MMVMResultView ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)showAnswersButtonTapped:(id)sender;

@end

@implementation MMVMResultView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.viewModel = [[MMVMResultViewModel alloc]init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.resultLabel.text = [_viewModel getResultText];
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

- (IBAction)showAnswersButtonTapped:(id)sender {
    [_viewModel showAllAnswerButonTapped];
}
@end
