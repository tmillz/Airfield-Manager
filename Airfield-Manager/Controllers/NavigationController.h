//
//  NavigationController.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "PageContentViewController.h"
#import "ViewController.h"

@interface NavigationController : UINavigationController

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender;

@end
