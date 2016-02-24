//
//  CDConstants.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal.
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IR_SYS_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define IR_SYS_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define IR_SYS_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IR_SYS_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define IR_SYS_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IS_RETINA_4 ([UIScreen mainScreen].bounds.size.height == 568) || ([UIScreen mainScreen].bounds.size.width == 568)

#define IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE

#define kCustomNavigationBarTag 9045


#define kHintNotification @"HintTapped"

#define kCDTestID @"testID"
#define kCDTestName @"testName"
#define kCDTestDescription @"testDescription"
#define kCDQuestionID @"questionID"
#define kCDQuestion @"question"
#define kCDQuestionOption1 @"optionOne"
#define kCDQuestionOption2 @"optionTwo"
#define kCDQuestionOption3 @"optionThree"
#define kCDQuestionOption4 @"optionFour"
#define kCDQuestionCorrectAnswer @"correctAnswer"
#define kCDQuestionHint @"hint"

typedef enum : NSUInteger {
    eMVC,
    eMMVM,
    eMVP
} DesignPattern;

#define kTotalGameTime 10
