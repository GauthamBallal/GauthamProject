//
//  MVPPackageListingPresenter.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 06/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import "MVPPackageListingPresenter.h"
#import "GKBDataSourceManager.h"

@implementation MVPPackageListingPresenter


- (instancetype)initWithView:(id<MVPPackageListingView>)view
{
    self = [super init];
    if (self) {
        self.view = view;
        self.interactor = [GKBDataSourceManager sharedGKBDataSourceManager];
    }
    return self;
}





@end
