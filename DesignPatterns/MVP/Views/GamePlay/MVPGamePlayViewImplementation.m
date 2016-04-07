//
//  MVPGamePlayViewImplementation.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 07/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MVPGamePlayViewImplementation.h"

@interface MVPGamePlayViewImplementation ()
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
@property (nonatomic,strong) NSTimer *timer;

- (IBAction)submitButtonPressed:(UIButton *)sender;
- (IBAction)nextButtonPressed:(UIButton *)sender;
- (IBAction)hintGotItButtonPressed:(UIButton *)sender;
@end

@implementation MVPGamePlayViewImplementation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action Methods - 
- (IBAction)submitButtonPressed:(UIButton *)sender
{
    
}

- (IBAction)nextButtonPressed:(UIButton *)sender
{
    
}

- (IBAction)hintGotItButtonPressed:(UIButton *)sender
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
