//
//  UFCTableViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "UFCTableViewController.h"

NSString *documentU;

@interface UFCTableViewController ()

@end

@implementation UFCTableViewController

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
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"UFC 3-260-1 Airfield Heliport Plannig and Design",
                            @"UFC 3-260-2 Pavement Design for Airfields",
                            @"UFC 3-260-3 Airfield Pavement Evaluation",
                            @"UFC 3-270-05 Paver Concrete Surfaced Airfields Pavement Condition Index (PCI)",
                            @"UFC 3-270-6 O&M: Paver Asphalt Surfaced Airfields Pavment Condition Index (PCI)",
                            @"UFC 3-535-01 Visual Air Navigation Facilities"];
        
        cell.textLabel.text = titles[indexPath.row];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        documentU = @"ufc_3_260_01";
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        
        documentU = @"ufc_3_260_02";
        
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        
        documentU = @"ufc_3_260_03";
        
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        
        documentU = @"ufc_3_270_05";
        
    } else if (indexPath.section == 0 && indexPath.row == 4) {
        
        documentU = @"ufc_3_270_06";
        
    } else if (indexPath.section == 0 && indexPath.row == 5) {
        
        documentU = @"ufc_3_535_01";
        
    } else {
        
    }
    [self actionOpenPlainDocument:documentU];
}

-(IBAction)actionOpenPlainDocument:(id)sender{
    
    NSString *documentName = [NSString stringWithFormat:@"%@",documentU];
    NSURL *documentUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:documentName ofType:@"pdf"]];
    UXReaderDocument *document = [[UXReaderDocument alloc] initWithURL:documentUrl];
    UXReaderViewController *readerViewController = [[UXReaderViewController alloc] init];
    [readerViewController setDelegate:self];
    [readerViewController setDocument:document];
    [readerViewController setDisplayMode:UXReaderDisplayModeSinglePageScrollH];
    
    [self presentViewController:readerViewController animated:YES completion:nil];
}

- (void)dismissReaderViewController:(UXReaderViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion: nil];
}

@end
