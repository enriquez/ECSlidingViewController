//
//  FirstTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "FirstTopViewController.h"
#import "SecondTopViewController.h"

@implementation FirstTopViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
    // You just need to set the opacity, radius, and color.
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    if (![self.slidingViewController.underRightViewController isKindOfClass:[UnderRightViewController class]]) {
        self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UnderRight"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)revealUnderRight:(id)sender
{
    SecondTopViewController *secondTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondTop"];
    secondTopViewController.view.frame = self.slidingViewController.view.bounds;
    secondTopViewController.view.alpha = 0;
    
    // temporarily add the second top view so that we can animate it in.
    [self.slidingViewController.view addSubview:secondTopViewController.view];
    
    [UIView animateWithDuration:0.5 animations:^{
        secondTopViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        // remove the second top view.
        [secondTopViewController.view removeFromSuperview];
        
        // let sliding view controlller take over from here
        self.slidingViewController.topViewController = secondTopViewController;
    }];
}

@end