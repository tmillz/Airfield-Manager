//
//  DEMONavigationController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "NavigationController.h"
#import "PageContentViewController.h"
#import "viewController.h"

@interface NavigationController (overrides)

@end

@implementation NavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
    
    UIView *vw_pan = [[UIView alloc] initWithFrame:CGRectMake(0, self.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height, 40, self.view.frame.size.height)];
    vw_pan.backgroundColor = [UIColor clearColor];
    [self.view addSubview:vw_pan];
    [vw_pan addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(hideKeyBoard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
}

#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController panGestureRecognized:sender];
}

-(void)hideKeyBoard {
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
}

-(NSUInteger)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
    return navigationController.topViewController.supportedInterfaceOrientations;
}

- (BOOL)shouldAutorotate
{
    id currentViewController = self.topViewController;
    
    if ([currentViewController isKindOfClass:[ViewController class]])
        return NO;
    
    return YES;
}

@end
