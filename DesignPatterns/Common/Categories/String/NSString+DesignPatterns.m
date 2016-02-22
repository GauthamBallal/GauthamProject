//
//  NSString+CleverDale.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "NSString+DesignPatterns.h"

@implementation NSString (DesignPatterns)

/**
 This Method returns the size required for the word
 
 @param string : string whose size is to be determined
 @param font : font of string whose size is to be determined
 @param size : min size for the sting
 @param lineBreakMode : lineBreakMode to be used to display the string
 
 @return CGSize : size required for the word
 */
- (CGSize)sizeOfStringWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    CGSize stringSize;
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = lineBreakMode;
    
    NSDictionary * stringAttributes = @{ NSFontAttributeName: font, paragraphStyle: NSParagraphStyleAttributeName};
    
    stringSize = [self boundingRectWithSize:size
                                    options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                 attributes:stringAttributes context:nil].size;
    
    stringSize = CGSizeMake(ceil(stringSize.width), ceil(stringSize.height));
    
    return stringSize;
}

@end
