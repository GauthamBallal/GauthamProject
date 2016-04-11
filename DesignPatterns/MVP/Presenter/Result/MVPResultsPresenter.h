//
//  MVPresultsPresenter.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 11/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPResultView.h"
#import "MVPResultsInteractor.h"
#import "MVPBasePresenter.h"

@interface MVPResultsPresenter : MVPBasePresenter

- (instancetype)initWithView:(id<MVPResultView>)view;

@property (nonatomic, weak) id <MVPResultView> view;
@property (nonatomic, weak) id <MVPResultsInteractor> interactor;

-(NSString*)getResultText;
-(void)showAllAnswerButonTapped;
@end
