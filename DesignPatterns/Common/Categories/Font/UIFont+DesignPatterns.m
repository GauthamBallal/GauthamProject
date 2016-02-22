//
//  UIFont+CleverDale.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "UIFont+DesignPatterns.h"

@implementation UIFont (DesignPatterns)


+(UIFont*)helvaticaLight45WithSize:(float)size
{
    return [UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:size];
}

+(UIFont*)helvaticaRoman55WithSize:(float)size
{
    return [UIFont fontWithName:@"HelveticaNeueLTStd-Roman" size:size];
}


@end
