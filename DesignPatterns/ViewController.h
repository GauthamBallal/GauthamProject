//
//  ViewController.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal on 22/02/16.
//  Copyright © 2016 Gautham Krishna Ballal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(UINavigationController*)currentNavigationController;
-(void)pushViewController:(UIViewController*)viewControllerToBePushed withAnimation:(BOOL)animation;
-(void)popViewControllerAnimated:(BOOL)animation;
-(void)popViewRootViewControllerAnimated:(BOOL)animation;
@end

