//
//  ViewController.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;

- (IBAction)showMenu;

@end
