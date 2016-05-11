//
//  MJProgressViewViewController.h
//  MJProgressView
//
//  Created by minjoongkim on 05/10/2016.
//  Copyright (c) 2016 minjoongkim. All rights reserved.
//

@import UIKit;
#import "MJProgressView.h"

@interface MJProgressViewViewController : UIViewController

@property (nonatomic, strong) MJProgressView *progress;

-(IBAction)percenty20:(id)sender;
-(IBAction)percenty40:(id)sender;
-(IBAction)percenty60:(id)sender;
-(IBAction)percenty80:(id)sender;
-(IBAction)percenty100:(id)sender;

@end
