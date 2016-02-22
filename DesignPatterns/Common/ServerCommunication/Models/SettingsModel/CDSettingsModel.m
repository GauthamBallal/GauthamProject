//
//  CDSettingsModel.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "CDSettingsModel.h"

@implementation CDSettingsModel

- (instancetype)initWithTitle:(NSString*)inTitle andSubTitle:(NSString*)inSubTitle andImageName:(NSString*)inImageName andArrowStatus:(BOOL)arrowStatus
{
    self = [super init];
    if (self) {
        self.title = inTitle ? inTitle : @"";
        self.subtitle = inSubTitle ? inSubTitle : @"";
        self.iconImageName = inImageName ? inImageName : @"settings_tc";
        self.shouldDisplayArrow = arrowStatus;
    }
    return self;
}
@end
