//
//  MMVMPackageListingInterface.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#ifndef MMVMPackageListingInterface_h
#define MMVMPackageListingInterface_h

@protocol MMVMPackageListingInterface <NSObject>

-(NSInteger)numberOfRows;
-(NSString*)titleForRow:(NSInteger)row;
-(NSString*)descriptionForRow:(NSInteger)row;
-(NSString*)imageTitleForRow:(NSInteger)row;

-(void)tableCellTapped:(NSIndexPath*)indexPath;
@end

#endif /* MMVMPackageListingInterface_h */
