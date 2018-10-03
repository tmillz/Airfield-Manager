//
//  AfiTableViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "AfiTableViewController.h"

NSString *documentA;

@interface AfiTableViewController ()

//@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;
//@property (nonatomic, strong) QLPreviewController *previewController;

@end

@implementation AfiTableViewController

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 14;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //long row = [indexPath row];
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"AFI 13-204v3 Airfield Operations",
                            @"AFI 13-204v2 Airfield Operations Standardizations and Operations",
                            @"AFI 13-204v1 Airfield Operations Carrier Field Developement",
                            @"AFI 13-213 Airfield Driving",
                            @"AFI 11-208IP Department of Defense Notice to Airmen (NOTAM) System",
                            @"AFJM 11-213 Military Flight Data and Telecommunications System",
                            @"AFI 11-218 Aircraft Movement and Operations on the Ground",
                            @"AFI 13-217 Drop Zone and Landing Zone Operations",
                            @"AFI 10-1001 Civil Aircraft Landing Permits",
                            @"AFI 10-1801 Foreign Gov Aircraft Landings at USAF Installations",
                            @"AFMAN 32-1084 Civil Engineering",
                            @"AFPAM 91-212 Bird/Wildlife Aircraft Strike Hazard (BASH) Management Techniques",
                            @"AFI 32-1041 Airfield Pavement Evaluation Program",
                            @"AFI 32-1043 Managing, Operating and Maintaining Aircraft Arresting Systems"];
        
        cell.textLabel.text = titles[indexPath.row];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        //NSURL *URL = [[NSBundle mainBundle] URLForResource:@"afi13_204v3" withExtension:@"pdf"];
        
       // if (URL) {
            // Initialize Document Interaction Controller
            //self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
            
            // Configure Document Interaction Controller
            //[self.documentInteractionController setDelegate:self];
            
            // Present Open In Menu
            //[self.documentInteractionController presentOptionsMenuFromRect:[button frame] inView:self.view animated:YES];
            //[self.documentInteractionController presentPreviewAnimated:YES];

        //}
        documentA = @"afi13_204v3_1";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        
        documentA = @"afi13_204v2";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        
        documentA = @"afi13_204v1";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        
        documentA = @"afi13_213_1";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 4) {
        
        documentA = @"afi11_208_ip";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 5) {
        
        documentA = @"afjman11_213";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 6) {
        
        documentA = @"afi11_218";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 7) {
        
        documentA = @"afi13_217";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 8) {
        
        documentA = @"afi10_1001";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 9) {
        
        documentA = @"afi10_1801";
        [self actionOpenPlainDocument:documentA];

    } else if (indexPath.section == 0 && indexPath.row == 10) {
        
        documentA = @"afman32_1084";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 11) {
        
        documentA = @"afpam91_212";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 12) {
        
        documentA = @"afi32_1041";
        [self actionOpenPlainDocument:documentA];
        
    } else if (indexPath.section == 0 && indexPath.row == 13) {
        
        documentA = @"afi32_1043";
        [self actionOpenPlainDocument:documentA];
        
    } else {
    }
    
}

-(IBAction)actionOpenPlainDocument:(id)sender{
    /** Set document name */
    NSString *documentName = [NSString stringWithFormat:@"%@",documentA];

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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
