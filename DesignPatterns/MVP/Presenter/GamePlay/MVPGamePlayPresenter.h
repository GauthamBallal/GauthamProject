//
//  MVPGamePlayPresenter.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 07/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPBasePresenter.h"
#import "MVPGamePlayView.h"
#import "MVPGamePlayInteractor.h"

@interface MVPGamePlayPresenter : MVPBasePresenter

- (instancetype)initWithView:(id<MVPGamePlayView>)view;

@property (nonatomic, weak) id <MVPGamePlayView> view;
@property (nonatomic, weak) id <MVPGamePlayInteractor> interactor;

-(int)getQuestionNumber;
-(BOOL)shouldLoadNextQuestion;
-(void)nextButtonTapped;
-(void)submitButtonTapped;
@end
