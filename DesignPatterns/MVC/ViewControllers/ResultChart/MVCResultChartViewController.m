//
//  CDResultChartViewController.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "MVCResultChartViewController.h"
#import "MVCChartCollectionViewCell.h"
#import "MVCAllAnswersViewController.h"

@interface MVCResultChartViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *chartCollectionView;

- (IBAction)showAnswersTapped:(UIButton *)sender;
@end

@implementation MVCResultChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
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

- (IBAction)showAnswersTapped:(UIButton *)sender {
    MVCAllAnswersViewController *allAnswers = [[UIStoryboard gameMVCStoryBoard] instantiateViewControllerWithIdentifier:@"CDAllAnswersVC"];
    allAnswers.questionsArray = self.questionsArray;
    [BASE_VIEWCONTROLLER pushViewController:allAnswers withAnimation:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MVCChartCollectionViewCell *chartCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ChartCell" forIndexPath:indexPath];
    [chartCell updateWithMark:(indexPath.row*10) forTopicName:[NSString stringWithFormat:@"TOP %ld",(long)indexPath.row]];
    return chartCell;
}
@end
