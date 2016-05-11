//
//  MJProgressViewViewController.m
//  MJProgressView
//
//  Created by minjoongkim on 05/10/2016.
//  Copyright (c) 2016 minjoongkim. All rights reserved.
//

#import "MJProgressViewViewController.h"

@interface MJProgressViewViewController ()

@end

@implementation MJProgressViewViewController
@synthesize progress;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *color = [[NSArray alloc]initWithObjects:[UIColor blueColor], [UIColor redColor], [UIColor orangeColor], nil];
    progress = [[MJProgressView alloc] initWithFrame:CGRectMake(20, 200, 280, 2) progressCount:3 color:color];
    [self.view addSubview:progress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)percenty0:(id)sender {
    [progress setProgressAnimation:0.0];
}
-(IBAction)percenty20:(id)sender {
    [progress setProgressAnimation:0.2];
}
-(IBAction)percenty40:(id)sender {
    [progress setProgressAnimation:0.4];
}
-(IBAction)percenty60:(id)sender {
    [progress setProgressAnimation:0.6];
}
-(IBAction)percenty80:(id)sender {
    [progress setProgressAnimation:0.8];
}
-(IBAction)percenty100:(id)sender {
    [progress setProgressAnimation:1.0];
}
-(IBAction)percentyAuto:(id)sender {
    [progress startForTimeSecond:5];
}
@end

