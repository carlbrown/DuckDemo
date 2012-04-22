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

-(IBAction) moveDuck:(id) sender {
  CGRect frame=  self.duckView.frame;
  
  frame.origin.x -= 100;
  
  self.duckView.frame = frame;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
