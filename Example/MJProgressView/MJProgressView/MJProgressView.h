//
//  MJProgressView.h
//  MJProgressView
//
//  Created by 모바일보안팀 on 2016. 5. 9..
//  Copyright © 2016년 minjoongkim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJProgressView : UIView {
    NSMutableArray *arrProgress;
    float timeSecondAddValue;
    float progressValue;
    NSTimer *timer;
    
    float purposeValue;
}

- (instancetype)initWithFrame:(CGRect)frame progressCount:(int)count color:(NSArray*) color;
-(void)startForTimeSecond:(int)second;
-(void)setProgress:(float)value;
-(void)setProgressAnimation:(float)value ;
@end
