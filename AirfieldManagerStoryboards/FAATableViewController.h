//
//  FAATableViewController.h
//  Airfield-Manager
//
//  Created by Terry on 9/26/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FastPdfKit/FastPdfKit.h>
#import "REFrostedViewController.h"
#import "QuickLook/Quicklook.h"

@interface FAATableViewController : UITableViewController <UIDocumentInteractionControllerDelegate, QLPreviewControllerDelegate>

-(IBAction)actionOpenPlainDocument:(id)sender;

@end

