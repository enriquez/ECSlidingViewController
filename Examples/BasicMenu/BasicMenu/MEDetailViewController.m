//
//  MEDetailViewController.m
//  BasicMenu
//
//  Created by Mike Enriquez on 2/4/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import "MEDetailViewController.h"

@interface MEDetailViewController ()

@end

@implementation MEDetailViewController

- (void)awakeFromNib {
    self.splitViewController.delegate = self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc {
    NSLog(@"wut");
    barButtonItem.title = @"Master";
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    NSLog(@"yo");
    self.navigationItem.leftBarButtonItem = nil;
}

@end
