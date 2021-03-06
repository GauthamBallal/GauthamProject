//
//  MVPPackageListingPresenter.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 06/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPPackageListingView.h"
#import "MVPPackageListingInteractor.h"
#import "MVPBasePresenter.h"

@interface MVPPackageListingPresenter : MVPBasePresenter

- (instancetype)initWithView:(id<MVPPackageListingView>)view;

@property (nonatomic, weak) id <MVPPackageListingView> view;
@property (nonatomic, weak) id <MVPPackageListingInteractor> interactor;

@end
