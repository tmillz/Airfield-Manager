//
//  MAJCOMTableViewController.m
//  Airfield-Manager
//
//  Created by Terry on 9/26/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "MAJCOMTableViewController.h"

NSString *document;

@interface MAJCOMTableViewController ()

@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;
@property (nonatomic, strong) QLPreviewController *previewController;

@end

@implementation MAJCOMTableViewController

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
    return 16;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"AFI 13-204v1 ACCSUP I",
                            @"AFI 13-204v1 AFMCSUP I",
                            @"AFI 13-204v1 AFSPCSUP",
                            @"AFI 13-204v1 PACAFSUP I",
                            @"AFI 13-204v1 USAFESUP I",
                            @"AFI 13-204v2 ACCSUP I",
                            @"AFI 13-204v2 AFMCSUP I",
                            @"AFI 13-204v2 USAFESUP I",
                            @"AFI 13-204v3 ACCSUP I",
                            @"AFI 13-204v3 AETCSUP I",
                            @"AFI 13-204v3 AFMCSUP I",
                            @"AFI 13-204v3 AFSOCSUP",
                            @"AFI 13-204v3 AMCSUP AMCGM1",
                            @"AFI 13-204v3 AMCSUP I",
                            @"AFI 13-204v3 PACAFSUP I",
                            @"AFI 13-204v3 USAFESUP I"];
        
        cell.textLabel.text = titles[indexPath.row];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        /*NSURL *URL = [[NSBundle mainBundle] URLForResource:@"afi13_204v1_accsup" withExtension:@"pdf"];
        
        if (URL) {
            // Initialize Document Interaction Controller
            self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
            
            // Configure Document Interaction Controller
            [self.documentInteractionController setDelegate:self];
            
            // Present Open In Menu
            //[self.documentInteractionController presentOptionsMenuFromRect:[button frame] inView:self.view animated:YES];
            [self.documentInteractionController presentPreviewAnimated:YES];
        }*/
        
        document = @"afi13_204v1_accsup";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        
        document = @"afi13_204v1_afmcsup_i";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        
        document = @"afi13_204v1_afspcsup";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        
        document = @"afi13_204v1_pacafsup_i";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 4) {
        
        document = @"afi13_204v1_usafesup_i";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 5) {
        
        document = @"afi13_204v2_accsup_i";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 6) {
        
        document = @"afi13_204v2_afmcsup_i";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 7) {
        
        document = @"afi13_204v2_usafesup_i";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 8) {
        
        document = @"afi13_204v3_accsup_i";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 9) {
        
        document = @"afi13_204v3_aetcsup_i";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 10) {
        
        document = @"afi13_204v3_afmcsup_i";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 11) {
        
        document = @"afi13_204v3_afsocsup";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 12) {
        
        document = @"afi13_204v3_amcsup_amcgm1";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 13) {
        
        document = @"afi13_204v3_amcsup_i";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 14) {
        
        document = @"afi13_204v3_pacafsup_i";
        [self actionOpenPlainDocument:document];
        
    } else if (indexPath.section == 0 && indexPath.row == 15) {
        
        document = @"afi13_204v3_usafesup_i";
        [self actionOpenPlainDocument:document];
        
    } else {
        
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
