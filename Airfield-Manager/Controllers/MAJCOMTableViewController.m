//
//  MAJCOMTableViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "MAJCOMTableViewController.h"

NSString *documentM;

@interface MAJCOMTableViewController ()

@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;

@end

@implementation MAJCOMTableViewController

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

        documentM = @"afi13_204v1_accsup";
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        
        documentM = @"afi13_204v1_afmcsup_i";
        
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        
        documentM = @"afi13_204v1_afspcsup";
        
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        
        documentM = @"afi13_204v1_pacafsup_i";
        
    } else if (indexPath.section == 0 && indexPath.row == 4) {
        
        documentM = @"afi13_204v1_usafesup_i";
        
    } else if (indexPath.section == 0 && indexPath.row == 5) {
        
        documentM = @"afi13_204v2_accsup_i";
        
    } else if (indexPath.section == 0 && indexPath.row == 6) {
        
        documentM = @"afi13_204v2_afmcsup_i";
        
    } else if (indexPath.section == 0 && indexPath.row == 7) {
        
        documentM = @"afi13_204v2_usafesup_i";
        
    } else if (indexPath.section == 0 && indexPath.row == 8) {
        
        documentM = @"afi13_204v3_accsup_i";
        
    } else if (indexPath.section == 0 && indexPath.row == 9) {
        
        documentM = @"afi13_204v3_aetcsup_i";
        
    } else if (indexPath.section == 0 && indexPath.row == 10) {
        
        documentM = @"afi13_204v3_afmcsup_i";
        
    } else if (indexPath.section == 0 && indexPath.row == 11) {
        
        documentM = @"afi13_204v3_afsocsup";
        
    } else if (indexPath.section == 0 && indexPath.row == 12) {
        
        documentM = @"afi13_204v3_amcsup_amcgm1";
        
    } else if (indexPath.section == 0 && indexPath.row == 13) {
        
        documentM = @"afi13_204v3_amcsup_i";
        
    } else if (indexPath.section == 0 && indexPath.row == 14) {
        
        documentM = @"afi13_204v3_pacafsup_i";
        
    } else if (indexPath.section == 0 && indexPath.row == 15) {
        
        documentM = @"afi13_204v3_usafesup_i";
        
    } else {
        
    }
    
    [self actionOpenPlainDocument:documentM];
}

-(IBAction)actionOpenPlainDocument:(id)sender{
    
    NSString *documentName = [NSString stringWithFormat:@"%@",documentM];
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
