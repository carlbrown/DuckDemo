//
//  ViewController.h
//  DuckDemo
//
//  Created by Carl Brown on 4/21/12.
//  Copyright (c) 2012 PDAgent, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *duckView;
@property (strong, nonatomic) IBOutlet UIImageView *bulletView;
@property (strong, nonatomic) CADisplayLink *timer;
@property (nonatomic) SystemSoundID quackSound;

-(IBAction) moveDuckAndBullet:(id) sender;
-(IBAction) killDuck:(id) sender;
-(IBAction)startBullet:(id)sender;

-(BOOL)isDuckHit;


@end
