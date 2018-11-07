//
//  FAATableViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "FAATableViewController.h"

NSString *documentFAA;

@interface FAATableViewController ()

@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;

@end

@implementation FAATableViewController

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
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"AC 150/5200-18 Airport Safety Self-Inspection",
                            @"AC 150/5300-13 Airport Design",
                            @"AC 150/5340-1, Standards for Airport Markings",
                            @"AC 150/5340-18 Standards for Airport Sign Systems",
                            @"AC 150/5345-44 Specs: Taxiway & Runway Signs"];
        
        cell.textLabel.text = titles[indexPath.row];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        documentFAA = @"AC150_5200_18C";
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        
        documentFAA = @"AC150_5300_13A_chg1_interactive";
        
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        
        documentFAA = @"AC150_5340_1l";
        
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        
        documentFAA = @"AC150_5200_18C";
        
    } else if (indexPath.section == 0 && indexPath.row == 4) {
        
        documentFAA = @"AC150_5345_44j";
        
    } else {
        
    }
    [self actionOpenPlainDocument:documentFAA];
}

-(IBAction)actionOpenPlainDocument:(id)sender{
    
    NSString *documentName = [NSString stringWithFormat:@"%@",documentFAA];
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
