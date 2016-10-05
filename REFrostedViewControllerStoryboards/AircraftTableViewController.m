//
//  AircraftTableViewController.m
//  Airfield-Manager
//
//  Created by Terry on 9/7/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "AircraftTableViewController.h"
#import "AircraftDatabase.h"
#import "AircraftInfo.h"
#import "AircraftDetailViewController.h"


@interface AircraftTableViewController ()

@end

@implementation AircraftTableViewController
@synthesize details = _details;
@synthesize aircraftInfos = _aircraftInfos;

- (IBAction)showMenu {
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.aircraftInfos = [AircraftDatabase database].aircraftInfos;
    self.title = @"Aircraft";
}

- (void)viewDidUnload {
    //[super viewDidUnload];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.aircraftInfos = nil;
    self.details = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_aircraftInfos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    AircraftInfo *info = [_aircraftInfos objectAtIndex:indexPath.row];
    cell.textLabel.text = info.aircraft;
    NSDecimalNumber *wsp = [NSDecimalNumber decimalNumberWithString:info.wing_span];
    NSDecimalNumber *h = [NSDecimalNumber decimalNumberWithString:@"2"];
    NSDecimalNumber *hwsp = [wsp decimalNumberByDividingBy:h];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Wingspan:%@ft ÷ 2 = %@ft, Length:%@ft",
                                 info.wing_span, hwsp.stringValue, info.length];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)dealloc
{
    self.aircraftInfos = nil;
    self.details = nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.details == nil) {
        self.details = [self.storyboard instantiateViewControllerWithIdentifier:@"aircraftDetailViewController"];
    }
    AircraftInfo *info = [_aircraftInfos objectAtIndex:indexPath.row];
    _details.uniqueId = info.uniqueId;
    [self.navigationController pushViewController:_details animated:YES];
}

@end
