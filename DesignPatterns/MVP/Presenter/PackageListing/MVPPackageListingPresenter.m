//
//  MVPPackageListingPresenter.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 06/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MVPPackageListingPresenter.h"
#import "MVPInteractor.h"

@interface MVPPackageListingPresenter ()
@property(nonatomic,strong) NSArray *testsArray;
@end

@implementation MVPPackageListingPresenter


- (instancetype)initWithView:(id<MVPPackageListingView>)view
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
    self.testsArray = [self.interactor getAllTests];
    if(self.testsArray.count > 0)
        [self.view loadDataToView];
    else
        [self.view noDataAvailable];
}

-(NSInteger)totalItems
{
    return self.testsArray.count;
}

-(id)itemAtIndex:(NSInteger)index
{
    if(self.testsArray.count > index)
        return [self.testsArray objectAtIndex:index];
    return nil;
}

-(void)cellTappedAtIndex:(NSInteger)index
{
    [self.interactor setSelectedTest:_testsArray[index]];
//    MMVMGamePlayView *gameViewController = [[UIStoryboard gameMMVMStoryBoard] instantiateViewControllerWithIdentifier:@"CDGamePlayVC"];
//    [BASE_VIEWCONTROLLER pushViewController:gameViewController withAnimation:YES];
}
@end
