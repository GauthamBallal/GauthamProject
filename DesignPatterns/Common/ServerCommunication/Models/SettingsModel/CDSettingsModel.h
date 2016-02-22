//
//  CDSettingsModel.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDSettingsModel : NSObject

@property (nonatomic,strong) NSString *iconImageName,*title,*subtitle;
@property (nonatomic,assign) BOOL shouldDisplayArrow;

- (instancetype)initWithTitle:(NSString*)inTitle andSubTitle:(NSString*)inSubTitle andImageName:(NSString*)inImageName andArrowStatus:(BOOL)arrowStatus;
@end
