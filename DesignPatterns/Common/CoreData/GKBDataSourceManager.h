//
//  GKBDataSourceManager.h
//  CoreDataSample
//
//  Created by Gautham Krishna Ballal on 18/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKBDataSourceManager : NSObject
+ (GKBDataSourceManager*)sharedGKBDataSourceManager;

-(NSArray*)getAllTests;
@end
