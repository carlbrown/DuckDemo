//
//  ViewController.h
//  DuckDemo
//
//  Created by Carl Brown on 4/21/12.
//  Copyright (c) 2012 PDAgent, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *duckView;
@property (nonatomic) float duckDelta;
@property (strong, nonatomic) CADisplayLink *timer;

-(IBAction) moveDuck:(id) sender;


@end
