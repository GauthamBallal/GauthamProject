//
//  MMVMResultViewController.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 24/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMVMResultViewModel.h"


@interface MMVMResultViewController : UIViewController

@property(nonatomic,strong) MMVMResultViewModel *viewModel;

@end
