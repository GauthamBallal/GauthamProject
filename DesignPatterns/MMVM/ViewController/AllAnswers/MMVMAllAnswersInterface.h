//
//  MMVMAllAnswersInterface.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 24/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#ifndef MMVMAllAnswersInterface_h
#define MMVMAllAnswersInterface_h

@protocol MMVMAllAnswersInterface <NSObject>

-(NSInteger)numberOfRows;
-(NSString*)getQuestionTextForRow:(NSInteger)row;
-(NSString*)getAnswerTextForRow:(NSInteger)row;
-(NSString*)getUserAnswerTextForRow:(NSInteger)row;
-(BOOL)isUserAnswerCorrectForRow:(NSInteger)row;

-(void)goToMainMenuTapped;
@end

#endif /* MMVMAllAnswersInterface_h */
