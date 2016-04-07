//
//  MVPInteractor.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 07/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MVPInteractor.h"
#import "GKBDataSourceManager.h"
#import "GKBTest.h"

@interface MVPInteractor ()
@property (nonatomic,strong) GKBTest *selectedTest;
@end

@implementation MVPInteractor
static MVPInteractor *sharedObject = nil;

+ (MVPInteractor*)sharedMVPInteractor
{
    if(!sharedObject)
    {
        sharedObject = [[MVPInteractor alloc]init];
    }
    return sharedObject;
}

-(NSArray*)getAllTests
{
    return [[GKBDataSourceManager sharedGKBDataSourceManager] getAllTests];
}

-(void)setSelectedTest:(GKBTest *)selectedTest
{
    _selectedTest = selectedTest;
}

-(NSArray*)getAllQuestions
{
    return [self.selectedTest.questions allObjects];
}

@end
