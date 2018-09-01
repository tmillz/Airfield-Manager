//
//  LocationTableViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 2/12/16.
//  Copyright © 2016 Terrance Miller. All rights reserved.
//

#import "LocationTableViewController.h"
#import "DiscViewController.h"
#import "LocationInfo.h"
#import "REFrostedViewController.h"
#import "LocationDetailViewController.h"

@interface LocationTableViewController ()

@end

@implementation LocationTableViewController

@synthesize locationInfos = _locationInfos;
@synthesize details = _details;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationInfos = [DiscViewController locationsDB].locationInfos;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}

- (void)viewWillAppear:(BOOL)animated{
    self.locationInfos = [DiscViewController locationsDB].locationInfos;
        [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.parentViewController.navigationItem setTitle:@"Markers"];
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewDidUnload {
    self.locationInfos = nil;
}

-(void)dealloc {
    self.locationInfos = nil;
    self.details = nil;
}

#pragma mark - Table view data source

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES; //tableview must be editable or nothing will work...
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LocationInfo *info = [_locationInfos objectAtIndex:indexPath.row];
    
    UITableViewRowAction *button = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
            DiscViewController *delete = [[DiscViewController alloc] init];
            [delete deleteLocation:info.uniqueId];
            [_locationInfos removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];
    button.backgroundColor = [UIColor redColor]; //arbitrary color
    /*UITableViewRowAction *button2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
            NSLog(@"Action to perform with Button2!");
            DiscViewController *delete = [[DiscViewController alloc] init];
            [delete deleteLocation:info.uniqueId];
        [_locationInfos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];
    button2.backgroundColor = [UIColor redColor]; //arbitrary color*/
    
    return @[button]; //array with all the buttons you want. 1,2,3, etc...
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_locationInfos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    
    // Configure the cell...
    
    LocationInfo *info = [_locationInfos objectAtIndex:indexPath.row];
    cell.textLabel.text = info.field_disc;
    //NSDecimalNumber *lat = [NSDecimalNumber decimalNumberWithString:info.field_lat];
    //NSDecimalNumber *lng = [NSDecimalNumber decimalNumberWithString:info.field_lng];
    NSString *name = [NSString stringWithFormat:@"%@", info.field_name];
    NSString *date = [NSString stringWithFormat:@"%@",info.field_date];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"ID'd By: %@    Date: %@", name, date];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.details == nil) {
        self.details = [self.storyboard instantiateViewControllerWithIdentifier:@"locationDetailViewController"];
    } else {
        
    }
    LocationInfo *info = [_locationInfos objectAtIndex:indexPath.row];
    _details.uniqueId = info.uniqueId;
    [self.navigationController pushViewController:_details animated:YES];
}

@end
