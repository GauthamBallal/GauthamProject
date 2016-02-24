//
//  MMVMAllAnswersViewModel.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 24/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMVMAllAnswersInterface.h"

@interface MMVMAllAnswersViewModel : NSObject <MMVMAllAnswersInterface>

@property (strong,nonatomic) NSArray *questionsArray;

@end
