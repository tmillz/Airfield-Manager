//
//  FormsWebViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 12/19/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "FormsViewController.h"

NSString *document;

@interface FormsViewController ()

@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;
@property (nonatomic, strong) QLPreviewController *previewController;

@end

@implementation FormsViewController

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}


- (IBAction)showMenu {
    // Dismiss keyboard (optional)
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    [self.frostedViewController presentMenuViewController];
}

- (IBAction)openWorkOrder {
    //document = @"332";
    //[self actionOpenPlainDocument:document];
    
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"332" withExtension:@"pdf"];
    
    if (URL) {
    // Initialize Document Interaction Controller
    self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
    
    // Configure Document Interaction Controller
    [self.documentInteractionController setDelegate:self];
    
    // Present Open In Menu
    //[self.documentInteractionController presentOptionsMenuFromRect:[button frame] inView:self.view animated:YES];
    [self.documentInteractionController presentPreviewAnimated:YES];
    
    }
}

- (IBAction)openFlightPlan {
    //document = @"dd175";
    //[self actionOpenPlainDocument:document];
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"dd175" withExtension:@"pdf"];
    
    if (URL) {
        // Initialize Document Interaction Controller
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        
        // Present Open In Menu
        //[self.documentInteractionController presentOptionsMenuFromRect:[button frame] inView:self.view animated:YES];
        [self.documentInteractionController presentPreviewAnimated:YES];
        
    }
}

-(IBAction)actionOpenPlainDocument:(id)sender{
    /** Set document name */
    NSString *documentName = [NSString stringWithFormat:@"%@",document];
    
    /** Get temporary directory to save thumbnails */
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    /** Set thumbnails path */
    NSString *thumbnailsPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",documentName]];
    
    /** Get document from the App Bundle */
    NSURL *documentUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:documentName ofType:@"pdf"]];
    
    /** Instancing the documentManager */
    MFDocumentManager *documentManager = [[MFDocumentManager alloc]initWithFileUrl:documentUrl];
    
    /** Instancing the readerViewController */
    ReaderViewController *pdfViewController = [[ReaderViewController alloc]initWithDocumentManager:documentManager];
    
    /** Set resources folder on the manager */
    documentManager.resourceFolder = thumbnailsPath;
    
    /** Set document id for thumbnail generation */
    pdfViewController.documentId = documentName;
    
    /** Present the pdf on screen in a modal view */
    [self presentViewController:pdfViewController animated:YES completion:nil];
    
    /** Release the pdf controller*/
    //[pdfViewController release];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
