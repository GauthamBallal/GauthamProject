//
//  GKBNavigationBar.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CDNavigationBarDelegate <NSObject>
//-(void)hintButtonPressed;
@end

@interface GKBNavigationBar : UIView


@property (nonatomic,weak) id <CDNavigationBarDelegate> delegate;

-(void)shouldHideBackButton:(BOOL)shouldHide;
-(void)shouldHideHintButton:(BOOL)shouldHide;

@end
