//
//  MMVMResultViewModel.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 24/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMVMResultInterface.h"

@interface MMVMResultViewModel : NSObject <MMVMResultInterface>

@property (nonatomic,strong) NSArray *answers;

@end
