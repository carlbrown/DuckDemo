//
//  ViewController.m
//  DuckDemo
//
//  Created by Carl Brown on 4/21/12.
//  Copyright (c) 2012 PDAgent, LLC. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize duckView;
@synthesize duckDelta;
@synthesize timer;

-(IBAction) moveDuck:(id) sender {
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
}

-(IBAction) killDuck:(id) sender {
  [self.timer removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
  self.timer = nil;
  self.duckView.image = [UIImage imageNamed:@"dead_duck.jpg"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.duckDelta = -4.0f;
  self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(moveDuck:)];
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
