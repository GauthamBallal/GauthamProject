//
//  GKBQuestion.h
//  CoreDataSample
//
//  Created by Gautham Krishna Ballal on 18/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GKBTest;

NS_ASSUME_NONNULL_BEGIN

@interface GKBQuestion : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
@property(nonatomic,strong) NSString *userAnswer;
@end

NS_ASSUME_NONNULL_END

#import "GKBQuestion+CoreDataProperties.h"
