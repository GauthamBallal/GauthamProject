//
//  MVPInteractor.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 07/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPPackageListingInteractor.h"
#import "MVPGamePlayInteractor.h"
#import "MVPResultsInteractor.h"

@interface MVPInteractor : NSObject <MVPPackageListingInteractor,MVPGamePlayInteractor,MVPResultsInteractor>

+ (MVPInteractor*)sharedMVPInteractor;
@end
