//
//  GKBNavigationBar.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "GKBNavigationBar.h"

@interface GKBNavigationBar ()

@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@property (weak, nonatomic) IBOutlet UIButton *hintButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *maskView;


- (IBAction)settingsButtonTapped:(UIButton *)sender;
- (IBAction)hintButtonTapped:(UIButton *)sender;
- (IBAction)backButtonTapped:(UIButton *)sender;

@end

@implementation GKBNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)settingsButtonTapped:(UIButton *)sender {
    UIViewController *settingsVC = [[UIStoryboard loginStoryBoard] instantiateViewControllerWithIdentifier:@"CDSettingsVC"];
    
    [BASE_VIEWCONTROLLER pushViewController:settingsVC withAnimation:YES];
}

- (IBAction)hintButtonTapped:(UIButton *)sender {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kHintNotification object:nil];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.maskView.alpha = sender.selected ? 0.0 : 1.0;
    } completion:nil];
    sender.selected = !sender.selected;

    [[NSNotificationCenter defaultCenter] postNotificationName:kHintNotification object:nil userInfo:@{@"selected": [NSNumber numberWithInt:sender.selected]}];
    if(sender.selected)
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enableNavUserInteraction) name:kHintNotification object:nil];
}

-(void)enableNavUserInteraction
{
    [UIView animateWithDuration:0.5 animations:^{
        self.maskView.alpha = _hintButton.selected ? 0.0 : 1.0;
    } completion:nil];
    _hintButton.selected = !_hintButton.selected;
}

- (IBAction)backButtonTapped:(UIButton *)sender {
    [BASE_VIEWCONTROLLER popViewControllerAnimated:YES];
}

#pragma mark - Public Methods -

-(void)shouldHideBackButton:(BOOL)shouldHide
{
    self.backButton.hidden = shouldHide;
}

-(void)shouldHideHintButton:(BOOL)shouldHide
{
    self.hintButton.hidden = shouldHide;
}

@end
