//
//  MVPPackageListingInteractor.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 06/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GKBTest;

@protocol MVPPackageListingInteractor <NSObject>
-(NSArray*)getAllTests;
-(void)setSelectedTest:(GKBTest *)selectedTest;
@end
