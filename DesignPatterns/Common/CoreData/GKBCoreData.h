//
//  DuluxPillars.h
//  DataConversionDulux
//
//  Created by Gautham K Ballal on 09/04/13.
//  Copyright (c) 2013 Gautham K Ballal. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface GKBCoreData : NSObject {

}

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
+(id)sharedCoreDataObject;
- (void)saveContext;
@end
