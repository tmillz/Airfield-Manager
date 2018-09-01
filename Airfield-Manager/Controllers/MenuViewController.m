//
//  MenuViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "MenuViewController.h"
#import "HomeViewController.h"
#import "SecondViewController.h"
#import "UIViewController+REFrostedViewController.h"
#import "NavigationController.h"
#import <MessageUI/MessageUI.h>
#import "SVWebViewController.h"
#import "SVModalWebViewController.h"

@interface MenuViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _icons = @[@"ic_action_paste.png",
               @"ic_action_airplane_mode_on.png",
               @"ic_calculator.png",
               @"ic_calculator.png",
               @"ic_action_warning.png",
               @"ic_calculator.png",
               @"ic_action_web_site.png",
               @"ic_action_map.png",
               @"ic_action_paste.png",
               @"ic_action_email.png"];
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 70.0f)];
        view.backgroundColor = [UIColor colorWithRed:244/255.0 green:212/255.0 blue:66/255.0 alpha:1.0];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 40, 20)];
        label.text = @"Airfield Manager";
        label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:23];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        [label sizeToFit];
        [label setCenter:view.center];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        //[view addSubview:imageView];
        [view addSubview:label];
        view;
    });
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex {
    if (sectionIndex == 0)
        return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.6f];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 0, 0)];
    label.text = @"Friends Online";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    [view addSubview:label];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex {
    if (sectionIndex == 0)
        return 0;
    
    return 34;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        HomeViewController *homeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
        navigationController.viewControllers = @[homeViewController];
        self.frostedViewController.contentViewController = navigationController;
        [self.frostedViewController hideMenuViewController];
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        HomeViewController *AircraftTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"aircraftTableController"];
        navigationController.viewControllers = @[AircraftTableViewController];
        self.frostedViewController.contentViewController = navigationController;
        [self.frostedViewController hideMenuViewController];
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        HomeViewController *ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController"];
        navigationController.viewControllers = @[ViewController];
        self.frostedViewController.contentViewController = navigationController;
        [self.frostedViewController hideMenuViewController];
    } else if (indexPath.section == 0 && indexPath.row == 3){
        HomeViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarController"];
        navigationController.viewControllers = @[tabBarController];
        self.frostedViewController.contentViewController = navigationController;
        [self.frostedViewController hideMenuViewController];
    } else if (indexPath.section == 0 && indexPath.row == 4) {
        SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:@"https://www.notams.faa.gov"];
        [self.frostedViewController.contentViewController presentViewController:webViewController animated:YES completion:NULL];
    } else if (indexPath.section == 0 && indexPath.row == 5) {
        HomeViewController *bowmonkViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"bowmonkController"];
        navigationController.viewControllers = @[bowmonkViewController];
        self.frostedViewController.contentViewController = navigationController;
        [self.frostedViewController hideMenuViewController];
    } else if (indexPath.section == 0 && indexPath.row == 6) {
        HomeViewController *linksViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"linksController"];
        navigationController.viewControllers = @[linksViewController];
        self.frostedViewController.contentViewController = navigationController;
        [self.frostedViewController hideMenuViewController];
    } else if (indexPath.section == 0 && indexPath.row == 7) {
        HomeViewController *MapTabViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MapTabBarController"];
        navigationController.viewControllers = @[MapTabViewController];
        self.frostedViewController.contentViewController = navigationController;
        [self.frostedViewController hideMenuViewController];
    } else if (indexPath.section == 0 && indexPath.row == 8) {
        HomeViewController *FormsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"formsController"];
        navigationController.viewControllers = @[FormsViewController];
        self.frostedViewController.contentViewController = navigationController;
        [self.frostedViewController hideMenuViewController];
    } else {
        [self sendEmail:self];
    }
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54;
}

// Edit Return number if you change the number of items in the menu
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    long row = [indexPath row];
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"Regulations", @"Aircraft", @"Imaginary Surfaces", @"Calculators", @"Notams", @"BowMonk Converter", @"Links", @"Map", @"Forms", @"Email Developer"];
        cell.textLabel.text = titles[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:_icons[row]];
    }
    return cell;
}

#pragma mark - IBAction methods
- (IBAction)sendEmail:(id)sender {
    //email subject
    NSString * subject = @"iOS Airfield Manager App";
    //email body
    NSString * body = @"Feedback";
    //recipient(s)
    NSArray * recipients = [NSArray arrayWithObjects:@"terrymil1981@gmail.com", nil];
    
    //create the MFMailComposeViewController
    MFMailComposeViewController * composer = [[MFMailComposeViewController alloc] init];
    composer.mailComposeDelegate = self;
    [composer setSubject:subject];
    [composer setMessageBody:body isHTML:NO];
    //[composer setMessageBody:body isHTML:YES]; //if you want to send an HTML message
    [composer setToRecipients:recipients];
    
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:composer                                                                                                    animated:YES completion:NULL];

}

#pragma mark - MFMailComposeViewControllerDelegate methods
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled"); break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved"); break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent"); break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]); break;
        default:
            break;
    }
    
    // close the Mail Interface
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] dismissViewControllerAnimated:YES completion:NULL];
}
 
@end
