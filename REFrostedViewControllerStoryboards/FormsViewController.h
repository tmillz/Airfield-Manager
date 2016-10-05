//
//  FormsWebViewController.h
//  Airfield-Manager
//
//  Created by Terry on 12/19/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FastPdfKit/FastPdfKit.h>
#import "REFrostedViewController.h"
#import "QuickLook/Quicklook.h"

@interface FormsViewController : UIViewController <UIDocumentInteractionControllerDelegate, QLPreviewControllerDelegate>

//@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIButton *workOrder;
@property (nonatomic, retain) IBOutlet UIButton *flightPlan;

- (IBAction)showMenu;
- (IBAction)openWorkOrder;
- (IBAction)openFlightPlan;

@end
