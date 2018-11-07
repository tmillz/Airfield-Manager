//
//  ETLTableViewController.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UXReader/UXReader.h>
#import "REFrostedViewController.h"

@class MFDocumentManager;

@interface ETLTableViewController : UITableViewController <UIDocumentInteractionControllerDelegate, UXReaderViewControllerDelegate>

-(IBAction)actionOpenPlainDocument:(id)sender;

@end
