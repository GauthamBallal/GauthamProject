//
//  MMVMGamePlayViewModel.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMVMGamePlayInterface.h"
#import "GKBTest.h"

@interface MMVMGamePlayViewModel : NSObject <MMVMGamePlayInterface>

@property (nonatomic,strong) GKBTest *test;
@end
