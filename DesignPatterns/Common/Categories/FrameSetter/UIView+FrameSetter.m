//
//  UIFont+CleverDale.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "UIView+FrameSetter.h"

@implementation UIView (FrameSetter)
-(void)setX:(float)inX
{
    CGRect frame = self.frame;
    frame.origin.x = inX;
    self.frame = frame;
}
-(void)setY:(float)inY
{
    CGRect frame = self.frame;
    frame.origin.y = inY;
    self.frame = frame;
}
-(void)setWidth:(float)inWidth
{
    CGRect frame = self.frame;
    frame.size.width = inWidth;
    self.frame = frame;
}
-(void)setHeight:(float)inHeight
{
    CGRect frame = self.frame;
    frame.size.height = inHeight;
    self.frame = frame;
}
-(void)setSize:(CGSize)inSize
{
    CGRect frame = self.frame;
    frame.size = inSize;
    self.frame = frame;
}
-(void)setOrigin:(CGPoint)inOrigin
{
    CGRect frame = self.frame;
    frame.origin = inOrigin;
    self.frame = frame;
}

@end
