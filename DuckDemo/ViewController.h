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
@property (strong, nonatomic) IBOutlet UIImageView *bulletView;
@property (nonatomic) float duckDelta;
@property (strong, nonatomic) CADisplayLink *timer;

-(IBAction) moveDuck:(id) sender;
-(IBAction) killDuck:(id) sender;
-(IBAction)startBullet:(id)sender;


@end
