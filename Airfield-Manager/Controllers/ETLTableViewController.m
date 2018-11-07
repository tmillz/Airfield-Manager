//
//  ETLTableViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "ETLTableViewController.h"

NSString *document;

@interface ETLTableViewController ()

@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;

@end

@implementation ETLTableViewController

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
        NSArray *titles = @[@"ETL 01-20 Guidelines for Airfield Frangibility Zone",
                            @"ETL 02-19 Airfield Pavement Evaluation Standards and Procedures",
                            @"ETL 04-2 Standard Airfield Pavment Marking Schemes",
                            @"ETL 04-9 Pavment Engineering Assesment (EA) Standards",
                            @"ETL 07-3 Jet Engine Thrust Standoff Requirements for Airfield Asphalt Edge Pavments",
                            @"ETL 97-17 Guide Specifications - Paint and Rubber Removal from Roadway and Airfield Pavements"];
        
        cell.textLabel.text = titles[indexPath.row];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        document = @"etl_01_20";
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        
        document = @"etl_02_19";
        
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        
        document = @"etl_04_2";
        
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        
        document = @"etl_04_9";
        
    } else if (indexPath.section == 0 && indexPath.row == 4) {
        
        document = @"etl_07_3";
        
    } else if (indexPath.section == 0 && indexPath.row == 5) {
        
        document = @"etl_97_17";
        
    } else {
        
    }
    
    [self actionOpenPlainDocument:document];
}

-(IBAction)actionOpenPlainDocument:(id)sender{
    
    NSString *documentName = [NSString stringWithFormat:@"%@",document];
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
