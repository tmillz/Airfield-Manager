//
//  MapTabViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 2/9/16.
//  Copyright © 2016 Terrance Miller. All rights reserved.
//

#import "MapTabViewController.h"
#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "PanAnimationController.h"

@interface MapTabViewController ()
@end

@implementation MapTabViewController {
    PanAnimationController *_animationController;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.delegate = (id)self;
        
        // create the interaction / animation controllers
        _animationController = [PanAnimationController new];
    }
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC {
    
    NSUInteger fromVCIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSUInteger toVCIndex = [tabBarController.viewControllers indexOfObject:toVC];
    
    _animationController.reverse = fromVCIndex > toVCIndex;
    return _animationController;
}

- (IBAction)showMenu {
    // Dismiss keyboard (optional)
    //
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.frostedViewController.panGestureRecognizer.cancelsTouchesInView = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

