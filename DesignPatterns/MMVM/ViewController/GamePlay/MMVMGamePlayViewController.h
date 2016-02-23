//
//  MMVMGamePlayViewController.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMVMGamePlayInterface <NSObject>

@property (assign,nonatomic) int currentTime;
@property (nonatomic,strong) NSString *userSelectedAnswer;
@property (nonatomic,strong) NSTimer *timer;
@property (strong,nonatomic) NSArray *questionsArray;
@property (assign,nonatomic) int currentQuestion;

@end

@interface MMVMGamePlayViewController : UIViewController

@end
