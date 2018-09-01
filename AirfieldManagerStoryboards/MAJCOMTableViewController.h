//
//  MAJCOMTableViewController.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FastPdfKit/FastPdfKit.h>
#import "REFrostedViewController.h"
#import "QuickLook/Quicklook.h"

@interface MAJCOMTableViewController : UITableViewController <UIDocumentInteractionControllerDelegate, QLPreviewControllerDelegate>

-(IBAction)actionOpenPlainDocument:(id)sender;

@end
