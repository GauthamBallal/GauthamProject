//
//  MVPAllAnswersPresenter.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 12/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MVPAllAnswersPresenter.h"
#import "MVPAllAnswerInteractor.h"
#import "MVPInteractor.h"

@interface MVPAllAnswersPresenter ()
@property (nonatomic, weak) id <MVPAllAnswersView> view;
@property (nonatomic, weak) id <MVPAllAnswerInteractor> interactor;
@property(nonatomic,strong) NSArray *answers;

@end

@implementation MVPAllAnswersPresenter

- (instancetype)initWithView:(id<MVPAllAnswersView>)view
{
    self = [super init];
    if (self) {
        self.view = view;
        self.interactor = [MVPInteractor sharedMVPInteractor];
    }
    return self;
}

-(void)loadData
{
    self.answers = [self.interactor getAllAnswers];
    if(self.answers.count > 0)
        [self.view loadDataToView];
}

-(NSInteger)totalItems
{
    return self.answers.count;
}

-(id)itemAtIndex:(NSInteger)index
{
    if(self.answers.count > index)
        return [self.answers objectAtIndex:index];
    return nil;
}

-(void)goToMainMenuTapped
{
    [BASE_VIEWCONTROLLER popViewRootViewControllerAnimated:YES];
}


@end
