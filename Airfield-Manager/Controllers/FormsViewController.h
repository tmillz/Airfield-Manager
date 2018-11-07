//
//  FormsWebViewController.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 12/19/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UXReader/UXReader.h>
#import "REFrostedViewController.h"

@interface FormsViewController : UIViewController <UIDocumentInteractionControllerDelegate, UXReaderViewControllerDelegate>

//@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIButton *workOrder;
@property (nonatomic, retain) IBOutlet UIButton *flightPlan;

- (IBAction)showMenu;
- (IBAction)openWorkOrder;
- (IBAction)openFlightPlan;

@end
