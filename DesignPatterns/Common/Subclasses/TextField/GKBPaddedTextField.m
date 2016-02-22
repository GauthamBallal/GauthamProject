//
//  IRPaddedTextField.m
//  Attire
//
//  Created by Gautham K Ballal
//  Copyright (c) 2016 Robosoft Technologies. All rights reserved.
//

#import "GKBPaddedTextField.h"

@implementation GKBPaddedTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
         self.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        
        [self setPlaceHolderFont];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        self.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        
        [self setPlaceHolderFont];
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, self.edgeInsets)];
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [super editingRectForBounds:UIEdgeInsetsInsetRect(bounds, self.edgeInsets)];
}


-(void)setPlaceHolderFont
{
    if(self.placeholder)
    {
        NSMutableAttributedString *attributedPlaceHolderString = [[NSMutableAttributedString alloc]initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: self.textColor}];
        self.attributedPlaceholder = attributedPlaceHolderString;
    }
}


@end
