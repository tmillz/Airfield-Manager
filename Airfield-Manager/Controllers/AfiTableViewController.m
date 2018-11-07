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

@end

@implementation AfiTableViewController

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
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

        documentA = @"afi13_204v3_1";
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        
        documentA = @"afi13_204v2";
        
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        
        documentA = @"afi13_204v1";
        
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        
        documentA = @"afi13_213_1";
        
    } else if (indexPath.section == 0 && indexPath.row == 4) {
        
        documentA = @"afi11_208_ip";
        
    } else if (indexPath.section == 0 && indexPath.row == 5) {
        
        documentA = @"afjman11_213";
        
    } else if (indexPath.section == 0 && indexPath.row == 6) {
        
        documentA = @"afi11_218";
        
    } else if (indexPath.section == 0 && indexPath.row == 7) {
        
        documentA = @"afi13_217";
        
    } else if (indexPath.section == 0 && indexPath.row == 8) {
        
        documentA = @"afi10_1001";
        
    } else if (indexPath.section == 0 && indexPath.row == 9) {
        
        documentA = @"afi10_1801";

    } else if (indexPath.section == 0 && indexPath.row == 10) {
        
        documentA = @"afman32_1084";
        
    } else if (indexPath.section == 0 && indexPath.row == 11) {
        
        documentA = @"afpam91_212";
        
    } else if (indexPath.section == 0 && indexPath.row == 12) {
        
        documentA = @"afi32_1041";
        
    } else if (indexPath.section == 0 && indexPath.row == 13) {
        
        documentA = @"afi32_1043";
        
    } else {
    
    }
    [self actionOpenPlainDocument:documentA];
}

-(IBAction)actionOpenPlainDocument:(id)sender{

    NSString *documentName = [NSString stringWithFormat:@"%@",documentA];
    NSURL *documentUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:documentName ofType:@"pdf"]];
    UXReaderDocument *document = [[UXReaderDocument alloc] initWithURL:documentUrl];
    UXReaderViewController *readerViewController = [[UXReaderViewController alloc] init];
    [readerViewController setDelegate:self];
    [readerViewController setDocument:document];
    [readerViewController setDisplayMode:UXReaderDisplayModeSinglePageScrollH];
    
    [self presentViewController:readerViewController animated:YES completion: nil];
}

- (void)dismissReaderViewController:(UXReaderViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion: nil];
}

@end
