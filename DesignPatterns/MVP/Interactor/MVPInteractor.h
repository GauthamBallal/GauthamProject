//
//  MVPInteractor.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 07/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPPackageListingInteractor.h"

@interface MVPInteractor : NSObject <MVPPackageListingInteractor>

+ (MVPInteractor*)sharedMVPInteractor;
@end
