//
//  CDChartCollectionViewCell.h
//  DesignPatterns
//
//  Created by Gautham Krishna Ballal
//  Copyright (c) 2016 GauthamBallal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVCChartCollectionViewCell : UICollectionViewCell

-(void)updateWithMark:(float)mark forTopicName:(NSString*)topicName;
@end
