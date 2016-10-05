//
//  DEMOMenuViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import <MessageUI/MessageUI.h>
#import "SVWebViewController.h"
#import "SVModalWebViewController.h"

@interface MenuViewController : UITableViewController <MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) NSArray *icons;

@end
