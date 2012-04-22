//
//  ViewController.m
//  DuckDemo
//
//  Created by Carl Brown on 4/21/12.
//  Copyright (c) 2012 PDAgent, LLC. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#import <AudioToolbox/AudioServices.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize duckView;
@synthesize bulletView;
@synthesize duckDelta;
@synthesize bulletDelta;
@synthesize timer;

-(IBAction) moveDuckAndBullet:(id) sender {
  CGRect frame=  self.duckView.frame;
  
  frame.origin.x += self.duckDelta;
  
  if (frame.origin.x < 0) {
    frame.origin.x = 0;
    self.duckDelta = self.duckDelta * -1;
  }
  if ((frame.origin.x + frame.size.width) > self.view.frame.size.width) {
    frame.origin.x = (self.view.frame.size.width - frame.size.width);
    self.duckDelta = self.duckDelta * -1;
  }
  
  self.duckView.frame = frame;
  
  if (self.bulletView) {
    CGRect bulletFrame=  self.bulletView.frame;
    bulletFrame.origin.y += self.bulletDelta;
    self.bulletView.frame = bulletFrame;
  }
  
  if ([self isDuckHit]) {
    [self killDuck:nil];
  }
}

-(IBAction) killDuck:(id) sender {
  AudioServicesPlaySystemSound(quackSound);
  [self.timer invalidate];
  self.timer = nil;
  self.duckView.image = [UIImage imageNamed:@"dead_duck.jpg"];
  
  SystemSoundID quackSound;
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:@"quack" withExtension:@"wav"], &quackSound);

  AudioServicesPlaySystemSound(quackSound);
  
  
}

-(IBAction)startBullet:(id)sender {
  
  if (self.bulletView) {
    [self.bulletView removeFromSuperview];
  }
  self.bulletView = [[UIImageView alloc] initWithFrame:CGRectMake(80.f, 400.0f, 20.0f, 30.0f)];
  
  
  self.bulletView.image = [UIImage imageNamed:@"bullet.png"];

  [self.view addSubview:self.bulletView];
}

-(BOOL)isDuckHit {
  return CGRectIntersectsRect(self.duckView.frame,self.bulletView.frame);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.duckDelta = -4.0f;
  self.bulletDelta = -10.0f;
  self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(moveDuckAndBullet:)];
[self.timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)viewDidUnload
{
    [self setDuckView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
