//
//  UIStoryboard+Cleverdale.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "UIStoryboard+DesignPatterns.h"

@implementation UIStoryboard (DesignPatterns)

+(UIStoryboard*)loginStoryBoard
{
    return [UIStoryboard storyboardWithName:@"LoginStoryboard" bundle:nil];
}

+(UIStoryboard*)gameMVCStoryBoard
{
    return [UIStoryboard storyboardWithName:@"MVCGameStoryboard" bundle:nil];
}
@end
