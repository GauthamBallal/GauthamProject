//
//  MVPGamePlayInteractor.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 07/04/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MVPGamePlayInteractor <NSObject>

-(NSArray*)getAllQuestions;
-(void)setUsersAnswers:(NSArray*)userAnswers;
@end
