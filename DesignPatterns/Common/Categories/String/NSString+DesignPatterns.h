//
//  NSString+CleverDale.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DesignPatterns)

- (CGSize)sizeOfStringWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
