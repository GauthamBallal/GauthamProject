//
//  MVPAllAnswersPresenter.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 12/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPAllAnswersView.h"
#import "MVPBasePresenter.h"

@interface MVPAllAnswersPresenter : MVPBasePresenter

- (instancetype)initWithView:(id<MVPAllAnswersView>)view;

-(void)goToMainMenuTapped;
@end
