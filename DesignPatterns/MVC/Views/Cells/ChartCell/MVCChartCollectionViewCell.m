//
//  CDChartCollectionViewCell.m
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import "MVCChartCollectionViewCell.h"

#define kTopOffset 25
#define kBottomOffset 30

@interface MVCChartCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIView *chartView;
@property (weak, nonatomic) IBOutlet UILabel *topicName;
@property (weak, nonatomic) IBOutlet UILabel *topicPercentage;

@end

@implementation MVCChartCollectionViewCell

-(void)updateWithMark:(float)mark forTopicName:(NSString*)topicName
{
    float totalHeight = self.frame.size.height - kTopOffset - kBottomOffset;
    float height = (mark*totalHeight)/100.0;
    [self.chartView setHeight:height];
    [self.chartView setY:(totalHeight-height+kTopOffset)];
    
    self.topicName.text = topicName;
    self.topicPercentage.text = [NSString stringWithFormat:@"%.0f",mark];
    [self.topicPercentage setY:(self.chartView.frame.origin.y - self.topicPercentage.frame.size.height)];
}
@end
