//
//  MVPGameplayView.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 07/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MVPGamePlayView <NSObject>
-(void)loadDataToView;

-(void)setTimerText:(NSString*)timetoSet;

-(void)noDataAvailable;
@end
