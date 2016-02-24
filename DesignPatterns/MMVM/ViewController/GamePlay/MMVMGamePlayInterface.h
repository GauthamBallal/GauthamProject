//
//  MMVMGamePlayInterface.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 24/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#ifndef MMVMGamePlayInterface_h
#define MMVMGamePlayInterface_h

@protocol MMVMGamePlayInterface <NSObject>

typedef void (^MMVMTimerCallack)(NSString *timeToSet);

@property (assign,nonatomic) int currentTime;
@property (nonatomic,strong) NSString *userSelectedAnswer;
@property (nonatomic,strong) NSTimer *timer;
@property (strong,nonatomic) NSArray *questionsArray;
@property (assign,nonatomic) int currentQuestion;
@property (weak,nonatomic) MMVMTimerCallack timerCallback;

-(void)setInitialTime:(MMVMTimerCallack)callback;

-(NSString*)optionForRow:(NSInteger)row;
-(NSString*)getQuestionText;
-(NSString*)getHint;
-(NSInteger)numberOfRows;
-(int)getQuestionNumber;

-(void)selectedAnswerAtIndexPath:(NSIndexPath*)indexPath;
-(BOOL)shouldLoadNextQuestion;

-(void)nextButtonTapped;
-(void)submitButtonTapped;

@end

#endif /* MMVMGamePlayInterface_h */
