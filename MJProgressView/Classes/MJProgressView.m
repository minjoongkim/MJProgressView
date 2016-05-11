//
//  MJProgressView.m
//  MJProgressView
//
//  Created by 모바일보안팀 on 2016. 5. 9..
//  Copyright © 2016년 minjoongkim. All rights reserved.
//

#import "MJProgressView.h"
#import "MJProgressViewController.h"
@implementation MJProgressView

- (instancetype)initWithFrame:(CGRect)frame progressCount:(int)count color:(NSArray*) color{
    
    self = [super initWithFrame:frame];
    if (self) {
        arrProgress = [[NSMutableArray alloc] init];
        
        for(int i=0; i<count; i++) {
            
            float xPosition = 0.0f;
            if(i==0) {
                xPosition = 0.0f;
            }else {
                xPosition = frame.size.width * i / count-i;
            }
            
            MJProgressViewController *progress =
            [[MJProgressViewController alloc] initWithFrame:CGRectMake(xPosition, 0.0f, frame.size.width/count, frame.size.height)];
            progress.tintColor = [color objectAtIndex:i];
            
            [arrProgress addObject:progress];
            [self addSubview:progress];
        }
    }
    return self;
}


-(void)startForTimeSecond:(int)second {
    purposeValue = 1.0f;
    progressValue = 0.0f;
    for(int i=0; i<[arrProgress count]; i++) {
        MJProgressViewController *progress = [arrProgress objectAtIndex:i];
        progressValue += progress.progress;
    }
    progressValue = progressValue / [arrProgress count];
    
    timeSecondAddValue =  0.01 * 1/ second;
    if(timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(addProgressValueTimer:) userInfo:nil repeats:YES];
    }
}

-(void)addProgressValueTimer :(id)temp{
    
    progressValue += timeSecondAddValue;
    [self setProgress:progressValue];
    if(progressValue >= purposeValue) {
        [timer invalidate];
        timer = nil;
    }
}
-(void)minusProgressValueTimer :(id)temp{
    
    progressValue -= timeSecondAddValue;
    [self setProgress:progressValue];
    if(progressValue <= purposeValue) {
        [timer invalidate];
        timer = nil;
    }
}
-(void)setProgress:(float)value {
    value = value * [arrProgress count];
    for(int i=0; i<[arrProgress count]; i++) {
        MJProgressViewController *progress = [arrProgress objectAtIndex:i];
        float nowProgressValue = value - i;
        if(nowProgressValue > 0) {
            [progress setProgress:nowProgressValue];
        }else {
            [progress setProgress:0.0f];
        }
        
    }
}

-(void)setProgressAnimation:(float)value {
    timeSecondAddValue =  0.01 * 1;
    purposeValue = value;
    progressValue = 0.0f;
    for(int i=0; i<[arrProgress count]; i++) {
        MJProgressViewController *progress = [arrProgress objectAtIndex:i];
        progressValue += progress.progress;
    }
    progressValue = progressValue / [arrProgress count];
    
    if(timer == nil) {
        if(progressValue < purposeValue) {
            timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(addProgressValueTimer:) userInfo:nil repeats:YES];
        }else {
            timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(minusProgressValueTimer:) userInfo:nil repeats:YES];
        }
    }
}
@end
