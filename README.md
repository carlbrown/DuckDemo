
Demo for [KidsCodeCamp at RailsConf 2012](https://github.com/kidscodecamp/railsconf2012/wiki)

Quick game to shoot a rubber duck.  Illustrates a number of iOS programming features.

Basic outline:
Duck Tutorial Outline Draft

1. Xcode->File->New Project
    - 1.1 use ARC
2. [Optional/Traditional] "Hello, World"
    - 2.1 Open XIB
    - 2.2 Add UILabel
    - 2.3 Add @"Hello, World" as label.text (in IB)
    - 2.4 Build->Run
3. Duck Type
    - 3.1 Drag "Duck.PNG" into project
    - 3.2 Open XIB
    - 3.3 Add UIImageView
    - 3.4 Change UIImageView.image to be "Duck.PNG"
    - 3.5 Build->Run
    - 3.6 Yell at duck to "Move!", watch duck ignore you
4. Duck moving
    - 4.1 Open XIB
    - 4.2 Open ViewController.h in Assistant
    - 4.3 Ctrl-Drag duck to header to make property
    - 4.4 Open ViewController.m
    - 4.5 make "-(IBAction) moveDuck:(id) sender" method
        * 4.5.1 Changes Duck's Frame's X value
    - 4.6 ReOpen XIB
    - 4.7 Make "Move Duck" button
    - 4.8 Wire "Move Duck" button to @selector(moveDuck:)
    - 4.9 Build->Run
    - 4.10 Hit button to move duck
    - 4.11 Repeat until Duck moves off screen
    - 4.12 Yell at duck to "Come Back Here!"
5. Duck bounds
    - 5.1 open View Controller
    - 5.2 go to moveDuck: method
    - 5.3 Make duck reverse direction when it hits the edge of the screen
    - 5.4 Build->Run
    - 5.5 Hit button until duck moves back and forth
    - 5.6 Complain about button-pushing being tiring
6. Auto-move
    - 6.0 Setup
        * 6.0.1 Add QuartzCore Framework
        * 6.0.2 #import <QuartzCore/QuartzCore.h>
    - 6.1 Open View Controller
    - 6.2 Create CADisplayLink *timer property
    - 6.3 Open viewDidLoad
    - 6.4 Wire timer to Duck:
        * 6.4.1 timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(moveDuck:)];
        * [timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    - 6.5 Build->Run
    - 6.6 Watch duck move
    - 6.7 Comment button is now useless
7. Dead Duck
    - 7.1 Drag "DeadDuck.PNG" into project
    - 7.2 Open VC
    - 7.3 Create "-(IBAction) killDuck:(id) sender" method
        * 7.3.1 disable timer (to stop movement)
        * 7.3.2 replace imageView.image with DeadDuck.PNG
    - 7.4 Rewire screen button from moveDuck: to killDuck:
    - 7.5 Change text on Button
    - 7.6 Build->Run
    - 7.7 Push button, observe dead duck
    - 7.8 comment on how that isn't very sporting
8. Bullet Time
    - 8.1 drag in bullet.PNG to project
    - 8.2 open VC
    - 8.3 make UIImageView bulletView property
    - 8.4 make "-(IBAction) startBullet:(id) sender" method
        * 8.4.1 creates new UIImageView
        * 8.4.2 sets image to be bullet
        * 8.4.3 sets starting frame to be bottom of screen
        * 8.4.4 assigns self.bulletView to new View
        * 8.4.5 [self.view addSubview:self.bulletView] if needed.
    - 8.5 Wire button to startBullet:
    - 8.6 Build->Run
    - 8.7 Press button
    - 8.8 Yell at bullet to move
9. Move bullet
    - 9.1 change name of moveDuck to moveDuckAndBullet
        * 9.1.1 Be sure and change the selector where it's called as well
    - 9.2 make moveDuckAndBullet change bullet's frame's Y coordinate
    - 9.3 make moveDuckAndBullet detect when it moves off top of screen
        * 9.3.1 remove bullet from superview
        * 9.3.2 set self.bulletView to nil
    - 9.4 Build->Run
    - 9.5 Press button
    - 9.6 watch bullet pass through duck
10. Collision Detection
    - 10.1 Make "-(BOOL) isDuckHit" method
        * 10.1.1 return NO if bullet is nil
        * 10.1.2 return YES if CGRectIntersectsRect(duckView.frame,bulletView.frame)
        * 10.1.3 return NO otherwise
    - 10.2 Have moveDuckAndBullet call isDuckHit
        * 10.2.1 Call killDuck if Duck is hit
    - 10.3 Build->Run
    - 10.4 Push Button
    - 10.5 Kill Duck
11. Add sound on dead duck
    - 10.1 Drag Quack.WAV into project
    - 10.2 Include AudioToolbox Framework
    - 10.3 #import <AudioToolbox/AudioServices.h>
    - 10.4 Add Audio Code
        * SystemSoundID quackSound;
        * AudioServicesCreateSystemSoundID((__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:@"quack" withExtension:@"wav"], &quackSound);
        * AudioServicesPlaySystemSound(quackSound);
