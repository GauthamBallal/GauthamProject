//
//  MMVMGamePlayViewController.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 23/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMVMGamePlayViewModel.h"

@interface MMVMGamePlayView : UIViewController

@property (strong,nonatomic) MMVMGamePlayViewModel *viewModel;

@end
