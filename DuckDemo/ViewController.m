//
//  ViewController.m
//  DuckDemo
//
//  Created by Carl Brown on 4/21/12.
//  Copyright (c) 2012 PDAgent, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize duckView;
@synthesize duckDelta;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.duckDelta = -100.0f;
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
