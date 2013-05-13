//
//  DemoViewController.m
//  MFSideMenuDemoStoryboard
//
//  Created by Michael Frederick on 4/9/13.
//  Copyright (c) 2013 Michael Frederick. All rights reserved.
//

#import "DemoViewController.h"
#import "MFSideMenuContainerViewController.h"

@implementation DemoViewController

@synthesize animationTypeSegmentedControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setAnimationTypeFromSelectedSegment];
    [self.animationTypeSegmentedControl addTarget:self action:@selector(setAnimationTypeFromSelectedSegment)
                                 forControlEvents:UIControlEventValueChanged];
}

- (MFSideMenuContainerViewController *)menuContainerViewController {
    return (MFSideMenuContainerViewController *)self.navigationController.parentViewController;
}

- (IBAction)showLeftMenuPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (IBAction)showRightMenuPressed:(id)sender {
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}

- (void)setAnimationTypeFromSelectedSegment {
    MFSideMenuOpenCloseMenuAnimation animation;
    switch (self.animationTypeSegmentedControl.selectedSegmentIndex) {
        case 0:
            animation = MFSideMenuOpenCloseMenuAnimationSlide;
            break;
        case 1:
            animation = MFSideMenuOpenCloseMenuAnimationFade;
            break;
        default:
            animation = MFSideMenuOpenCloseMenuAnimationNone;
            break;
    }
    
    [[self menuContainerViewController] setOpenCloseMenuAnimation:animation];
}

@end
